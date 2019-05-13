package jungmo.shoppingmall.admin.user.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface UserDao {
	List<User> getUsers(Page page);
	int userStateChange(HashMap<String,List<String>> map);
	List<User> getSearchUsers(Page page);
}
