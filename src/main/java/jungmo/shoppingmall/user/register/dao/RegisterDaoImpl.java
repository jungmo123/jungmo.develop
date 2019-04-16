package jungmo.shoppingmall.user.register.dao;

import java.util.List;

import jungmo.shoppingmall.user.register.dao.mapper.RegisterMapper;
import jungmo.shoppingmall.user.login.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.ClauseCategory;
import jungmo.shoppingmall.user.register.domain.Overlap;

@Repository
public class RegisterDaoImpl implements RegisterDao{
	@Autowired private RegisterMapper registerMapper;
	
	public void addUser(User user){
		registerMapper.addUser(user);
	}
	
	public void addClsc(ClauseCategory clsc){
		registerMapper.addClsc(clsc);
	}
	
	public  List<Clause> getClauses(){
		return registerMapper.getClauses();
	}
	
	public Overlap overlapInjection(String userId){
		return registerMapper.overlapInjection(userId);
	}
}
