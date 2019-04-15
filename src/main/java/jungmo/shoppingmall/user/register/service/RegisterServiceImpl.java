package jungmo.shoppingmall.user.register.service;

import java.util.List;

import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.Overlap;
import jungmo.shoppingmall.user.login.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jungmo.shoppingmall.user.register.dao.RegisterDao;

@Service
public class RegisterServiceImpl implements RegisterService{
	@Autowired private RegisterDao registerDao;
	
	public void addUser(User user){
		registerDao.addUser(user);
	}
	
	public List<Clause> getClauses(){
		return registerDao.getClauses();
	}
	
	public boolean overlapInjection(String userId){
		Overlap ov = registerDao.overlapInjection(userId);
		if(ov != null){
			return true;
		}else{
			return false;
		}
	}
}
