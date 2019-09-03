package net.celloscope.antarika.filesystem.genericdata.v1.service;

import net.celloscope.antarika.filesystem.genericdata.v1.request.SaveRequest;
import net.celloscope.antarika.filesystem.genericdata.v1.response.SaveResponse;
import net.celloscope.core.service.BaseService;

public interface SaveService extends BaseService {

	public SaveResponse perform(String url, String version, long requestReceivedTime, SaveRequest request,	SaveResponse response);

}
