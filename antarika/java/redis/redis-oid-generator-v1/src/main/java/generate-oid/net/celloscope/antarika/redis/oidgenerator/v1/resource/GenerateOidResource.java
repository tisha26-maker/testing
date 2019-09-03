package net.celloscope.antarika.redis.oidgenerator.v1.resource;

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
import net.celloscope.antarika.redis.oidgenerator.v1.request.GenerateOidRequest;
import net.celloscope.antarika.redis.oidgenerator.v1.response.GenerateOidResponse;
import net.celloscope.antarika.redis.oidgenerator.v1.response.GenerateOidResponseBody;
import net.celloscope.antarika.redis.oidgenerator.v1.service.GenerateOidService;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.Api;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Component("redisOidGeneratorV1GenerateOidResource")
@Path(Api.REDIS_OID_GENERATOR_V1_RESOURCE)
public class GenerateOidResource{

	private final String REQUEST_VERSION = "1.0";

	@Autowired
	@Qualifier("headerUtil")
	private HeaderUtil headerUtil;

	@Autowired
	@Qualifier("redisOidGeneratorV1GenerateOidService")
	private GenerateOidService generateOidService;

	@POST
	@Timed
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
	@Path(Api.REDIS_OID_GENERATOR_V1_GENERATE_OID_PATH)
	@RolesAllowed({ Api.REDIS_OID_GENERATOR_V1_RESOURCE+Api.REDIS_OID_GENERATOR_V1_GENERATE_OID_PATH })
	public GenerateOidResponse onPost(@Auth User user, @HeaderParam("requestReceivedTime") long requestReceivedTime,  @Valid GenerateOidRequest request) throws InterruptedException {

		String url = Api.REDIS_OID_GENERATOR_V1_RESOURCE.concat(Api.REDIS_OID_GENERATOR_V1_GENERATE_OID_PATH);
		log.info("Resource : {}, Request received time : {}", url, DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestReceivedTime)));
		log.info("Request received : {}", request);
		GenerateOidResponse response = getResponse(request, url);
		response = generateOidService.perform(url, REQUEST_VERSION, requestReceivedTime, request, response);
		log.info("Resource : {}", url);
		log.info("Response sent : {}", response);
		return response;
	}

	private GenerateOidResponse getResponse(GenerateOidRequest request, String requestSourceService){
		ServiceResponseHeader header = headerUtil.getResponseHeader(request.getHeader(), REQUEST_VERSION, requestSourceService);
		GenerateOidResponseBody body = GenerateOidResponseBody.builder().build();
		return GenerateOidResponse.builder().header(header).meta(request.getMeta()).body(body).build();
	}
}




// this script is auto generated