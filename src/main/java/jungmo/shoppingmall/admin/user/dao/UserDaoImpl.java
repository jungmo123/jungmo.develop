package jungmo.shoppingmall.admin.user.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.dao.mapper.*;
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
}
