package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginService {
	void addUser(User user);
	User loginTest(User user);
	int updateVisit(String userId);
	int updateUser(User user);
}
