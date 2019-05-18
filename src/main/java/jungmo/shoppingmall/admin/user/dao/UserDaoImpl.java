package jungmo.shoppingmall.admin.user.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.dao.mapper.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMapper userMapper;
	
	public List<User> getUsers(Page page){
		return userMapper.getUsers(page);
	}
	
	public int userStateChange(HashMap<String,List<String>> map){
		return userMapper.userStateChange(map);
	}
	
	public List<User> getSearchUsers(Page page){
		return userMapper.getSearchUsers(page);
	}
	
	public User getUser(String userId){
		return userMapper.getUser(userId);
	}
	
	public List<Loglog> getLoglog(String userId){
		return userMapper.getLoglog(userId);
	}
	
	public List<PurchaseList> getPurl(String userId){
		return userMapper.getPurl(userId);
	}
	
	public List<PointLogs> getPointLogs(String userId){
		return userMapper.getPointLogs(userId);
	}
	
	public int addPoint(PointLogs pl){
		return userMapper.addPoint(pl);
	}
	
	public List<ClauseCategory> getClauses(String userId){
		return userMapper.getClauses(userId);
	}
	
	public int updateUserInfo(User user){
		return userMapper.updateUserInfo(user);
	}
	
	public int updateUserState(String userId){
		return userMapper.updateUserState(userId);
	}
	
	public int SearchAddPoint(Page page){
		return userMapper.SearchAddPoint(page);
	}
}
