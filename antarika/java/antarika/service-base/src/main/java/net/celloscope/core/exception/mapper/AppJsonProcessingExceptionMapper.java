package net.celloscope.core.exception.mapper;


import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.ErrorResponse;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Provider
@Component("appJsonProcessingExceptionMapper")
public class AppJsonProcessingExceptionMapper implements ExceptionMapper<JsonProcessingException> {

    @Override
    public Response toResponse(JsonProcessingException exception) {
        
    	if (exception instanceof JsonGenerationException) {
            log.warn("Error generating JSON : ", exception);
            return Response.serverError().build();
        }
        final String message = Message.REQUEST_MSG_PREFIX+"wrongtype : "+exception.getMessage();
        
        if (message.startsWith("No suitable constructor found")) {
            log.error("Unable to deserialize the specific type : ", exception);
            return Response.serverError().build();
        }

        log.error("Unable to process JSON : {}", message);
        final ErrorResponse errorResponse = ErrorResponse.builder().code(Code.C_402.get()).message(message).build();
        return Response.status(Response.Status.OK).type(MediaType.APPLICATION_JSON_TYPE).entity(errorResponse).build();
        
    }

}
