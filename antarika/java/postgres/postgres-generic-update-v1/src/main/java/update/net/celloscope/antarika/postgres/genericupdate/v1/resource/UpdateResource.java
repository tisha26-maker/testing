package net.celloscope.antarika.postgres.genericupdate.v1.resource;

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
import net.celloscope.antarika.postgres.genericupdate.v1.request.UpdateRequest;
import net.celloscope.antarika.postgres.genericupdate.v1.response.UpdateResponse;
import net.celloscope.antarika.postgres.genericupdate.v1.response.UpdateResponseBody;
import net.celloscope.antarika.postgres.genericupdate.v1.service.UpdateService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("postgresGenericUpdateV1UpdateResource")
@Path(Api.POSTGRES_GENERIC_UPDATE_V1_PATH)
public class UpdateResource {

	private final String REQUEST_VERSION = "1.0";
	
	@Autowired
	@Qualifier("postgresGenericUpdateV1UpdateService")
	private UpdateService updateService;
	
	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@POST
	@Timed
	@Path(Api.UPDATE_RESOURCE_PATH)
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@RolesAllowed(Api.POSTGRES_GENERIC_UPDATE_V1_PATH+Api.UPDATE_RESOURCE_PATH)
	public UpdateResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid UpdateRequest request) {
		String url = Api.POSTGRES_GENERIC_UPDATE_V1_PATH.concat(Api.UPDATE_RESOURCE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		UpdateResponse response = getResponse(request, url);
		response = updateService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private UpdateResponse getResponse(UpdateRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		UpdateResponseBody body = UpdateResponseBody.builder().build();
		return UpdateResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
