package net.celloscope.core.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;

import org.glassfish.jersey.server.model.Resource;
import org.springframework.context.ApplicationContext;

import com.google.common.base.Strings;
import com.google.gson.GsonBuilder;

import net.celloscope.core.config.Plugin;
import net.celloscope.core.config.PluginConfig;

@SuppressWarnings("serial")
public class ResourceServlet extends HttpServlet {

	private List<net.celloscope.core.model.Resource> resourceList = Collections.synchronizedList(new ArrayList<net.celloscope.core.model.Resource>());
	
	public ResourceServlet(ApplicationContext ctx, PluginConfig pluginConfig) {
		Map<String, Object> resources = ctx.getBeansWithAnnotation(Path.class);
		for(Plugin plugin : pluginConfig.getPlugins()){
			doMakeResource(resourceList, resources, plugin);
		}
	}
	
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	String pretty = req.getParameter("pretty");
		
    	PrintWriter out = resp.getWriter();
        try {
            resp.setContentType("application/json");
            String data = null;
            if(!Strings.isNullOrEmpty(pretty) && Boolean.valueOf(pretty) != null && Boolean.valueOf(pretty).booleanValue()){
            	data = new GsonBuilder().setPrettyPrinting().create().toJson(resourceList);
            } else {
            	data = new GsonBuilder().create().toJson(resourceList);
            }
            out.println(data);
        } finally {
        	out.close();
        }
    }

	private void doMakeResource(List<net.celloscope.core.model.Resource> list, Map<String, Object> resources, Plugin plugin) {
		for (Map.Entry<String, Object> entry : resources.entrySet()) {
			if (plugin.getResource().equals(entry.getValue().getClass().getName())) {
				getResourceUrls(list, plugin, entry.getValue());
			}
		}
	}
	
	public void getResourceUrls(List<net.celloscope.core.model.Resource> list, Plugin plugin, Object obj) {
	    Resource resource = Resource.from(obj.getClass());
	    String uriPrefix = resource.getPath();
	    for (Resource res :resource.getChildResources()) {
	        String uri = uriPrefix + res.getPath();
		    if(uri.contains("test"))
		    	continue;
			
			net.celloscope.core.model.Resource r = net.celloscope.core.model.Resource.builder()
					.enabled(plugin.isEnable())
					.resource(plugin.getResource())
					.service(uri)
					.build();
			list.add(r);
	    }
	}


}







