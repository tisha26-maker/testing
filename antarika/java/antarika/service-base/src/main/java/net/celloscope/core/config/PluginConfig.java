package net.celloscope.core.config;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import net.celloscope.core.util.Constant;

@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
@Getter
public class PluginConfig {

	private List<Plugin> plugins = new ArrayList<Plugin>();

	public void addAll(List<Plugin> plugins) {
		this.plugins.addAll(plugins);
	}

	@Override
	public String toString() {
		return new GsonBuilder().setDateFormat(Constant.DATE_FORMAT).setPrettyPrinting().create().toJson(this);
	}

}
