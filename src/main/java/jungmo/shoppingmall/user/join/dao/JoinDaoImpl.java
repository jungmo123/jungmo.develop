package jungmo.shoppingmall.user.join.dao;

import java.util.*;

import jungmo.shoppingmall.user.join.dao.mapper.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

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
	
	public void addJoinPoint(String userId){
		joinMapper.addJoinPoint(userId);
	}
}
