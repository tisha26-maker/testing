package net.celloscope.antarika.postgres.genericdelete.v1.dao;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.dao.BaseDao;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.util.Code;

@Slf4j
@Repository("postgresGenericDeleteV1DeleteDao")
public class DeleteDao {
	
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;

	public int deleteData(String sql, Object[] args) throws AppException {
		log.debug("Query : {}, Param : {}", sql, Arrays.deepToString(args));
		try {
			return baseDao.getJdbcTemplate().update(sql, args);
		} catch (Exception e) {
			log.error("An exception occurred while deleting : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
	
}
