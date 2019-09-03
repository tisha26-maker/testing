package net.celloscope.antarika.postgres.genericupdate.v1.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericupdate.v1.dao.UpdateDao;
import net.celloscope.antarika.postgres.genericupdate.v1.request.UpdateRequest;
import net.celloscope.antarika.postgres.genericupdate.v1.response.UpdateResponse;
import net.celloscope.antarika.postgres.genericupdate.v1.service.UpdateService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericUpdateV1UpdateService")
public class UpdateServiceImpl extends BaseServiceImpl implements UpdateService {

	@Autowired
	@Qualifier("postgresGenericUpdateV1UpdateDao")
	private UpdateDao updateDao;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public UpdateResponse perform(User user, String url, long requestReceivedTime, UpdateResponse response, UpdateRequest request) {
		log.debug("Update query : {}, param : {}", request.getBody().getSql(), Arrays.deepToString(request.getBody().getParam()));
		int result = 0;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = updateDao.updateData(request.getBody().getSql(), request.getBody().getParam());
			if (result <= 0) {
				log.warn("No record found for update");
			}
			response.getBody().setData(result);
			log.info("Successfully updated data : {}", result);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
}
