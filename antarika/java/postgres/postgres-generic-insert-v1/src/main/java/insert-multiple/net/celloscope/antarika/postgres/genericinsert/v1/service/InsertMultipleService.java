package net.celloscope.antarika.postgres.genericinsert.v1.service;

import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertMultipleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertMultipleResponse;
import net.celloscope.core.service.BaseService;

public interface InsertMultipleService extends BaseService {

	public InsertMultipleResponse perform(String url, String version, long requestReceivedTime, InsertMultipleRequest request,	InsertMultipleResponse response);

}
