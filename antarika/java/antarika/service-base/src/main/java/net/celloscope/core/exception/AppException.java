package net.celloscope.core.exception;

import org.joda.time.DateTime;

import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.GsonDateTimeUtil;

@Getter 
@Setter 
@NoArgsConstructor
@SuppressWarnings("serial")
public class AppException extends Exception {
	
	private String code;
	private String message;

	public AppException(String message) {
		super(message);
		this.message = message;
	}

	public AppException(String code, String message) {
		super(message);
		this.code = code;
		this.message = message;
	}

	public AppException(Throwable cause) {
		super(cause);
	}

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}
}
