package net.celloscope.antarika.redis.genericremove.v1.resource;

import javax.annotation.security.RolesAllowed;
import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.codahale.metrics.annotation.Timed;

import io.dropwizard.auth.Auth;
import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.genericremove.v1.request.RemoveSingleRequest;
import net.celloscope.antarika.redis.genericremove.v1.response.RemoveResponseBody;
import net.celloscope.antarika.redis.genericremove.v1.response.RemoveSingleResponse;
import net.celloscope.antarika.redis.genericremove.v1.service.RemoveSingleService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("redisGenericRemoveV1RemoveSingleResource")
@Path(Api.REDIS_GENERIC_REMOVE_V1_PATH)
public class RemoveSingleResource {

	private final String REQUEST_VERSION = "1.0";
	
	@Autowired 
	@Qualifier("redisGenericRemoveV1RemoveSingleService") 
	private RemoveSingleService removeSingleService;
	
	@Autowired 
	@Qualifier("headerUtil") 
	private HeaderUtil headerUtil;

	@POST
	@Timed
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path(Api.REMOVE_SINGLE_RESOURCE_PATH)
	@RolesAllowed(Api.REDIS_GENERIC_REMOVE_V1_PATH+Api.REMOVE_SINGLE_RESOURCE_PATH)
	public RemoveSingleResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid RemoveSingleRequest request) {
		String url = Api.REDIS_GENERIC_REMOVE_V1_PATH.concat(Api.REMOVE_SINGLE_RESOURCE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		RemoveSingleResponse response = getResponse(request, url);
		response = removeSingleService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private RemoveSingleResponse getResponse(RemoveSingleRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		RemoveResponseBody body = RemoveResponseBody.builder().build();
		return RemoveSingleResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
