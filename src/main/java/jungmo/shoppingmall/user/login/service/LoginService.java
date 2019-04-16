package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginService {
	boolean loginTest(User user);
	boolean adminTest(User user);
	int updateVisit(String userId);
	int updateUser(User user);
}
