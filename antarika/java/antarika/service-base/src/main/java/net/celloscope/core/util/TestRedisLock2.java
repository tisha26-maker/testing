package net.celloscope.core.util;

import java.util.concurrent.atomic.AtomicInteger;

import org.redisson.Redisson;
import org.redisson.api.RLock;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestRedisLock2 {

	public static void main(String[] args) throws InterruptedException {
		Config config = new Config();
		config.useSingleServer().setAddress("redis://localhost:6379");
		config.setCodec(new StringToJsonCodec());
		RedissonClient redisson = Redisson.create(config);
		RMap<String, String> map = redisson.getMap("OidHolder");
		//String k = "AccountOid";
		String k = "CustomerOid";
		RLock keyLock = map.getLock(k);
		keyLock.lock();
		try {
		   String v = map.get(k);
		   log.info("######### 2 Got ###########" + v);
		   AtomicInteger at = new AtomicInteger(Integer.parseInt(v));
		   String incrementedOid = String.format("%04d", at.incrementAndGet());
		   log.info("####### 2 increment #############" + incrementedOid);
		   map.replace(k, incrementedOid);
		} finally {
			Thread.sleep(1000*30);
			log.info("Finally ------------ unlock 2 connection");
		   keyLock.unlock();
		}

		redisson.shutdown();
	}

}
