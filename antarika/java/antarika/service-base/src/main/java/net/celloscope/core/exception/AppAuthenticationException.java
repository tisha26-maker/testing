package net.celloscope.core.exception;

import javax.ws.rs.InternalServerErrorException;

import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.Setter;
import net.celloscope.core.util.Constant;

@Getter 
@Setter 
@SuppressWarnings("serial")
public class AppAuthenticationException extends InternalServerErrorException {
	
	private String code;
	private String message;

	public AppAuthenticationException(String message) {
		super(message);
		this.message = message;
	}

	public AppAuthenticationException(String code, String message) {
		super(message);
		this.code = code;
		this.message = message;
	}

	public AppAuthenticationException(Throwable cause) {
		super(cause);
	}

	@Override
	public String toString() {
		return new GsonBuilder().setDateFormat(Constant.DATE_FORMAT).setPrettyPrinting().create().toJson(this);
	}
}
