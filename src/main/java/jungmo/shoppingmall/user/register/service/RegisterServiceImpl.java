package jungmo.shoppingmall.user.register.service;

import java.util.List;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.register.dao.RegisterDao;
import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.ClauseCategory;
import jungmo.shoppingmall.user.register.domain.Overlap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService{
	@Autowired private RegisterDao registerDao;
	
	public void addUser(User user){
		registerDao.addUser(user);
	}
	
	public void addClsc(ClauseCategory clsc){
		registerDao.addClsc(clsc);
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
