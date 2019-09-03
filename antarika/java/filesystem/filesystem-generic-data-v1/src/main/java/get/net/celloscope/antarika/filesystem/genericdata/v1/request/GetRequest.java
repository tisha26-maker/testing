package net.celloscope.antarika.filesystem.genericdata.v1.request;

import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import net.celloscope.core.model.ServiceRequestHeader;
import net.celloscope.core.util.GsonDateTimeUtil;
import net.celloscope.core.util.Message;

@Getter
@Builder
@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
@AllArgsConstructor
public class GetRequest {

	@Valid
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_header")
	private ServiceRequestHeader header;

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_meta")
	private Map<String, Object> meta;

	@Valid
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_body")
	private GetRequestBody body;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}
}
