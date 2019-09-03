package net.celloscope.antarika.redis.genericselect.v1.resource;

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
import net.celloscope.antarika.redis.genericselect.v1.request.SelectSingleRequest;
import net.celloscope.antarika.redis.genericselect.v1.response.SelectSingleResponse;
import net.celloscope.antarika.redis.genericselect.v1.response.SelectSingleResponseBody;
import net.celloscope.antarika.redis.genericselect.v1.service.SelectSingleService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("redisGenericSelectV1SelectSingleResource")
@Path(Api.GENERIC_REDIS_SELECT_SINGLE_RESOURCE)
public class SelectSingleResource {

	private final String REQUEST_VERSION = "1.0";

	@Autowired 
	@Qualifier("redisGenericSelectV1SelectSingleService") 
	private SelectSingleService selectSingleService;
	
	@Autowired 
	@Qualifier("headerUtil") 
	private HeaderUtil headerUtil;

	@POST
	@Timed
	@Path(Api.REDIS_SELECT_SINGLE_PATH)
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@RolesAllowed(Api.GENERIC_REDIS_SELECT_SINGLE_RESOURCE+Api.REDIS_SELECT_SINGLE_PATH)
	public SelectSingleResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid SelectSingleRequest request) {
		String url = Api.GENERIC_REDIS_SELECT_SINGLE_RESOURCE.concat(Api.REDIS_SELECT_SINGLE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		SelectSingleResponse response = getResponse(request, url);
		response = selectSingleService.perform(user, url, requestReceivedTime, request, response);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private SelectSingleResponse getResponse(SelectSingleRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		SelectSingleResponseBody body = SelectSingleResponseBody.builder().build();
		return SelectSingleResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
