package net.celloscope.core.util;

import java.util.Map;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.exception.AppException;

@Slf4j
@Component("redisClient")
public class RedisClient {

	@Autowired
	@Qualifier("redisTemplate")
	private RedisTemplate<String, Object> redisTemplate;
	
	@Autowired
	@Qualifier("redisNode")
	private String redisNode;

	public Object getData(String table, final String id) throws AppException {
		log.debug("Get data from redis table : {}, id : {}", table, id);
		try {
			return redisTemplate.opsForHash().get(table, id);
		} catch (Exception e) {
			log.error("An exception occurred while selecting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}

	public void setData(final String table, String id, final Object data) throws AppException {
		log.debug("Set data in redis table : {}, id : {}, data : {}", table, id, data);
		try {
			redisTemplate.opsForHash().put(table, id, data);
		} catch (Exception e) {
			log.error("An exception occurred while inserting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}

	public Map<Object, Object> getAllData(String table) throws AppException {
		log.debug("Get all data from redis table : {}", table);
		try {
			return redisTemplate.opsForHash().entries(table);
		} catch (Exception e) {
			log.error("An exception occurred while selecting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
	
	public void removedDataById(String table, String id)  throws AppException {
		log.debug("Remove data from redis table : {}, id : {}", table, id);
		try {
			redisTemplate.opsForHash().delete(table, id);
		} catch (Exception e) {
			log.error("An exception occurred while deleting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
	
	public RedissonClient getRedissonConnection() {
		Config config = new Config();
		config.useSingleServer().setAddress(redisNode);
		config.setCodec(new StringToJsonCodec());		 
		RedissonClient redisson = Redisson.create(config);
		return redisson;
	}

}
