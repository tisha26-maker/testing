package net.celloscope.antarika.redis.genericremove.v1.response;

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
public class RemoveResponseBody {

	private boolean data;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}

}
