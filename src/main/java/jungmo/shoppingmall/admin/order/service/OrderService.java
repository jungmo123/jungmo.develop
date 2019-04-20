package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderService {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	Order getOrder(String ordNum);
	Purchase getPurchase(String ordNum);
}
