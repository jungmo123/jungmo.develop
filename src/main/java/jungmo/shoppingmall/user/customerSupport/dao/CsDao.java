package jungmo.shoppingmall.user.customerSupport.dao;

import java.util.*;

import jungmo.shoppingmall.user.customerSupport.domain.*;

public interface CsDao {
	Customer getPwd(Customer cs);
	List<Customer> getId(Customer cs);
	int updatePwd(Customer cs);
}
