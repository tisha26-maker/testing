package net.celloscope.antarika.filesystem.genericdata.v1.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
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
@AllArgsConstructor
public class GetRequestBody {

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_name")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_name")
	private String fileName;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_extension")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_extension")
	private String fileExtension;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_path")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_path")
	private String filePath;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}
}
