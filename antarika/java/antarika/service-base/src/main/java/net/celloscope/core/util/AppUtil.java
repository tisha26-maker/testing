package net.celloscope.core.util;

import org.springframework.stereotype.Component;

import lombok.Getter;

@Getter
@Component("appUtil")
public class AppUtil {
	
	private String containerName = null;

	public void init(String containerName){
		this.containerName = containerName;
	}
	

}
