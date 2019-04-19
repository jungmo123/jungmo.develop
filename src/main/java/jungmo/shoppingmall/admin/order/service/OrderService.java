package jungmo.shoppingmall.admin.order.service;

import java.util.HashMap;
import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderService {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
}
