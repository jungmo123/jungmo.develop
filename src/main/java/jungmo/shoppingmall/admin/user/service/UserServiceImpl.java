package jungmo.shoppingmall.admin.user.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.dao.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	public List<User> getUsers(Page page){
		return userDao.getUsers(page);
	}
	
	public List<User> getLeaveUsers(Page page){
		return userDao.getLeaveUsers(page);
	}
	
	public int userStateChange(HashMap<String,List<String>> map){
		return userDao.userStateChange(map);
	}
	
	public int addLeaveUser(HashMap<String,List<String>> map){
		return userDao.addLeaveUser(map);
	}
	
	public List<User> getSearchUsers(Page page){
		return userDao.getSearchUsers(page);
	}
	
	public List<User> getLeaveSearchUsers(Page page){
		return userDao.getLeaveSearchUsers(page);
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
	
	public List<PointLogs> getPointLogs(String userId){
		return userDao.getPointLogs(userId);
	}
	
	public int addPoint(PointLogs pl){
		return userDao.addPoint(pl);
	}
	
	public List<ClauseCategory> getClauses(String userId){
		return userDao.getClauses(userId);
	}
	
	public int updateUserInfo(User user){
		return userDao.updateUserInfo(user);
	}
	
	public int updateUserState(String userId){
		return userDao.updateUserState(userId);
	}
	
	public int SearchAddPoint(Page page){
		return userDao.SearchAddPoint(page);
	}
	
	public int deleteUser(HashMap<String,List<String>> map){
		return userDao.deleteUser(map);
	}
	
	public MailForm getMailForm(String mailType){
		return userDao.getMailForm(mailType);
	}
	
	public int updateMailForm(MailForm mailForm){
		return userDao.updateMailForm(mailForm);
	}
}
