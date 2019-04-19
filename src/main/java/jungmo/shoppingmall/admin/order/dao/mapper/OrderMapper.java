package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.HashMap;
import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Order;
import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderMapper {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	Order getOrder(String ordNum);
}
