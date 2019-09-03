package net.celloscope.antarika.redis.genericinsert.v1.request;

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
public class InsertSingleRequestBody {

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_table")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_table")
	private String table;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_id")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_id")
	private String id;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_data")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_data")
	private String data;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}

}