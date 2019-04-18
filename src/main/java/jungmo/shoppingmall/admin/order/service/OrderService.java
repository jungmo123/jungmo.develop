package jungmo.shoppingmall.admin.order.service;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderService {
	List<Purchase> getOrders();
}
