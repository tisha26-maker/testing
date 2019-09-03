package net.celloscope.core.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericToStringSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import redis.clients.jedis.JedisPoolConfig;

@Configuration
@PropertySource(value = { "classpath:db.properties" }, ignoreResourceNotFound = false)
public class DataSourceConfig {

	@Autowired
	private Environment env;
	
	@Bean(name = "redisNode")
	public String redisNode() {
		String nodeAddress = "redis://" + env.getProperty("redis.host") + ":" + env.getProperty("redis.port");
		return nodeAddress;
	}

	@Bean(name = "jedisConnectionFactory")
	public RedisConnectionFactory jedisConnectionFactory() {
		JedisPoolConfig poolConfig = new JedisPoolConfig();
		poolConfig.setMaxWaitMillis(Integer.parseInt(env.getProperty("redis.maxWait")));
		poolConfig.setMaxIdle(Integer.parseInt(env.getProperty("redis.maxIdle")));
		poolConfig.setMinIdle(Integer.parseInt(env.getProperty("redis.minIdle")));
		poolConfig.setMinEvictableIdleTimeMillis(Integer.parseInt(env.getProperty("redis.minEvictableIdleTimeMillis")));
		poolConfig.setTimeBetweenEvictionRunsMillis(Integer.parseInt(env.getProperty("redis.timeBetweenEvictionRunsMillis")));
		poolConfig.setTestOnBorrow(true);
		poolConfig.setTestOnReturn(true);
		poolConfig.setTestWhileIdle(true);
		JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory(poolConfig);
		jedisConnectionFactory.setHostName(env.getProperty("redis.host"));
		jedisConnectionFactory.setPort(Integer.parseInt(env.getProperty("redis.port")));
		jedisConnectionFactory.setDatabase(Integer.parseInt(env.getProperty("redis.db")));
		jedisConnectionFactory.setUsePool(true);
		return jedisConnectionFactory;
	}

	@Bean(name = "redisTemplate")
	public RedisTemplate<String, Object> redisTemplate() {
		final RedisTemplate<String, Object> template = new RedisTemplate<>();
		template.setConnectionFactory(jedisConnectionFactory());
		template.setKeySerializer(new StringRedisSerializer());
		template.setHashKeySerializer(new StringRedisSerializer());
		template.setHashValueSerializer(new GenericToStringSerializer<Object>(Object.class));
		template.setValueSerializer(new GenericToStringSerializer<Object>(Object.class));
		return template;
	}

	@Bean(name = "dataSource")
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		dataSource.setUrl(env.getProperty("jdbc.url"));
		dataSource.setUsername(env.getProperty("jdbc.username"));
		dataSource.setPassword(env.getProperty("jdbc.password"));
		dataSource.setMaxWait(Long.parseLong(env.getProperty("jdbc.maxWait")));
		dataSource.setInitialSize(Integer.parseInt(env.getProperty("jdbc.initialSize")));
		dataSource.setMaxActive(Integer.parseInt(env.getProperty("jdbc.maxActive")));
		dataSource.setMaxIdle(Integer.parseInt(env.getProperty("jdbc.maxIdle")));
		dataSource.setMinIdle(Integer.parseInt(env.getProperty("jdbc.minIdle")));
		dataSource.setTimeBetweenEvictionRunsMillis(Long.parseLong(env.getProperty("jdbc.timeBetweenEvictionRunsMillis")));
		dataSource.setMinEvictableIdleTimeMillis(Long.parseLong(env.getProperty("jdbc.minEvictableIdleTimeMillis")));
		dataSource.setTestWhileIdle(false);
		dataSource.setTestOnBorrow(true);
		dataSource.setTestOnReturn(false);
		dataSource.setPoolPreparedStatements(false);
		dataSource.setNumTestsPerEvictionRun(20);
		return dataSource;
	}

	@Bean(name = "transactionManager")
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
		transactionManager.setDataSource(dataSource());
		return transactionManager;
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

}
