package net.celloscope.core.model.postgres;

import java.sql.Timestamp;

import org.joda.time.DateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.GsonBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.celloscope.core.util.DateTimeDeserializer;
import net.celloscope.core.util.DateTimeSerializer;
import net.celloscope.core.util.GsonDateTimeUtil;

@Getter
@Setter
@Builder
@JsonSerialize
@JsonDeserialize
@AllArgsConstructor
public class AntarikaRequestLog {

	private String requestId;
	private String requestJson;
	private String responseJson;
	private String containerName;
	private String status;

	@JsonSerialize(using=DateTimeSerializer.class)
	@JsonDeserialize(using=DateTimeDeserializer.class)
	private Timestamp requestReceiveTime;

	@JsonSerialize(using=DateTimeSerializer.class)
	@JsonDeserialize(using=DateTimeDeserializer.class)
	private Timestamp responseSendTime;
	
	private int responseTimeInMs;
	
	private String requestSource;
	private String requestSourceService;
	private String traceId;
	private Integer hopCount;

	@Override
	public String toString() {
		return new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil())
				.setPrettyPrinting().create().toJson(this);
	}

}
