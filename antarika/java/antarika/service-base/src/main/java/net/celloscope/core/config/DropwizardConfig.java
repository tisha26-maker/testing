package net.celloscope.core.config;

import org.hibernate.validator.constraints.NotBlank;

import com.google.gson.GsonBuilder;

import io.dropwizard.Configuration;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class DropwizardConfig extends Configuration {

	@NotBlank
	private String application;

	@Override
	public String toString() {
		return new GsonBuilder().setPrettyPrinting().create().toJson(this);
	}

}
