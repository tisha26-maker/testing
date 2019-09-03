package net.celloscope.antarika.redis.genericselect.v1.service;

import net.celloscope.antarika.redis.genericselect.v1.request.SelectSingleRequest;
import net.celloscope.antarika.redis.genericselect.v1.response.SelectSingleResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface SelectSingleService extends BaseService {

	public SelectSingleResponse perform(User user, String url, long requestReceivedTime, 
			SelectSingleRequest request, SelectSingleResponse response);

}
