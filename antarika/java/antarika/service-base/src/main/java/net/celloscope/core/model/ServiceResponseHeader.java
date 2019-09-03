package net.celloscope.core.model;

import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.celloscope.core.util.GsonDateTimeUtil;

@Getter
@Setter
@Builder
@JsonSerialize
@JsonDeserialize
@AllArgsConstructor
public class ServiceResponseHeader {

	private String requestId;
	private String responseCode;
	private String responseMessage;
	private String responseVersion;
	private String requestSourceService;
	private String traceId;
	private int hopCount;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}

}
