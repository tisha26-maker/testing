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
public class ValidationException extends AppException {
	
	public ValidationException(String message) {
		super(message);
	}

	public ValidationException(String code, String message) {
		super(code, message);
	}

	public ValidationException(Throwable cause) {
		super(cause);
	}

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}
}
