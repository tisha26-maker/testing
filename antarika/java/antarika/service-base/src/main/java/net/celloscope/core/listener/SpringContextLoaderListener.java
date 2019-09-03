package net.celloscope.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
public class SpringContextLoaderListener implements ServletContextListener {

	private AnnotationConfigWebApplicationContext context;

	public SpringContextLoaderListener(AnnotationConfigWebApplicationContext ctx) {
		this.context = ctx;
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		sce.getServletContext().setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, context);
		context.setServletContext(sce.getServletContext());
		log.info("Spring Context is Loaded");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		log.warn("Spring Context is Destroyed");
	}

}