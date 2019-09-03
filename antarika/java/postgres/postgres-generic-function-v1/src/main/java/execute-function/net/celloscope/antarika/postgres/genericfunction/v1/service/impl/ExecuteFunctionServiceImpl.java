package net.celloscope.antarika.postgres.genericfunction.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericfunction.v1.dao.ExecuteFunctionDao;
import net.celloscope.antarika.postgres.genericfunction.v1.request.ExecuteFunctionRequest;
import net.celloscope.antarika.postgres.genericfunction.v1.response.ExecuteFunctionResponse;
import net.celloscope.antarika.postgres.genericfunction.v1.service.ExecuteFunctionService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericFunctionV1ExecuteFunctionService")
public class ExecuteFunctionServiceImpl extends BaseServiceImpl implements ExecuteFunctionService {

	@Autowired
	@Qualifier("postgresGenericFunctionV1ExecuteFunctionDao")
	private ExecuteFunctionDao functionDao;
	
	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ExecuteFunctionResponse perform(User user, String url, long requestReceivedTime,  ExecuteFunctionResponse response, ExecuteFunctionRequest request) {
		log.debug("Function name : {}, param : {}", request.getBody().getFunctionName(), gsonUtil.toJson(request.getBody().getParam()));
		Object result = null;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = functionDao.executeFunction(request.getBody().getFunctionName(), request.getBody().getParam());
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
