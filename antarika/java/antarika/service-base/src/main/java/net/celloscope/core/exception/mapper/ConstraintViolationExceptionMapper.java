package net.celloscope.core.exception.mapper;

import javax.validation.ConstraintViolationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.ErrorResponse;
import net.celloscope.core.util.Code;

@Slf4j
@Provider
@Component("constraintViolationExceptionMapper")
public class ConstraintViolationExceptionMapper implements ExceptionMapper<ConstraintViolationException> {

	@Override
    public Response toResponse(ConstraintViolationException exception) {
        final String message = exception.getConstraintViolations().toString();
        log.error("Constraint Violation : {}", message);
        final ErrorResponse errorResponse = ErrorResponse.builder().code(Code.C_402.get()).message(exception.getConstraintViolations().toString()).build();
        return Response.status(Response.Status.OK).type(MediaType.APPLICATION_JSON_TYPE).entity(errorResponse).build();
    }
	
}
