package net.celloscope.antarika.postgres.genericselect.v1.service;

import net.celloscope.antarika.postgres.genericselect.v1.request.SelectRequest;
import net.celloscope.antarika.postgres.genericselect.v1.response.SelectResponse;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.BaseService;

public interface SelectService extends BaseService {

	public SelectResponse perform(User user, String url, long requestReceivedTime,
			SelectResponse response, SelectRequest request);

}
