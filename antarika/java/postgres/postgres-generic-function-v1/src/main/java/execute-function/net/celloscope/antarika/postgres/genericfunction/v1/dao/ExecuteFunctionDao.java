package net.celloscope.antarika.postgres.genericfunction.v1.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.dao.BaseDao;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.GsonUtil;

@Slf4j
@Repository("postgresGenericFunctionV1ExecuteFunctionDao")
public class ExecuteFunctionDao {

	@Autowired
	private Environment env;
	
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;
	
	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	public Object executeFunction(String functionName,  Map<String, Object> args) throws AppException {
		log.debug("Function : {}, Param : {}", functionName, gsonUtil.toJson(args));
		try {
			SimpleJdbcCall jdbcCall = new SimpleJdbcCall(baseDao.getJdbcTemplate())
				.withFunctionName(functionName)
				.withSchemaName(env.getProperty("jdbc.schema"));
			return jdbcCall.execute(args);
		} catch (Exception e) {
			log.error("An exception occurred while executing function : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
	

}
