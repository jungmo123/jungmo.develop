package jungmo.shoppingmall.user.login.dao;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginDao {
	User loginTest(User user);
	int updateUser(User user);
	int addVisit(String userId);
	int updateLatestDate(String userId);
}
