package jungmo.shoppingmall.admin.policy.service;

import java.util.*;

import jungmo.shoppingmall.admin.policy.dao.*;
import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.user.join.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

@Service
@Transactional
public class ClauseServiceImpl implements ClauseService{
	@Autowired private ClauseDao clauseDao;
	@Autowired private DataSourceTransactionManager tansactionManager;
	
	public void insertClause(Clause cls){
		clauseDao.insertClause(cls);
	}
	
	public void updateClause(Clause cls){
		clauseDao.updateClause(cls);
	}
	
	public void deleteClause(HashMap<String,List<Integer>> map){
		clauseDao.deleteClause(map);
	}
	
	public DeliveryPolicy getDeliveryPolicy(){
		return clauseDao.getDeliveryPolicy();
	}
	
	public List<NoDeliveryArea> getNoDeliveryArea(){
		return clauseDao.getNoDeliveryArea();
	}
	
	public PointPolicy getPointPolicy(){
		return clauseDao.getPointPolicy();
	}
	
	public CommonPolicy getCommonPolicy(){
		return clauseDao.getCommonPolicy();
	}
	
	public void insertNda(HashMap<String,List<NoDeliveryArea>> map){
		clauseDao.insertNda(map);
	}
	public void deleteNda(){
		clauseDao.deleteNda();
	}
}
