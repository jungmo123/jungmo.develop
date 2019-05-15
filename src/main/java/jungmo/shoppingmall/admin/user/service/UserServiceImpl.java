package jungmo.shoppingmall.admin.user.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.dao.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	public List<User> getUsers(Page page){
		return userDao.getUsers(page);
	}
	
	public int userStateChange(HashMap<String,List<String>> map){
		return userDao.userStateChange(map);
	}
	
	public List<User> getSearchUsers(Page page){
		return userDao.getSearchUsers(page);
	}
	
	public User getUser(String userId){
		return userDao.getUser(userId);
	}
	
	public List<Loglog> getLoglog(String userId){
		return userDao.getLoglog(userId);
	}
	
	public List<PurchaseList> getPurl(String userId){
		return userDao.getPurl(userId);
	}
}
