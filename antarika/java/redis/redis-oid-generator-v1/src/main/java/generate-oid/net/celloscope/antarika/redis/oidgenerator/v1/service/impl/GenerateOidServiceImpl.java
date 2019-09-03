package net.celloscope.antarika.redis.oidgenerator.v1.service.impl;

import java.util.concurrent.atomic.AtomicInteger;

import org.redisson.api.RLock;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.redis.oidgenerator.v1.request.GenerateOidRequest;
import net.celloscope.antarika.redis.oidgenerator.v1.response.GenerateOidResponse;
import net.celloscope.antarika.redis.oidgenerator.v1.service.GenerateOidService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.Message;
import net.celloscope.core.util.RedisClient;

@Slf4j
@Service("redisOidGeneratorV1GenerateOidService")
public class GenerateOidServiceImpl extends BaseServiceImpl implements GenerateOidService {

	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;

	@Override
	public GenerateOidResponse perform(String url, String version, long requestReceivedTime, GenerateOidRequest request, GenerateOidResponse response){
		log.debug("Select all data as list from redis table : {}", request.getBody().getOidKey(), request.getBody().getLpad());
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			RedissonClient redisson = redisClient.getRedissonConnection();
			getOid(redisson, request, response);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		}
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
	
	private void getOid(RedissonClient redisson, GenerateOidRequest request, GenerateOidResponse response) throws AppException {
		log.info("Connected to redis for oid generation");
		RMap<String, String> map = redisson.getMap(Constant.OID_HOLDER);
		String incrementedOid = null;
		String oidKey = request.getBody().getOidKey();
		RLock keyLock = map.getLock(oidKey);
		keyLock.lock();
		log.info("Lock oid key : {}", oidKey);
		try {
			String maxOid = map.get(oidKey);
			AtomicInteger at = new AtomicInteger(Integer.parseInt(maxOid));
			incrementedOid = String.format("%0" + request.getBody().getLpad() + "d", at.incrementAndGet());
			map.replace(oidKey, incrementedOid);
			response.getBody().setOid(incrementedOid);
			log.info("Successfully generate oid for {}", oidKey, incrementedOid);
		} 
		catch (Exception e) {
			log.error("An exception occurred while getting oid from redis : ", e);
			throw new AppException(e.getMessage());
		}
		finally {
			keyLock.unlock();
			log.info("Unlock oid key : {}", oidKey);
			redisson.shutdown();
			log.info("Shutdown redis connection...");
		}
	}
}
