package net.celloscope.core.listener;


import java.sql.Timestamp;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import net.celloscope.core.model.postgres.AntarikaRequestLog;
import net.celloscope.core.service.BaseService;

@Component("antarikaRequestLogEventListener")
public class AntarikaRequestLogEventListener {
	
	@Autowired 
	@Qualifier("baseService")
	private BaseService baseService;
	
	@Async
	@EventListener
	public void onAntarikaRequestLogUpdateEvent(AntarikaRequestLogUpdateEvent event) throws Exception {
		JSONObject json = event.getData();
		String requestId = json.getJSONObject("header").getString("requestId");
		AntarikaRequestLog requestLog = AntarikaRequestLog.builder().requestId(requestId)
			.hopCount(Integer.parseInt(json.getJSONObject("header").getString("hopCount")))
			.responseTimeInMs(json.getJSONObject("header").optInt("responseProcessingTimeInMs"))
			.responseJson(json.toString()).build();
		requestLog.setResponseSendTime(new Timestamp(event.getEventTime()));
		baseService.updateAntarikaRequestLog(requestLog);
	}


}
