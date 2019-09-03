package net.celloscope.core.service.impl;

import org.springframework.stereotype.Component;

import net.celloscope.core.service.QueryService;
import net.celloscope.core.util.Table;

@Component("queryService")
public class SqlQueryServiceImpl implements QueryService {

	@Override
	public String insertAntarikaRequestLog() {
		return "Insert into " + Table.ANTARIKA_REQUEST_LOG
			+ " (oid, containerName, status, requestReceivedOn,requestSource, requestSourceService, startSequence, "
			+ " requestJson, traceId) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	}

	@Override
	public String updateAntarikaRequestLog() {
		return "Update " + Table.ANTARIKA_REQUEST_LOG
			+ " set status = ?, responseSentOn = ?,  responseTimeInMs = ?, responseJson = ?, endSequence = ? where oid = ?";
	}

}
