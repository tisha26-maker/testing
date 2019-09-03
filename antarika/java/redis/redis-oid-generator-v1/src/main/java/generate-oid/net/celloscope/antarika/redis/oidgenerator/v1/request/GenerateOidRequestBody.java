package net.celloscope.antarika.redis.oidgenerator.v1.request;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.GsonDateTimeUtil;
import net.celloscope.core.util.Message;

import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

@Getter
@Setter
@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
@AllArgsConstructor
public class GenerateOidRequestBody {

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_oid_key")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_oid_key")
	private String oidKey;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_lpad")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_lpad")
	private String lpad;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}
}
