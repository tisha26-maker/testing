package net.celloscope.antarika.filesystem.genericdata.v1.request;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;

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
public class SaveRequestBody {

	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_name")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_name")
	@Expose
	private String fileName;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_data")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_data")
	private String fileData;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_type")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_type")
	@Expose
	private String fileType;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_extension")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_extension")
	@Expose
	private String fileExtension;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"null_file_path")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"empty_file_path")
	@Expose
	private String filePath;

	@Override
	public String toString() {
		return new GsonBuilder().excludeFieldsWithoutExposeAnnotation()
				.registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}
}
