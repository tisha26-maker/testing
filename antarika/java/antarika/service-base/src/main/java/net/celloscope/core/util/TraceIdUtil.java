package net.celloscope.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Component;

import lombok.Synchronized;

@Component("traceIdUtil")
public class TraceIdUtil {

	private final int NUM_CHARS = 6;
	private String chars = "ABCDEFGHJKLMNPQRSTUVWXYZ";
	private Random r = new Random();
	private SimpleDateFormat df = new SimpleDateFormat("yyMMdd");

	@Synchronized
	public String generateId() {
		Date today = new Date();
		String todayAsString = df.format(today);
		return todayAsString + getRandomWord();
	}

	@Synchronized
	private String getRandomWord() {
		char[] buf = new char[NUM_CHARS];
		for (int i = 0; i < buf.length; i++) {
			buf[i] = chars.charAt(r.nextInt(chars.length()));
		}
		return new String(buf);
	}

}
