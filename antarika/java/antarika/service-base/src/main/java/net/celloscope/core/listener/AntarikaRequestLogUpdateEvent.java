package net.celloscope.core.listener;

import org.json.JSONObject;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AntarikaRequestLogUpdateEvent {
	
	private long eventTime;
	private JSONObject data;

}
