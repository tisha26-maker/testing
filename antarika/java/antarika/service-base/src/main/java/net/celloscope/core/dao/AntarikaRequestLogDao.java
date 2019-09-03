package net.celloscope.core.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.model.postgres.AntarikaRequestLog;
import net.celloscope.core.util.Constant;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.ParamUtil;

@Slf4j
@Repository("antarikaRequestLogDao")
public class AntarikaRequestLogDao {
	
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;

	@Autowired
	@Qualifier("paramUtil")
	private ParamUtil paramUtil;

	@Autowired
	@Qualifier("gsonUtil")
	private GsonUtil gsonUtil;

	public int saveAntarikaRequestLog(String sql, AntarikaRequestLog model) {
		log.info("Saving AntarikaRequestLog : {}", model);
		Object[] params = paramUtil.argsToObjectArray(model.getRequestId(), model.getContainerName(),
			Constant.REQUEST_RECEIVED, model.getRequestReceiveTime(), model.getRequestSource(),
			model.getRequestSourceService(), model.getHopCount(), model.getRequestJson(), model.getTraceId());
		int rowsInserted = baseDao.getJdbcTemplate().update(sql, params);
		if (rowsInserted > 0) {
			log.trace("Successfully saved AntarikaRequestLog : {}", model);
		} else {
			log.warn("Failed to save AntarikaRequestLog : {}", model);
		}
		return rowsInserted;
	}

	public int updateAntarikaRequestLog(String sql, AntarikaRequestLog model) {
		log.trace("Updating AntarikaRequestLog : {}", model);
		Object[] params = paramUtil.argsToObjectArray(Constant.RESPONSE_SENT,
			model.getResponseSendTime(), model.getResponseTimeInMs(), model.getResponseJson(), 
			model.getHopCount(), model.getRequestId());
		int rowsUpdated = baseDao.getJdbcTemplate().update(sql, params);
		if (rowsUpdated > 0) {
			log.trace("Successfully updated AntarikaRequestLog : {}", model);
		} else {
			log.warn("Failed to update AntarikaRequestLog : {}", model);
		}
		return rowsUpdated;
	}

}
