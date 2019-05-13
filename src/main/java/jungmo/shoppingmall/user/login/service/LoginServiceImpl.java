package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.dao.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired private LoginDao loginDao;
	
	public boolean loginTest(User user){
		User u = loginDao.loginTest(user);
		boolean bl;
		if(u != null && u.getUserLevel() == 1){
			bl = true;
		}else{
			bl = false;
		}
		return bl;
	}
	
	public boolean adminTest(User user){
		User u = loginDao.loginTest(user);
		boolean bl;
		if(u != null && u.getUserLevel() == 3){
			bl = true;
		}else{
			bl = false;
		}
		return bl;
	}
	
	public int updateUser(User user){
		return loginDao.updateUser(user);
	}
	
	public int addVisit(String userId){
		return loginDao.addVisit(userId);
	}
}
