package jungmo.shoppingmall.user.join.dao;

import java.util.List;

import jungmo.shoppingmall.user.join.dao.mapper.JoinMapper;
import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.join.domain.Clause;
import jungmo.shoppingmall.user.join.domain.ClauseCategory;
import jungmo.shoppingmall.user.join.domain.Overlap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDaoImpl implements JoinDao{
	@Autowired private JoinMapper joinMapper;
	
	public void addUser(User user){
		joinMapper.addUser(user);
	}
	
	public void addClsc(ClauseCategory clsc){
		joinMapper.addClsc(clsc);
	}
	
	public  List<Clause> getClauses(){
		return joinMapper.getClauses();
	}
	
	public Overlap overlapInjection(String userId){
		return joinMapper.overlapInjection(userId);
	}
}
