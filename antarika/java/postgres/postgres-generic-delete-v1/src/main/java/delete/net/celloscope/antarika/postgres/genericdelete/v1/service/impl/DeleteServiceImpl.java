package net.celloscope.antarika.postgres.genericdelete.v1.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericdelete.v1.dao.DeleteDao;
import net.celloscope.antarika.postgres.genericdelete.v1.request.DeleteRequest;
import net.celloscope.antarika.postgres.genericdelete.v1.response.DeleteResponse;
import net.celloscope.antarika.postgres.genericdelete.v1.service.DeleteService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericDeleteV1DeleteService")
public class DeleteServiceImpl extends BaseServiceImpl implements DeleteService {

	@Autowired
	@Qualifier("postgresGenericDeleteV1DeleteDao")
	private DeleteDao deleteDao;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public DeleteResponse perform(User user, String url,  long requestReceivedTime, DeleteResponse response, DeleteRequest request) {
		log.debug("Delete query : {}, param : {}", request.getBody().getSql(), Arrays.deepToString(request.getBody().getParam()));
		int result = 0;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			result = deleteDao.deleteData(request.getBody().getSql(), request.getBody().getParam());
			if (result <= 0) {
				log.warn("No record found for delete");
			}
			response.getBody().setData(result);
			log.debug("Successfully deleted data : {}", result);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		} 
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}
}
