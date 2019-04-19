package jungmo.shoppingmall.admin.order.dao;

import java.util.HashMap;
import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Order;
import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderDao {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	Order getOrder(String ordNum);
}
