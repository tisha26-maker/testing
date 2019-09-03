package net.celloscope.core.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.common.base.Strings;

import lombok.Synchronized;
import net.celloscope.core.model.ServiceRequestHeader;
import net.celloscope.core.model.ServiceResponseHeader;

@Component("headerUtil")
public class HeaderUtil {
	
	@Autowired
	private TraceIdUtil traceIdUtil;
	
	@Synchronized
	public ServiceResponseHeader getResponseHeader(ServiceRequestHeader requestHeader, String version, String requestSourceService) {
		return ServiceResponseHeader.builder()
			.requestId(requestHeader.getRequestId())
			.requestSourceService(requestSourceService)
			.responseVersion(version)
			.hopCount(requestHeader.getHopCount() == null ? 1 : requestHeader.getHopCount() + 1)
			.traceId(Strings.isNullOrEmpty(requestHeader.getTraceId()) ? traceIdUtil.generateId() : requestHeader.getTraceId())
			.build();
	}

	@Synchronized
	public void setCodeMessage(ServiceResponseHeader header, String code, String message) {
		header.setResponseCode(code);
		header.setResponseMessage(message);
	}
}
