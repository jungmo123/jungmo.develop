package jungmo.shoppingmall.user.customerSupport.service;

import java.util.*;

import jungmo.shoppingmall.user.customerSupport.domain.*;

public interface CsService {
	Customer getPwd(Customer cs);
	void mailSend(String userEmail,String mailTitle,String mailContent);
	List<Customer> getId(Customer cs);
	int updatePwd(Customer cs);
}
