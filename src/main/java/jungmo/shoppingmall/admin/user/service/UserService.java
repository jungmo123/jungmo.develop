package jungmo.shoppingmall.admin.user.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface UserService {
	List<User> getUsers(Page page);
}
