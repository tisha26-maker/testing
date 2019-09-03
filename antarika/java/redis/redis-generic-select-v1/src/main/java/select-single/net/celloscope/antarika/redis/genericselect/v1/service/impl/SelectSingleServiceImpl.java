package net.celloscope.antarika.redis.genericselect.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.genericselect.v1.request.SelectSingleRequest;
import net.celloscope.antarika.redis.genericselect.v1.response.SelectSingleResponse;
import net.celloscope.antarika.redis.genericselect.v1.service.SelectSingleService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;
import net.celloscope.core.util.RedisClient;

@Slf4j
@Service("redisGenericSelectV1SelectSingleService")
public class SelectSingleServiceImpl extends BaseServiceImpl implements SelectSingleService {

	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;

	@Override
	public SelectSingleResponse perform(User user, String url, long requestReceivedTime, SelectSingleRequest request, SelectSingleResponse response) {
		log.debug("Select data from redis table : {}, id : {}", request.getBody().getTable(), request.getBody().getId());
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			Object data = redisClient.getData(request.getBody().getTable(), request.getBody().getId());
			response.getBody().setData(data);
			log.debug("Successfully got data from redis table : {}", data);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
	
}