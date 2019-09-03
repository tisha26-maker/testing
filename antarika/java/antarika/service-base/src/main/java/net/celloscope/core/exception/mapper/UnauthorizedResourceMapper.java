package net.celloscope.core.exception.mapper;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Component;

import io.dropwizard.auth.UnauthorizedHandler;
import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.ErrorResponse;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Constant;

@Slf4j
@Component("unauthorizedResourceMapper")
public class UnauthorizedResourceMapper implements UnauthorizedHandler {

	@Context
	private HttpServletRequest request;

	@Override
	public Response buildResponse(String prefix, String realm) {
		Response.Status unauthorized = Response.Status.UNAUTHORIZED;
		ErrorResponse errorResponse = ErrorResponse.builder().code(Code.C_403.get()).message(Constant.INVALID_CREDENTIAL).build();
		log.warn("Unauthorized access : {}", errorResponse);
		return Response.status(unauthorized).type(MediaType.APPLICATION_JSON_TYPE).entity(errorResponse).build();
	}

	@Context
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

}
