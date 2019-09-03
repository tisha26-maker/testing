package net.celloscope.core.config;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.Constant;

@Getter
@Setter
@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
public class Plugin {

	private boolean enable;
	private String resource;

	@Override
	public String toString() {
		return new GsonBuilder().setDateFormat(Constant.DATE_FORMAT).setPrettyPrinting().create().toJson(this);
	}

}
