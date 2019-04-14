package jungmo.shoppingmall.user.login.dao.mapper;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginMapper {
	void addUser(User user);
	User loginTest(User user);
	int updateVisit(String userId);
	int updateUser(User user);
}
