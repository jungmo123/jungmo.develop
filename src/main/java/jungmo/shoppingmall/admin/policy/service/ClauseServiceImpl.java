package jungmo.shoppingmall.admin.policy.service;

import jungmo.shoppingmall.admin.policy.dao.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

@Service
@Transactional
public class ClauseServiceImpl implements ClauseService{
	@Autowired private ClauseDao clauseDao;
	@Autowired private DataSourceTransactionManager tansactionManager;
	
	public void insertClause(){
		clauseDao.insertClause();
	}
}
