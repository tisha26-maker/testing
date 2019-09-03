package net.celloscope.core.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.celloscope.core.util.DateTimeDeserializer;
import net.celloscope.core.util.DateTimeSerializer;
import net.celloscope.core.util.GsonDateTimeUtil;
import net.celloscope.core.util.Message;

@Getter
@Setter
@JsonSerialize
@JsonDeserialize
@NoArgsConstructor
public class ServiceRequestHeader {
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_id")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_id")
	private String requestId;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_source")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_source")
	private String requestSource;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_source_service")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_source_service")
	private String requestSourceService;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_client")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_client")
	private String requestClient;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_type")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_type")
	private String requestType;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_time")
	@JsonSerialize(using=DateTimeSerializer.class)
	@JsonDeserialize(using=DateTimeDeserializer .class)
	private DateTime requestTime;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_version")
	@NotBlank(message=Message.REQUEST_MSG_PREFIX+"header_empty_request_version")
	private String requestVersion;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_timeout_in_seconds")
	private Integer requestTimeoutInSeconds;
	
	@NotNull(message=Message.REQUEST_MSG_PREFIX+"header_null_request_retry_count")
	@Min(value=0, message=Message.REQUEST_MSG_PREFIX+"header_invalid_request_retry_count")
	private Integer requestRetryCount;
	
	private String traceId;
	
	@Min(value=0, message=Message.REQUEST_MSG_PREFIX+"header_invalid_request_hop_count")
	private Integer hopCount;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
			.setPrettyPrinting().create().toJson(this);
	}

}
