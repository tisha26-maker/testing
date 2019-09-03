package net.celloscope.antarika.redis.genericselect.v1.response;

import java.util.Map;

import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.util.GsonDateTimeUtil;

@Builder
@Getter
@Setter
@JsonSerialize
@JsonDeserialize
@AllArgsConstructor
public class SelectResponse {

	private ServiceResponseHeader header;
	private Map<String, Object> meta;
	private SelectResponseBody body;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}

}
