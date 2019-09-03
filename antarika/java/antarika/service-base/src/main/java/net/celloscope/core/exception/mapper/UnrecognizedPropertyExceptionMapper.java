package net.celloscope.core.exception.mapper;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.ErrorResponse;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Provider
@Component("unrecognizedPropertyExceptionMapper")
public class UnrecognizedPropertyExceptionMapper implements ExceptionMapper<UnrecognizedPropertyException> {

    @Override
    public Response toResponse(UnrecognizedPropertyException exception) {
        final String message = Message.REQUEST_MSG_PREFIX+"unknown_attribute : "+exception.getOriginalMessage();
        log.error("Unrecognized property : {}", message);
        final ErrorResponse errorResponse = ErrorResponse.builder().code(Code.C_402.get()).message(message).build();
        return Response.status(Response.Status.OK).type(MediaType.APPLICATION_JSON_TYPE).entity(errorResponse).build();
    }
    
}
