package net.celloscope.antarika.postgres.genericdelete.v1.service;

import net.celloscope.antarika.postgres.genericdelete.v1.request.DeleteRequest;
import net.celloscope.antarika.postgres.genericdelete.v1.response.DeleteResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface DeleteService extends BaseService {

	public DeleteResponse perform(User user, String url, long requestReceivedTime, 
			DeleteResponse response, DeleteRequest request);

}
