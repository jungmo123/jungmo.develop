package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderDao {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	Order getOrder(String ordNum);
	Purchase getPurchase(String ordNum);
}
