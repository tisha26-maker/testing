package net.celloscope.core.util;

import java.lang.reflect.Type;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component("gsonUtil")
public class GsonUtil {

	@Synchronized
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object parseObject(String json, Class clazz) {
		Gson gson = new Gson();
		Object obj = null;
		try {
			obj = gson.fromJson(json, clazz);
		} catch (Exception e) {
			log.error("An exception occured while parsing Object : ", e);
		}
		return obj;
	}

	@Synchronized
	public String getJson(Object obj) {
		Gson gson = new Gson();
		String jsonString = null;
		try {
			jsonString = gson.toJson(obj);
		} catch (Exception e) {
			log.error("An exception occured while get JSON String from any Object : ", e);
		}
		return jsonString;
	}

	@SuppressWarnings("finally")
	@Synchronized
	public Map<?, ?> parseType(String json, Type type) {
		Gson gson = new Gson();
		Map<Object, Object> obj = null;
		try {
			obj = gson.fromJson(json, type);
		} catch (Exception e) {
			log.error("An exception occured while parse Object to Type : ", e);
		} finally {
			return obj;
		}
	}

	@Synchronized
	public String toJson(Object obj) {
		Gson gson = new GsonBuilder().registerTypeAdapter(DateTime.class, new GsonDateTimeUtil()).create();
		String jsonString = null;
		try {
			jsonString = gson.toJson(obj);
		} catch (Exception e) {
			log.error("An exception occured while get JSON String from any Object : ", e);
		}
		return jsonString;
	}
	
}
