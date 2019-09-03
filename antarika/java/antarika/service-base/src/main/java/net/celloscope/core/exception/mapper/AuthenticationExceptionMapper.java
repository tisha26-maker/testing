package net.celloscope.core.exception.mapper;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.springframework.stereotype.Component;

import net.celloscope.core.exception.AppAuthenticationException;
import net.celloscope.core.model.ErrorResponse;
import net.celloscope.core.util.Code;

@Provider
@Component("appAuthenticationException")
public class AuthenticationExceptionMapper implements ExceptionMapper<AppAuthenticationException> {

	@Override
	public Response toResponse(AppAuthenticationException exp) {
		final String message = exp.getMessage();
		ErrorResponse errorResponse = ErrorResponse.builder().code(Code.C_402.get()).message(message).build();
		return Response.status(Response.Status.OK).type(MediaType.APPLICATION_JSON_TYPE).entity(errorResponse).build();
	}


}
