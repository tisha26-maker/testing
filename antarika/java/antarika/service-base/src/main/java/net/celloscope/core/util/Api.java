package net.celloscope.core.util;

public abstract class Api {

	public static final String POSTGRES_GENERIC_FUNCTION_V2_EXECUTE_FUNCTION_PATH = "execute-function"; //AUTO-INSERT

	public static final String POSTGRES_GENERIC_FUNCTION_V2_RESOURCE = "postgres/generic-function/v2/"; //AUTO-INSERT


	public static final String REPORT_REPORT_GENERATOR_V1_GET_REPORT_PATH = "get-report"; //AUTO-INSERT

	public static final String REPORT_REPORT_GENERATOR_V1_RESOURCE = "report/report-generator/v1/"; //AUTO-INSERT


	public static final String REDIS_OID_GENERATOR_V1_GENERATE_OID_PATH = "generate-oid"; //AUTO-INSERT

	public static final String REDIS_OID_GENERATOR_V1_RESOURCE = "redis/oid-generator/v1/"; //AUTO-INSERT

	
	public static final String CONTAINER_RESOURCE = "container/";
	public static final String CONTAINER_AVAILABLE_RESOURCE = "/getAvailableResouces";
	
	// Postgresql
	public static final String POSTGRES_GENERIC_DELETE_V1_PATH = "postgres/generic-delete/v1/";
	public static final String DELETE_RESOURCE_PATH = "delete";
	
	public static final String POSTGRES_GENERIC_INSERT_V1_RESOURCE = "postgres/generic-insert/v1/";
	public static final String POSTGRES_INSERT_SINGLE_RESOURCE_PATH = "insert-single";
	public static final String POSTGRES_GENERIC_INSERT_V1_INSERT_MULTIPLE_PATH = "insert-multiple";
	
	public static final String POSTGRES_GENERIC_SELECT_V1_RESOURCE = "postgres/generic-select/v1/";
	public static final String POSTGRES_GENERIC_SELECT_V1_SELECT_PATH = "select";
	
	public static final String POSTGRES_GENERIC_UPDATE_V1_PATH = "postgres/generic-update/v1/";
	public static final String UPDATE_RESOURCE_PATH = "update";
	
	public static final String POSTGRES_GENERIC_FUNCTION_V1_PATH = "postgres/generic-function/v1/";
	public static final String POSTGRES_GENERIC_FUNCTION_V2_PATH = "postgres/generic-function/v2/";
	public static final String FUNCTION_RESOURCE_PATH = "execute-function";

	// Redis
	public static final String REDIS_GENERIC_INSERT_SINGLE_V1_PATH = "redis/generic-insert/v1/";
	public static final String INSERT_SINGLE_RESOURCE_PATH = "insert-single";
	
	public static final String GENERIC_REDIS_SELECT_SINGLE_RESOURCE = "redis/generic-select/v1/";
	public static final String REDIS_SELECT_SINGLE_PATH = "select-single";
	
	public static final String REDIS_GENERIC_SELECT_V1_PATH = "redis/generic-select/v1/";
	public static final String REDIS_SELECT_RESOURCE_PATH = "select";
	
	public static final String REDIS_GENERIC_REMOVE_V1_PATH = "redis/generic-remove/v1/";
	public static final String REMOVE_SINGLE_RESOURCE_PATH = "remove-single";
	
	// File System
	public static final String FILESYSTEM_GENERIC_DATA_V1_RESOURCE = "filesystem/generic-data/v1/";
	public static final String FILESYSTEM_GENERIC_DATA_GET_V1_PATH = "get";
	public static final String FILESYSTEM_GENERIC_DATA_V1_SAVE_PATH = "save";

	
}
