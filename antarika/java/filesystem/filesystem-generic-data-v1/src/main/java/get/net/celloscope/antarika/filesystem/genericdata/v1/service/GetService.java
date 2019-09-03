package net.celloscope.antarika.filesystem.genericdata.v1.service;

import net.celloscope.antarika.filesystem.genericdata.v1.request.GetRequest;
import net.celloscope.antarika.filesystem.genericdata.v1.response.GetResponse;
import net.celloscope.core.service.BaseService;

public interface GetService extends BaseService {

	public GetResponse perform(String url, String version, long requestReceivedTime, GetRequest request,	GetResponse response);

}
