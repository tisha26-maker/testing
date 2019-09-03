package net.celloscope.antarika.app;

import java.io.File;
import java.io.FileReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Path;
import javax.ws.rs.ext.Provider;

import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;
import org.joda.time.DateTimeZone;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import com.codahale.metrics.health.HealthCheck;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import ch.qos.logback.classic.AsyncAppender;
import ch.qos.logback.classic.Logger;
import io.dropwizard.Application;
import io.dropwizard.auth.AuthDynamicFeature;
import io.dropwizard.auth.AuthFilter;
import io.dropwizard.auth.AuthValueFactoryProvider;
import io.dropwizard.auth.basic.BasicCredentialAuthFilter;
import io.dropwizard.jackson.Jackson;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.auth.ServiceAuthenticator;
import net.celloscope.core.auth.ServiceAuthorizer;
import net.celloscope.core.config.DropwizardConfig;
import net.celloscope.core.config.Plugin;
import net.celloscope.core.config.PluginConfig;
import net.celloscope.core.config.SpringConfig;
import net.celloscope.core.exception.mapper.UnauthorizedResourceMapper;
import net.celloscope.core.listener.SpringContextLoaderListener;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.ApplicationManager;
import net.celloscope.core.servlet.AppAdminServlet;
import net.celloscope.core.servlet.ResourceServlet;
import net.celloscope.core.util.AppUtil;

@Slf4j
public class DropWizardApp extends Application<DropwizardConfig> {

	private String appName;
	private PluginConfig pluginConfig;

	public DropWizardApp(String pluginFile) throws Exception {
		this.pluginConfig = loadConfig(pluginFile);
	}

	@SuppressWarnings("unchecked")
	public PluginConfig loadConfig(String fileName) throws Exception {
		ObjectMapper mapper = Jackson.newObjectMapper(new YAMLFactory());
		List<String> pluginUris = mapper.readValue(new FileReader(fileName), List.class);
		return this.getPlugins(pluginUris);
	}

	private PluginConfig getPlugins(List<String> pluginUris) throws Exception {
		ObjectMapper mapper = Jackson.newObjectMapper(new YAMLFactory());
		PluginConfig masterAppConfig = new PluginConfig();
		for (Object s : pluginUris) {
			URL absURL = DropWizardApp.class.getClassLoader().getResource(s.toString());
			String path = new File(absURL.toURI()).getAbsolutePath();
			PluginConfig slaveAppConfig = mapper.readValue(new FileReader(path), PluginConfig.class);
			masterAppConfig.addAll(slaveAppConfig.getPlugins());
		}
		return masterAppConfig;
	}

	@Override
	public String getName() {
		return appName;
	}

	@Override
	public void initialize(Bootstrap<DropwizardConfig> bootstrap) {
		DateTimeZone.setDefault(DateTimeZone.forID("Asia/Dhaka"));
	}

	@Override
	public void run(DropwizardConfig configuration, Environment environment) throws Exception {
		
		Logger root = (Logger)LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
	    AsyncAppender consoleAppender = (AsyncAppender) root.getAppender("async-console-appender");
	    consoleAppender.setIncludeCallerData(true);

	    AsyncAppender fileAppender = (AsyncAppender) root.getAppender("async-file-appender");
	    fileAppender.setIncludeCallerData(true);
		
		AnnotationConfigWebApplicationContext parent = new AnnotationConfigWebApplicationContext();
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();

		parent.refresh();
		parent.getBeanFactory().registerSingleton("configuration", configuration);
		parent.registerShutdownHook();
		parent.start();

		ctx.setParent(parent);
		ctx.register(SpringConfig.class);
		ctx.refresh();
		ctx.registerShutdownHook();
		ctx.start();
		
		this.appName = configuration.getApplication();
		ctx.getBean(AppUtil.class).init(this.appName);

		addAuthentication(environment, ctx);
		addHealthChecks(environment, ctx);
		addResources(environment, ctx);
		addProviders(environment, ctx);	
		
		environment.admin().addServlet("admin-servlet", new AppAdminServlet()).addMapping("");
	    environment.admin().addServlet("admin-list-resource", new ResourceServlet(ctx, this.pluginConfig)).addMapping("/list-services");
		environment.servlets().addServletListeners(new SpringContextLoaderListener(ctx));
		environment.lifecycle().manage(ctx.getBean(ApplicationManager.class));
		
	}
	
	@SuppressWarnings("rawtypes")
	private void addAuthentication(Environment environment, AnnotationConfigWebApplicationContext ctx) {
		AuthFilter basicAuthFilter = new BasicCredentialAuthFilter.Builder<User>()
				.setAuthenticator(ctx.getBean(ServiceAuthenticator.class))
				.setAuthorizer(ctx.getBean(ServiceAuthorizer.class))
				.setUnauthorizedHandler(ctx.getBean(UnauthorizedResourceMapper.class))
				.setRealm("Request are not accept without credential").setPrefix("Basic").buildAuthFilter();

		environment.jersey().register(new AuthDynamicFeature(basicAuthFilter));
		environment.jersey().register(RolesAllowedDynamicFeature.class);
		environment.jersey().register(new AuthValueFactoryProvider.Binder<User>(User.class));
		log.info("Jersey basic authentication & authorization is added");
	}

	private void addHealthChecks(Environment environment, AnnotationConfigWebApplicationContext ctx) {
		log.info("------------- Health Check -------------");
		Map<String, HealthCheck> healthChecks = ctx.getBeansOfType(HealthCheck.class);
		for (Map.Entry<String, HealthCheck> entry : healthChecks.entrySet()) {
			environment.healthChecks().register("template", entry.getValue());
			log.info("{} is added", entry.getKey());
		}
	}

	private void addResources(Environment environment, AnnotationConfigWebApplicationContext ctx) {
		log.info("------------- Rest Resource -------------");
		Map<String, Object> resources = ctx.getBeansWithAnnotation(Path.class);
		for (Map.Entry<String, Object> entry : resources.entrySet()) {
			if (isEnable(entry.getValue())) {
				environment.jersey().register(entry.getValue());
				log.info("{} is added", entry.getKey());
			}
		}
	}

	private void addProviders(Environment environment, AnnotationConfigWebApplicationContext ctx) {
		log.info("------------- Provider -------------");
		final Map<String, Object> beansWithAnnotation = ctx.getBeansWithAnnotation(Provider.class);
        for (String beanName : beansWithAnnotation.keySet()) {
            Object provider = beansWithAnnotation.get(beanName);
            environment.jersey().register(provider);
			log.info("{} is added", beanName);
        }
	}

	private boolean isEnable(Object object) {
		String ctxClass = object.getClass().getCanonicalName();
		for (Plugin plugin : this.pluginConfig.getPlugins()) {
			if (plugin.getResource().equals(ctxClass) && plugin.isEnable()) {
				return true;
			}
		}
		return false;
	}
}
