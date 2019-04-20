package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderMapper {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	Order getOrder(String ordNum);
	Purchase getPurchase(String ordNum);
}
