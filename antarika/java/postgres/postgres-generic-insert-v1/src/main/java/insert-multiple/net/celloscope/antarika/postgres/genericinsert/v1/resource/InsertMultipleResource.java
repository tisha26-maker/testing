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
import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertMultipleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertMultipleResponse;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertMultipleResponseBody;
import net.celloscope.antarika.postgres.genericinsert.v1.service.InsertMultipleService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("postgresGenericInsertV1InsertMultipleResource")
@Path(Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE)
public class InsertMultipleResource {

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@Autowired
	@Qualifier("postgresGenericInsertV1InsertMultipleService")
	private InsertMultipleService insertMultipleService;

	@POST
	@Timed
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
	@Path(Api.POSTGRES_GENERIC_INSERT_V1_INSERT_MULTIPLE_PATH)
	@RolesAllowed({ Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE+Api.POSTGRES_GENERIC_INSERT_V1_INSERT_MULTIPLE_PATH })
	public InsertMultipleResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime,  @Valid InsertMultipleRequest request) throws InterruptedException {
		String url = Api.POSTGRES_GENERIC_INSERT_V1_RESOURCE.concat(Api.POSTGRES_GENERIC_INSERT_V1_INSERT_MULTIPLE_PATH);
		log.info("Resource : {}, Request received time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		InsertMultipleResponse response = getResponse(request, url);
		response = insertMultipleService.perform(url, REQUEST_VERSION, requestReceivedTime, request, response);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private InsertMultipleResponse getResponse(InsertMultipleRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		InsertMultipleResponseBody body = InsertMultipleResponseBody.builder().build();
		return InsertMultipleResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}
}
