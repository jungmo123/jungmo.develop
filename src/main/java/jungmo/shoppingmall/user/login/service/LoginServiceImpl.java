package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.dao.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired private LoginDao loginDao;
	
	public void addUser(User user){
		loginDao.addUser(user);
	}
	
	public User loginTest(User user){
		return loginDao.loginTest(user);
	}
	
	public int updateVisit(String userId){
		return loginDao.updateVisit(userId);
	}
	
	public int updateUser(User user){
		return loginDao.updateUser(user);
	}	
}
