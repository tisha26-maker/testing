package net.celloscope.core.service;

import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.ServiceResponseHeader;
import net.celloscope.core.model.postgres.AntarikaRequestLog;

public interface BaseService {

	public void saveAntarikaRequestLog(Object data, ServiceResponseHeader header, long time) throws AppException;

	public void updateAntarikaRequestLog(AntarikaRequestLog model) throws Exception;

}
