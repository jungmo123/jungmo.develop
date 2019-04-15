package jungmo.shoppingmall.user.login.dao;

import jungmo.shoppingmall.user.login.dao.mapper.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired private LoginMapper loginMapper;
	
	public User loginTest(User user){
		return loginMapper.loginTest(user);
	}
	
	public int updateVisit(String userId){
		return loginMapper.updateVisit(userId);
	}
	
	public int updateUser(User user){
		return loginMapper.updateUser(user);
	}
}
