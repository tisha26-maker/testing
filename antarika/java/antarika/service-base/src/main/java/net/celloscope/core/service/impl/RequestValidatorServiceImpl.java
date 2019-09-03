package net.celloscope.core.service.impl;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.exception.ValidationException;
import net.celloscope.core.model.ServiceRequestHeader;
import net.celloscope.core.service.RequestValidatorService;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.Message;

@Slf4j
@Service("requestValidatorService")
public class RequestValidatorServiceImpl implements RequestValidatorService {

	@Override
	public void validate(ServiceRequestHeader requestHeader, String url) throws ValidationException {
		log.info("Request validating...");
		String message = null;
		if(!url.equals(requestHeader.getRequestType())) {
			message = String.format("%s - expected %s", Message.FAIL_HEADER_INVALID_REQUEST_TYPE, url);
			log.warn("Expected type : {}, request type : {}, Message : {}", url, requestHeader.getRequestType(), message);
			throw new ValidationException(Code.C_500.get(), message);
		}
		if(!requestHeader.getRequestVersion().equals(Constant.VERSION_1_0)) {
			message = String.format("%s - expected %s", Message.FAIL_HEADER_INVALID_REQUEST_VERSION, Constant.VERSION_1_0);
			log.warn("Expected version : {}, request version : {}, Message : {}", Constant.VERSION_1_0, requestHeader.getRequestVersion(), message);
			throw new ValidationException(Code.C_500.get(), message);
		}
		if(!requestHeader.getRequestClient().equals(Constant.REQUEST_CLIENT)) {
			message = String.format("%s - expected %s", Message.FAIL_HEADER_INVALID_REQUEST_CLIENT, Constant.REQUEST_CLIENT);
			log.warn("Expected client : {}, request client : {}, Message : {}", Constant.REQUEST_CLIENT, requestHeader.getRequestVersion(), message);
			throw new ValidationException(Code.C_500.get(), message);
		}
	}
}