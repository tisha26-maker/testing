package net.celloscope.antarika.postgres.genericselect.v1.dao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.core.dao.BaseDao;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.util.Code;

@Slf4j
@Repository("postgresGenericSelectV1SelectDao")
public class SelectDao {
	
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;

	public List<Map<String, Object>> getDataAsList(String sql, Object[] args) throws AppException {
		log.debug("Query : {}, Param : {}", sql, Arrays.deepToString(args));
		try {
			List<Map<String, Object>> listOfMap = baseDao.getJdbcTemplate().queryForList(sql, args);
			log.debug("Successfully got data as list : {}", listOfMap);
			return listOfMap;
		} catch (Exception e) {
			log.error("An exception occurred while running select : ", e);
			throw new AppException(Code.C_401.get(), e.getMessage());
		}
	}
}
