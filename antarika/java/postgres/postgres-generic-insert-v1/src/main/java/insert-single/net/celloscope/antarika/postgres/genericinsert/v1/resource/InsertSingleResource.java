package net.celloscope.antarika.postgres.genericinsert.v1.resource;

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
import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertSingleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertResponseBody;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertSingleResponse;
import net.celloscope.antarika.postgres.genericinsert.v1.service.InsertSingleService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("postgresGenericInsertV1InsertSingleResource")
@Path(Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE)
public class InsertSingleResource {

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;
	
	@Autowired
	@Qualifier("postgresGenericInsertV1InsertSingleService")
	private InsertSingleService insertSingleService;

	@POST
	@Timed
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@Path(Api.POSTGRES_INSERT_SINGLE_RESOURCE_PATH)
	@RolesAllowed(Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE+Api.POSTGRES_INSERT_SINGLE_RESOURCE_PATH)
	public InsertSingleResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid InsertSingleRequest request) {
		String url = Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE.concat(Api.POSTGRES_INSERT_SINGLE_RESOURCE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		InsertSingleResponse response = getResponse(request, url);
		response = insertSingleService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private InsertSingleResponse getResponse(InsertSingleRequest request, String requestSourceService) {
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		InsertResponseBody body = InsertResponseBody.builder().build();
		return InsertSingleResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
