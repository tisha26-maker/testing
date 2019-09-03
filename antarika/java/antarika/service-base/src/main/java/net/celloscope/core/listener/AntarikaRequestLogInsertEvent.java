package net.celloscope.core.listener;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class AntarikaRequestLogInsertEvent {
	
	private String eventTime;
	private Object data;

}
