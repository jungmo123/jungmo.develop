package jungmo.shoppingmall.admin.order.dao;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderDao {
	List<Purchase> getOrders();
}
