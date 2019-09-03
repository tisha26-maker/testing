package net.celloscope.antarika.redis.genericselect.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.genericselect.v1.request.SelectRequest;
import net.celloscope.antarika.redis.genericselect.v1.response.SelectResponse;
import net.celloscope.antarika.redis.genericselect.v1.service.SelectService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;
import net.celloscope.core.util.RedisClient;

@Slf4j
@Service("redisGenericSelectV1SelectService")
public class SelectServiceImpl extends BaseServiceImpl implements SelectService {

	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;

	@Override
	public SelectResponse perform(User user, String url, long requestReceivedTime, SelectRequest request, SelectResponse response) {
		log.debug("Select all data as list from redis table : {}", request.getBody().getTableName());
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			Object result = redisClient.getAllData(request.getBody().getTableName());
			response.getBody().setData(result);
			log.debug("Successfully got all data as list from redis table : {}", result);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
	
}