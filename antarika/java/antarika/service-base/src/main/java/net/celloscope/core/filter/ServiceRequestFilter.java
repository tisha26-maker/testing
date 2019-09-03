package net.celloscope.core.filter;

import java.io.IOException;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.PreMatching;
import javax.ws.rs.ext.Provider;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.util.Constant;

@Slf4j
@Provider
@PreMatching
@Component("serviceRequestFilter")
public class ServiceRequestFilter implements ContainerRequestFilter {
 
    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {
		long requestReceivedTime = System.currentTimeMillis();
		requestContext.getHeaders().add("requestReceivedTime", String.valueOf(requestReceivedTime));
    	log.trace("Request received time : {}", DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
    }
    
}
