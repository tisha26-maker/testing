package net.celloscope.antarika.redis.oidgenerator.v1.service;

import net.celloscope.antarika.redis.oidgenerator.v1.request.GenerateOidRequest;
import net.celloscope.antarika.redis.oidgenerator.v1.response.GenerateOidResponse;
import net.celloscope.core.service.BaseService;

public interface GenerateOidService extends BaseService {

	public GenerateOidResponse perform(String url, String version, long requestReceivedTime, GenerateOidRequest request,	GenerateOidResponse response);

}
