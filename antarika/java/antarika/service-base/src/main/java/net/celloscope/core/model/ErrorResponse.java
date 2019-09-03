package net.celloscope.core.model;

import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import net.celloscope.core.util.GsonDateTimeUtil;

@Getter
@Builder
@JsonSerialize
@JsonDeserialize
@AllArgsConstructor
public class ErrorResponse {
	
	private String code;
	private String message;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}

}
