package net.celloscope.core.model.postgres;

import java.security.Principal;

import org.joda.time.DateTime;

import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.GsonDateTimeUtil;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User  implements Principal {

	private String loginId;
	private String password;
	private String roleId;
	private String status;

	@Override
	public String getName() {
		return loginId;
	}

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}

}
