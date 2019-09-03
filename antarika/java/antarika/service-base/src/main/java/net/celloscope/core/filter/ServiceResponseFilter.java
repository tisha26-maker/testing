package net.celloscope.core.filter;

import java.io.IOException;

import java.util.Date;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.Provider;

import org.apache.commons.io.IOUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import com.google.common.base.Charsets;
import com.google.common.base.Strings;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.listener.AntarikaRequestLogUpdateEvent;
import net.celloscope.core.service.BaseService;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.GsonUtil;

@Slf4j
@Provider
@Component("serviceResponseFilter")
public class ServiceResponseFilter implements ContainerResponseFilter {

	private final String METHOD_POST = "POST";

	@Autowired
	@Qualifier("baseService")
	private BaseService baseService;

	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	@Autowired
	private ApplicationEventPublisher publisher;

	@Override
	public void filter(ContainerRequestContext request, ContainerResponseContext response) throws IOException {
		MultivaluedMap<String, Object> headers = response.getHeaders();
		headers.add("Access-Control-Allow-Origin", "*");
		headers.add("Access-Control-Allow-Methods", METHOD_POST);
		headers.add("Access-Control-Max-Age", "151200");
		headers.add("Access-Control-Allow-Headers", "accept, Content-Type, Authorization");
		headers.add("X-Powered-By", "Antarika :-)");

		if (METHOD_POST.equals(request.getMethod()) && response.getMediaType().toString().contains(MediaType.APPLICATION_JSON)) {
			JSONObject resObj = null;
			try {
				String resJson = gsonUtil.getJson(response.getEntity());
				resObj = new JSONObject(resJson);
				long responseTime = System.currentTimeMillis();
				if (!Strings.isNullOrEmpty(resObj.optString("code"))) {
					if(resObj.optString("code").equals(Code.C_402.get())|| resObj.optString("code").equals(Code.C_403.get())){
						resObj = getErrorResponse(request, getResponseObj(), resObj, responseTime);
						response.setEntity(resObj.toString());
						log.warn("Response from filter for invalid request : {}", resObj.toString(2));
						return;
					}
					String requestJson = IOUtils.toString(request.getEntityStream(), Charsets.UTF_8);
					JSONObject reqObj = new JSONObject(requestJson);
					resObj = getErrorResponse(request, reqObj, resObj, responseTime);
					response.setEntity(resObj.toString());
					log.warn("Response from filter for invalid request : {}", resObj.toString(2));
					return;
				}
				resObj = getResponse(request, resObj, responseTime);
				response.setEntity(resObj.toString());
				publisher.publishEvent(new AntarikaRequestLogUpdateEvent(responseTime, resObj));
				log.info("Response sent against valid request : {}", resObj.toString(2));
			} catch (Exception e) {
				log.error("An exception occurred while sending response : ", e);
				throw new RuntimeException(e);
			}
		}
		log.info(":::Response Filter:::");
	}

	private JSONObject getResponseObj() throws JSONException {
		JSONObject reqObj = new JSONObject();
		reqObj.put("header", new JSONObject());
		return reqObj;
	}

	private JSONObject getErrorResponse(ContainerRequestContext request, JSONObject reqObj, JSONObject resObj, long responseTime) throws Exception {
		JSONObject r = getResponse(request, reqObj, responseTime);
		r.getJSONObject("header").put("responseCode", resObj.get("code"));
		r.getJSONObject("header").put("responseMessage", resObj.get("message"));
		r.put("body", new JSONObject());
		r.put("meta", new JSONObject());
		return r;
	}

	private JSONObject getResponse(ContainerRequestContext request, JSONObject obj, long responseTime) throws Exception {
		long requestTime = request.getHeaderString("requestReceivedTime") != null ? Long.parseLong( request.getHeaderString("requestReceivedTime")): new Date().getTime();
		long executionTime = responseTime - requestTime;
		obj.getJSONObject("header").put("requestReceivedTime", DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(requestTime)));
		obj.getJSONObject("header").put("responseProcessingTimeInMs", executionTime);
		obj.getJSONObject("header").put("responseTime", DateTimeFormat.forPattern(Constant.DATE_FORMAT).print(new DateTime(responseTime)));
		return obj;
	}

}
