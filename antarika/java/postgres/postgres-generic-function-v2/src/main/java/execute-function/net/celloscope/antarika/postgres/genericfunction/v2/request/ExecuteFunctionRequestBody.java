package net.celloscope.antarika.postgres.genericfunction.v2.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.GsonDateTimeUtil;
import net.celloscope.core.util.Message;

@Getter
@Setter
@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
public class ExecuteFunctionRequestBody {

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_sql")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_sql")
	private String functionName;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_args")
	private Object[] args;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}

}
