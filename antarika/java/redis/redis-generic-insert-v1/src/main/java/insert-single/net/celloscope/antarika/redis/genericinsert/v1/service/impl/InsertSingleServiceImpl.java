package net.celloscope.antarika.redis.genericinsert.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.genericinsert.v1.request.InsertSingleRequest;
import net.celloscope.antarika.redis.genericinsert.v1.response.InsertSingleResponse;
import net.celloscope.antarika.redis.genericinsert.v1.service.InsertSingleService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;
import net.celloscope.core.util.RedisClient;

@Slf4j
@Service("redisGenericInsertV1InsertSingleService")
public class InsertSingleServiceImpl extends BaseServiceImpl implements InsertSingleService {

	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;

	@Override
	public InsertSingleResponse perform(User user, String url, long requestReceivedTime, InsertSingleResponse response, InsertSingleRequest request) {
		log.debug("Redis table : {}, id : {}, data : {}", request.getBody().getTable(), request.getBody().getId(), request.getBody().getData());
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			redisClient.setData(request.getBody().getTable(), request.getBody().getId(), request.getBody().getData());
			response.getBody().setData(true);
			log.debug("Successfully insert in redis");
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
	
}
