package jungmo.shoppingmall.user.login.dao.mapper;

import jungmo.shoppingmall.user.login.domain.*;

public interface LoginMapper {
	User loginTest(User user);
	int updateUser(User user);
	int addVisit(String userId);
	int updateLatestDate(String userId);
}
