package net.celloscope.antarika.filesystem.genericdata.v1.resource;

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
import net.celloscope.antarika.filesystem.genericdata.v1.request.SaveRequest;
import net.celloscope.antarika.filesystem.genericdata.v1.response.SaveResponse;
import net.celloscope.antarika.filesystem.genericdata.v1.response.SaveResponseBody;
import net.celloscope.antarika.filesystem.genericdata.v1.service.SaveService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("fileSystemGenericDataV1SaveResource")
@Path(Api.FILESYSTEM_GENERIC_DATA_V1_RESOURCE)
public class SaveResource{

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@Autowired
	@Qualifier("fileSystemGenericDataV1SaveService")
	private SaveService saveService;

	@POST
	@Timed
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
	@Path(Api.FILESYSTEM_GENERIC_DATA_V1_SAVE_PATH)
	@RolesAllowed({ Api.FILESYSTEM_GENERIC_DATA_V1_RESOURCE+Api.FILESYSTEM_GENERIC_DATA_V1_SAVE_PATH })
	public SaveResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime,  @Valid SaveRequest request) throws InterruptedException {

		String url = Api.FILESYSTEM_GENERIC_DATA_V1_RESOURCE.concat(Api.FILESYSTEM_GENERIC_DATA_V1_SAVE_PATH);
		log.info("Resource : {}, Request received time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		SaveResponse response = getResponse(request, url);
		response = saveService.perform(url, REQUEST_VERSION, requestReceivedTime, request, response);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private SaveResponse getResponse(SaveRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		SaveResponseBody body = SaveResponseBody.builder().build();
		return SaveResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}
}

