package net.celloscope.core.util;

import org.springframework.stereotype.Component;

import lombok.Synchronized;

@Component("paramUtil")
public class ParamUtil {

	@Synchronized
	public Object[] argsToObjectArray(Object... obj) {
		return obj;
	}
}
