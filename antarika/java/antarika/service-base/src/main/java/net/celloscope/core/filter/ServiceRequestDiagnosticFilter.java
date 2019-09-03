package net.celloscope.core.filter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Priority;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ResourceInfo;
import javax.ws.rs.core.Context;
import javax.ws.rs.ext.Provider;

import org.glassfish.jersey.message.internal.ReaderWriter;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Provider
@Priority(999)
@Component("ServiceRequestDiagnosticFilter")
public class ServiceRequestDiagnosticFilter implements ContainerRequestFilter {

	@Context
	private ResourceInfo resourceInfo;

	@Override
	public void filter(ContainerRequestContext requestContext) throws IOException {
		log.debug("------------------ Antarika Service ------------------");
		log.debug("Entering in resource : /{}", requestContext.getUriInfo().getPath());
		log.debug("Method name : {}", resourceInfo.getResourceMethod().getName());
		log.debug("Class : {}", resourceInfo.getResourceClass().getCanonicalName());
		logQueryParameters(requestContext);
		logRequestHeader(requestContext);
		String entity = readEntityStream(requestContext);
		if (null != entity && entity.trim().length() > 0) {
			log.debug("Entity stream : {}", entity);
		}
	}

	@SuppressWarnings("rawtypes")
	private void logQueryParameters(ContainerRequestContext requestContext) {
		Iterator iterator = requestContext.getUriInfo().getPathParameters().keySet().iterator();
		while (iterator.hasNext()) {
			String name = (String) iterator.next();
			List obj = requestContext.getUriInfo().getPathParameters().get(name);
			String value = null;
			if (null != obj && obj.size() > 0) {
				value = (String) obj.get(0);
			}
			log.trace("Query parameter name : {}, value : {}", name, value);
		}
	}

	@SuppressWarnings("rawtypes")
	private void logRequestHeader(ContainerRequestContext requestContext) {
		Iterator iterator;
		log.trace("---- Start Header Section of Request ----");
		log.trace("Method type : {}", requestContext.getMethod());
		iterator = requestContext.getHeaders().keySet().iterator();
		while (iterator.hasNext()) {
			String headerName = (String) iterator.next();
			String headerValue = requestContext.getHeaderString(headerName);
			log.debug("Header name: {}, header value :{} ", headerName, headerValue);
		}
		log.trace("---- End Header Section of Request ----");
	}

	private String readEntityStream(ContainerRequestContext requestContext) {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		final InputStream inputStream = requestContext.getEntityStream();
		final StringBuilder builder = new StringBuilder();
		try {
			ReaderWriter.writeTo(inputStream, outStream);
			byte[] requestEntity = outStream.toByteArray();
			if (requestEntity.length == 0) {
				builder.append("");
			} else {
				builder.append(new String(requestEntity));
			}
			requestContext.setEntityStream(new ByteArrayInputStream(requestEntity));
		} catch (IOException ex) {
			log.debug("An exception occurred while reading entity stream : {}", ex.getMessage());
		}
		return builder.toString();
	}
	
}



