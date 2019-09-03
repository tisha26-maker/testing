package net.celloscope.antarika.postgres.genericselect.v1.service.impl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericselect.v1.dao.SelectDao;
import net.celloscope.antarika.postgres.genericselect.v1.request.SelectRequest;
import net.celloscope.antarika.postgres.genericselect.v1.response.SelectResponse;
import net.celloscope.antarika.postgres.genericselect.v1.service.SelectService;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.model.postgres.User;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("postgresGenericSelectV1SelectService")
public class SelectServiceImpl extends BaseServiceImpl implements SelectService {

	@Autowired
	@Qualifier("postgresGenericSelectV1SelectDao")
	private SelectDao selectDao;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public SelectResponse perform(User user, String url, long requestReceivedTime, SelectResponse response, SelectRequest request) {
		log.debug("Select query : {}, param : {}", request.getBody().getSql(), Arrays.deepToString(request.getBody().getParam()));
		List<Map<String, Object>> map = null;
		String code = Code.C_200.get();
		String message = Message.REQUEST_SUCCESSFULLY_PROCESSED;
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			map = selectDao.getDataAsList(request.getBody().getSql(), request.getBody().getParam());
			response.getBody().setData(map);
			log.debug("Successfully got data as list : {}", map);
		} catch (AppException e) {
			code = e.getCode();
			message = e.getMessage();
		}
		headerUtil.setCodeMessage(response.getHeader(), code, message);
		return response;
	}

}
