package jungmo.shoppingmall.admin.user.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.dao.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	public List<User> getUsers(Page page){
		return userDao.getUsers(page);
	}
}
