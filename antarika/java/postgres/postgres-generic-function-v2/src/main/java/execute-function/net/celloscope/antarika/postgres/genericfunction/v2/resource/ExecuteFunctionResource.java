package net.celloscope.antarika.postgres.genericfunction.v2.resource;

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
import net.celloscope.antarika.postgres.genericfunction.v2.request.ExecuteFunctionRequest;
import net.celloscope.antarika.postgres.genericfunction.v2.response.ExecuteFunctionResponse;
import net.celloscope.antarika.postgres.genericfunction.v2.response.ExecuteFunctionResponseBody;
import net.celloscope.antarika.postgres.genericfunction.v2.service.ExecuteFunctionService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("postgresGenericFunctionV2ExecuteFunctionResource")
@Path(Api.POSTGRES_GENERIC_FUNCTION_V2_PATH)
public class ExecuteFunctionResource {

	private final String REQUEST_VERSION = "1.0";
	
	@Autowired
	@Qualifier("postgresGenericFunctionV2ExecuteFunctionService")
	private ExecuteFunctionService functionService;
	
	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@POST
	@Timed
	@Path(Api.FUNCTION_RESOURCE_PATH)
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@RolesAllowed(Api.POSTGRES_GENERIC_FUNCTION_V2_PATH+Api.FUNCTION_RESOURCE_PATH)
	public ExecuteFunctionResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid ExecuteFunctionRequest request) {
		String url = Api.POSTGRES_GENERIC_FUNCTION_V2_PATH.concat(Api.FUNCTION_RESOURCE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		ExecuteFunctionResponse response = getResponse(request, url);
		response = functionService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private ExecuteFunctionResponse getResponse(ExecuteFunctionRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		ExecuteFunctionResponseBody body = ExecuteFunctionResponseBody.builder().build();
		return ExecuteFunctionResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
