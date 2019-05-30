package jungmo.shoppingmall.admin.policy.dao;

import jungmo.shoppingmall.admin.policy.dao.mapper.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class ClauseDaoImpl implements ClauseDao{
	@Autowired private ClauseMapper clauseMapper;
	
	public void insertClause(){
		clauseMapper.insertClause();
	}
}
