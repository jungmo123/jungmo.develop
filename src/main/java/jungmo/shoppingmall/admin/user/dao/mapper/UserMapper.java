package jungmo.shoppingmall.admin.user.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface UserMapper {
	List<User> getUsers(Page page);
	int userStateChange(HashMap<String,List<String>> map);
	List<User> getSearchUsers(Page page);
	User getUser(String userId);
	List<Loglog> getLoglog(String userId);
	List<PurchaseList> getPurl(String userId);
	List<PointLogs> getPointLogs(String userId);
	int addPoint(PointLogs pl);
	List<ClauseCategory> getClauses(String userId);
	int updateUserInfo(User user);
	int updateUserState(String userId);
	int SearchAddPoint(Page page);
}
