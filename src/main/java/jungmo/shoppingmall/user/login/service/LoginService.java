package jungmo.shoppingmall.user.login.service;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginService {
	User loginTest(User user);
	int updateVisit(String userId);
	int updateUser(User user);
}
