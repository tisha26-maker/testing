package net.celloscope.core.service.impl;

import java.sql.Timestamp;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.dao.AntarikaRequestLogDao;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.AntarikaRequestLog;
import net.celloscope.core.service.BaseService;
import net.celloscope.core.service.QueryService;
import net.celloscope.core.service.RequestValidatorService;
import net.celloscope.core.util.AppUtil;
import net.celloscope.core.util.GsonUtil;
import net.celloscope.core.util.HeaderUtil;

@Slf4j
@Service("baseService")
public class BaseServiceImpl implements BaseService {

	@Autowired
	@Qualifier("headerUtil")
	protected HeaderUtil headerUtil;
	
	@Autowired
	@Qualifier("requestValidatorService")
	protected RequestValidatorService requestValidatorService;

	@Autowired
	@Qualifier("gsonUtil")
	protected GsonUtil gsonUtil;

	@Autowired
	@Qualifier("appUtil")
	protected AppUtil appUtil;
	
	@Autowired
	@Qualifier("queryService")
	private QueryService queryService;
	
	@Autowired
	@Qualifier("antarikaRequestLogDao")
	private AntarikaRequestLogDao antarikaRequestLogDao;

	@Override
	public void saveAntarikaRequestLog(Object data, ServiceResponseHeader header, long time) throws AppException {
		try {
			log.debug("Saving request into AntarikaRequestLog...");
			JSONObject json = new JSONObject(data);		
			AntarikaRequestLog requestLog = AntarikaRequestLog.builder().requestId(header.getRequestId())
				.traceId(header.getTraceId())
				.hopCount(header.getHopCount())
				.containerName(appUtil.getContainerName())
				.requestJson(gsonUtil.toJson(data))
				.requestReceiveTime(new Timestamp(time))
				.requestSource(json.getJSONObject("header").getString("requestSource"))
				.requestSourceService(json.getJSONObject("header").getString("requestSourceService")).build();
			antarikaRequestLogDao.saveAntarikaRequestLog(queryService.insertAntarikaRequestLog(), requestLog);
			log.trace("Successfully saved AntarikaRequestLog : {}", requestLog.getRequestId());
		} catch (Exception e) {
			log.error("An exception occurred while save AntarikaRequestLog : ", e);
			throw new AppException(e.getMessage());
		}
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
	public void updateAntarikaRequestLog(AntarikaRequestLog model) {
		try {
			log.debug("Updating request into AntarikaRequestLog...");
			antarikaRequestLogDao.updateAntarikaRequestLog(queryService.updateAntarikaRequestLog(), model);
			log.trace("Successfully update AntarikaRequestLog : {}", model.getRequestId());
		} catch (Exception e) {
			log.error("An exception occurred while update AntarikaRequestLog : ", e);
		}
	}

}
