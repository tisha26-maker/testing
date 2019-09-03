package net.celloscope.core.util;

public enum Code {

	C_401("401-ant"),
	C_402("402-ant"),
	C_403("403-ant"),
	C_500("500-ant"),
	C_501("501-ant"),
	C_502("502-ant"),
	C_503("503-ant"),
	C_200("200");

	private String code;

	Code(String code) {
		this.code = code;
	}

	public String get() {
		return code;
	}

}
