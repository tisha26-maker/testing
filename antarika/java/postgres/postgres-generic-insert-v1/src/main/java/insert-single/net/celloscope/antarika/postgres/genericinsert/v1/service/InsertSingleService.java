package net.celloscope.antarika.postgres.genericinsert.v1.service;

import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertSingleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertSingleResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface InsertSingleService extends BaseService {

	public InsertSingleResponse perform(User user, String url, long requestReceivedTime, 
			InsertSingleResponse response, InsertSingleRequest request);

}
