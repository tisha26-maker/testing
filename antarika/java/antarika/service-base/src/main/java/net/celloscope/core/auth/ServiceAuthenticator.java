package net.celloscope.core.auth;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.Optional;

import io.dropwizard.auth.AuthenticationException;
import io.dropwizard.auth.Authenticator;
import io.dropwizard.auth.basic.BasicCredentials;
import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.exception.AppAuthenticationException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.RedisClient;
import net.celloscope.core.util.Table;

@Slf4j
@Component("serviceAuthenticator")
public class ServiceAuthenticator implements Authenticator<BasicCredentials, User> {
	
	@Autowired 
	@Qualifier("redisClient") 
	private RedisClient redisClient;
	
	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;
	
	@Override
	public Optional<User> authenticate(BasicCredentials credentials) throws AuthenticationException {
		Object obj = null;
		log.debug("Select data from redis table for authentication : {}, id : {}", Table.SYSTEM_MAP, credentials.getUsername());
		try {
			obj = redisClient.getData(Table.SYSTEM_MAP, credentials.getUsername());
		} catch (Exception e) {
			log.error("An exception occured while trying to authenticate user : {}", credentials.getUsername(), e);
			throw new AppAuthenticationException(e.getMessage());
		}
		if(obj == null) {
			log.warn("No user found : {}", credentials.getUsername());
			return Optional.empty();
		}
		User user = (User) gsonUtil.parseObject(String.valueOf(obj), User.class);
		if(!StringUtils.equals(user.getPassword(), credentials.getPassword())) {
			log.warn("Credential mismatch for user : {}/{}", credentials.getUsername(), credentials.getPassword());
			return Optional.empty();
		}
		return Optional.of(user);
	}

}
