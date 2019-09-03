package net.celloscope.antarika.postgres.genericinsert.v1.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericinsert.v1.dao.InsertSingleDao;
import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertSingleRequest;
import net.celloscope.antarika.postgres.genericinsert.v1.response.InsertSingleResponse;
import net.celloscope.antarika.postgres.genericinsert.v1.service.InsertSingleService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericInsertV1InsertSingleService")
public class InsertSingleServiceImpl extends BaseServiceImpl implements InsertSingleService {

	@Autowired
	@Qualifier("postgresGenericInsertV1InsertSingleDao")
	private InsertSingleDao insertDao;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public InsertSingleResponse perform(User user, String url, long requestReceivedTime, 
			InsertSingleResponse response, InsertSingleRequest request) {
		log.debug("Insert query : {}, param : {}", request.getBody().getSql(), Arrays.deepToString(request.getBody().getParam()));
		int result = 0;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = insertDao.insertData(request.getBody().getSql(), request.getBody().getParam());
			if (result <= 0) {
				log.warn("No record insert as single");
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
