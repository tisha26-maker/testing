package net.celloscope.antarika.postgres.genericinsert.v1.dao;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.postgres.genericinsert.v1.request.InsertMultipleRequestData;
import net.celloscope.core.dao.BaseDao;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.util.Code;

@Slf4j
@Repository("postgresGenericInsertV1InsertMultipleDao")
public class InsertMultipleDao {
	
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;

	public int insertData(List<InsertMultipleRequestData> list) throws AppException { 
		int result = 0;
		try {
			Collections.sort(list, (p1, p2) -> p1.getExecutionSequence() - p2.getExecutionSequence()); 
			for (InsertMultipleRequestData body : list) {
				log.info("Insert query : {}, param : {}", body.getSql(), Arrays.deepToString(body.getParam()));
				result += baseDao.getJdbcTemplate().update(body.getSql(), body.getParam());
			}
			return result;
		} catch (Exception e) {
			log.error("An exception occurred while multiple inserting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
	
}
