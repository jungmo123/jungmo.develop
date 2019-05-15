package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginService {
	boolean loginTest(User user);
	boolean adminTest(User user);
	int updateUser(User user);
	int addVisit(String userId);
	int updateLatestDate(String userId);
}
