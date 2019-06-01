package jungmo.shoppingmall.admin.policy.dao;

import java.util.*;

import jungmo.shoppingmall.admin.policy.dao.mapper.*;
import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.user.join.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class ClauseDaoImpl implements ClauseDao{
	@Autowired private ClauseMapper clauseMapper;
	
	public void insertClause(Clause cls){
		clauseMapper.insertClause(cls);
	}
	
	public void updateClause(Clause cls){
		clauseMapper.updateClause(cls);
	}
	
	public void deleteClause(HashMap<String,List<Integer>> map){
		clauseMapper.deleteClause(map);
	}
	
	public DeliveryPolicy getDeliveryPolicy(){
		return clauseMapper.getDeliveryPolicy();
	}
	
	public List<NoDeliveryArea> getNoDeliveryArea(){
		return clauseMapper.getNoDeliveryArea();
	}
	
	public PointPolicy getPointPolicy(){
		return clauseMapper.getPointPolicy();
	}
	
	public CommonPolicy getCommonPolicy(){
		return clauseMapper.getCommonPolicy();
	}
	
	public void insertNda(HashMap<String,List<NoDeliveryArea>> map){
		clauseMapper.insertNda(map);
	}
	public void deleteNda(){
		clauseMapper.deleteNda();
	}
}
