package net.celloscope.antarika.postgres.genericdelete.v1.resource;

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
import net.celloscope.antarika.postgres.genericdelete.v1.request.DeleteRequest;
import net.celloscope.antarika.postgres.genericdelete.v1.response.DeleteResponse;
import net.celloscope.antarika.postgres.genericdelete.v1.response.DeleteResponseBody;
import net.celloscope.antarika.postgres.genericdelete.v1.service.DeleteService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("postgresGenericDeleteV1DeleteResource")
@Path(Api.POSTGRES_GENERIC_DELETE_V1_PATH)
public class DeleteResource {

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("postgresGenericDeleteV1DeleteService")
	private DeleteService deleteService;
	
	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@POST
	@Timed
	@Path(Api.DELETE_RESOURCE_PATH)
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@RolesAllowed(Api.POSTGRES_GENERIC_DELETE_V1_PATH+Api.DELETE_RESOURCE_PATH)
	public DeleteResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid DeleteRequest request) {
		String url = Api.POSTGRES_GENERIC_DELETE_V1_PATH.concat(Api.DELETE_RESOURCE_PATH);
		log.info("Resource : {}, Request received Time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		DeleteResponse response = getResponse(request, url);
		response = deleteService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private DeleteResponse getResponse(DeleteRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		DeleteResponseBody body = DeleteResponseBody.builder().build();
		return DeleteResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
