package net.celloscope.antarika.postgres.genericupdate.v1.service;

import net.celloscope.antarika.postgres.genericupdate.v1.request.UpdateRequest;
import net.celloscope.antarika.postgres.genericupdate.v1.response.UpdateResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface UpdateService extends BaseService {

	public UpdateResponse perform(User user, String url, long requestReceivedTime, 
		UpdateResponse response, UpdateRequest request);

}
