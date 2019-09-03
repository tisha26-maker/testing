package net.celloscope.core.util;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.atomic.AtomicInteger;

import org.redisson.Redisson;
import org.redisson.api.RLock;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestRedisLock {

	public static void main(String[] args) throws UnsupportedEncodingException {
		/*RedisClient redisClient = new RedisClient();
		RedissonClient redisson = redisClient.getRegissonConnection();
		
		RMap<String, String> map = redisson.getMap("SystemMap");
		log.info(map.toString());
		RLock lock = redisson.getLock("SystemMap");

		lock.lock();
		
		lock.unlock();*/
		
		
		
		Config config = new Config();
		//config.setUseLinuxNativeEpoll(true);
		//config.useClusterServers().addNodeAddress(redisNode);
		//config.useSingleServer().setAddress("192.168.7.23:6379");
		
		config.useSingleServer().setAddress("redis://localhost:6379");
		config.setCodec(new StringToJsonCodec());
		 
		RedissonClient redisson = Redisson.create(config);
		
		RMap<String, String> map = redisson.getMap("OidHolder");
		//map.put("AccountOid", "0002");
		//System.out.println("##############" + map.get("AccountOid"));
		//String k = "AccountOid";
		String k = "CustomerOid";
		RLock keyLock = map.getLock(k);
		keyLock.lock();
		try {
			String v = map.get(k);
		   log.info("######## 1 got ############" + v);
		   AtomicInteger at = new AtomicInteger(Integer.parseInt(v));
		   String incrementedOid = String.format("%04d", at.incrementAndGet());
		   log.info("##### 1 increment #############" + incrementedOid);
		   map.replace(k, incrementedOid);
		} finally {
			log.info("Finally ------------ unlock 1 connection");
		   keyLock.unlock();
		}

		redisson.shutdown();
	}

}
