package net.celloscope.antarika.postgres.genericinsert.v1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericinsert.v1.dao.InsertMultipleDao;
import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertMultipleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertMultipleResponse;
import net.celloscope.antarika.postgres.genericinsert.v1.service.InsertMultipleService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericInsertV1InsertMultipleService")
public class InsertMultipleServiceImpl extends BaseServiceImpl implements InsertMultipleService {

	@Autowired
	@Qualifier("postgresGenericInsertV1InsertMultipleDao")
	private InsertMultipleDao insertDao;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public InsertMultipleResponse perform(String url, String version, long requestReceivedTime, InsertMultipleRequest request, InsertMultipleResponse response){
		int result = 0;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = insertDao.insertData(request.getBody().getData());
			if (result <= 0) {
				log.warn("No record inserted as multiple");
			}
			response.getBody().setData(result);
			log.debug("Successfully inserted data : {}", result);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
}
