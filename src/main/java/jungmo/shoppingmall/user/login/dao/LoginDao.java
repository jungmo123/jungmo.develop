package jungmo.shoppingmall.user.login.dao;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginDao {
	User loginTest(User user);
	int updateVisit(String userId);
	int updateUser(User user);	
}
