package net.celloscope.antarika.redis.genericremove.v1.service;

import net.celloscope.antarika.redis.genericremove.v1.request.RemoveSingleRequest;
import net.celloscope.antarika.redis.genericremove.v1.response.RemoveSingleResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface RemoveSingleService extends BaseService {

	public RemoveSingleResponse perform(User user, String url, long requestReceivedTime, 
			RemoveSingleResponse response, RemoveSingleRequest request);

}
