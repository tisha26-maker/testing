package net.celloscope.antarika.postgres.genericfunction.v2.service;

import net.celloscope.antarika.postgres.genericfunction.v2.request.ExecuteFunctionRequest;
import net.celloscope.antarika.postgres.genericfunction.v2.response.ExecuteFunctionResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface ExecuteFunctionService extends BaseService {

	public ExecuteFunctionResponse perform(User user, String url, long requestReceivedTime, 
		ExecuteFunctionResponse response, ExecuteFunctionRequest request);

}
