package net.celloscope.antarika.postgres.genericfunction.v2.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericfunction.v2.dao.ExecuteFunctionDao;
import net.celloscope.antarika.postgres.genericfunction.v2.request.ExecuteFunctionRequest;
import net.celloscope.antarika.postgres.genericfunction.v2.response.ExecuteFunctionResponse;
import net.celloscope.antarika.postgres.genericfunction.v2.service.ExecuteFunctionService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericFunctionV2ExecuteFunctionService")
public class ExecuteFunctionServiceImpl extends BaseServiceImpl implements ExecuteFunctionService {

	@Autowired
	@Qualifier("postgresGenericFunctionV2ExecuteFunctionDao")
	private ExecuteFunctionDao functionDao;
	
	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ExecuteFunctionResponse perform(User user, String url, long requestReceivedTime,  ExecuteFunctionResponse response, ExecuteFunctionRequest request) {
		log.debug("Function name : {}, param : {}", request.getBody().getFunctionName(), Arrays.deepToString(request.getBody().getArgs()));
		Object result = null;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = functionDao.executeFunction(request.getBody().getFunctionName(), request.getBody().getArgs());
			response.getBody().setData(result);
			log.debug("Successfully executed function : {}", result);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
}
