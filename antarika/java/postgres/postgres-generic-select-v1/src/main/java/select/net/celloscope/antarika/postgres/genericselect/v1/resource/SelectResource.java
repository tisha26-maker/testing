package net.celloscope.antarika.postgres.genericselect.v1.resource;

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
import net.celloscope.antarika.postgres.genericselect.v1.request.SelectRequest;
import net.celloscope.antarika.postgres.genericselect.v1.response.SelectResponse;
import net.celloscope.antarika.postgres.genericselect.v1.response.SelectResponseBody;
import net.celloscope.antarika.postgres.genericselect.v1.service.SelectService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Path(Api.POSTGRES_GENERIC_SELECT_V1_RESOURCE)
@Component("postgresGenericSelectV1SelectResource")
public class SelectResource {

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;
	
	@Autowired
	@Qualifier("postgresGenericSelectV1SelectService")
	private SelectService selectService;

	@POST
	@Timed
	@Path(Api.POSTGRES_GENERIC_SELECT_V1_SELECT_PATH)
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	@RolesAllowed(Api.POSTGRES_GENERIC_SELECT_V1_RESOURCE+Api.POSTGRES_GENERIC_SELECT_V1_SELECT_PATH)
	public SelectResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime, @Valid SelectRequest request) {
		String url = Api.POSTGRES_GENERIC_SELECT_V1_RESOURCE.concat(Api.POSTGRES_GENERIC_SELECT_V1_SELECT_PATH);
		log.info("Resource : {}, Request received time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		SelectResponse response = getResponse(request, url);
		response = selectService.perform(user, url, requestReceivedTime, response, request);
		log.info("Resource : {}", url);
		log.info("Response ready : {}", response);
		return response;
	}

	private SelectResponse getResponse(SelectRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		SelectResponseBody body = SelectResponseBody.builder().build();
		return SelectResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}

}
