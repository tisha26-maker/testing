package net.celloscope.antarika.redis.genericremove.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.genericremove.v1.request.RemoveSingleRequest;
import net.celloscope.antarika.redis.genericremove.v1.response.RemoveSingleResponse;
import net.celloscope.antarika.redis.genericremove.v1.service.RemoveSingleService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;
import net.celloscope.core.util.RedisClient;

@Slf4j
@Service("redisGenericRemoveV1RemoveSingleService")
public class RemoveSingleServiceImpl extends BaseServiceImpl implements RemoveSingleService {

	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;

	@Override
	public RemoveSingleResponse perform(User user, String url, long requestReceivedTime, RemoveSingleResponse response, RemoveSingleRequest request) {
		log.debug("Remove data from redis table : {}, id : {}", request.getBody().getTable(), request.getBody().getId());
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			redisClient.removedDataById(request.getBody().getTable(), request.getBody().getId());
			response.getBody().setData(true);
			log.debug("Successfully removed data in redis");
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
	
}
