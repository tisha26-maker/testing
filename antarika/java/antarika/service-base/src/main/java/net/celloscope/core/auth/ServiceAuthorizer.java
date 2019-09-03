package net.celloscope.core.auth;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import io.dropwizard.auth.Authorizer;
import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.RedisClient;
import net.celloscope.core.util.Table;

@Slf4j
@Component("serviceAuthorizer")
public class ServiceAuthorizer implements Authorizer<User> {

	@Autowired
	@Qualifier("redisClient")
	private RedisClient redisClient;

	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	@Override
	public boolean authorize(User user, String resource) {
		JSONObject data = null;
		log.debug("Select data from redis table for authorization : {}, id : {}", Table.SERVICE_MAP, resource);
		try {
			Object obj = redisClient.getData(Table.SERVICE_MAP, resource);
			if(obj == null) {
				log.debug("No resource {} found from redis table for authorization", resource);
				return false;
			}
			data = new JSONObject(String.valueOf(obj));
		} catch (Exception e) {
			log.error("An exception occurred while authorize resource : ", e);
			return false;
		}
		try {
			JSONArray roleJson = data.getJSONArray("roles");
			for (int i=0;i< roleJson.length();i++) {
	    		if(roleJson.getString(i).equals(user.getRoleId())){
	    			log.trace("Authorization done for user : {}, resource : {}", user.getLoginId(), resource);
	    			return true;
	    		}
	    	}
		} catch (Exception e) {
			log.error("An exception occurred while authorize resource : ", e);
			return false;
		}

		log.debug("Resource {} is not authorized for user : {}", resource, user.getLoginId());
		return false;
	}
}
