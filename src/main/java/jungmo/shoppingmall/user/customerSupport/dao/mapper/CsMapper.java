package jungmo.shoppingmall.user.customerSupport.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.user.customerSupport.domain.*;

public interface CsMapper {
	Customer getPwd(Customer cs);
	List<Customer> getId(Customer cs);
	int updatePwd(Customer cs);
}
