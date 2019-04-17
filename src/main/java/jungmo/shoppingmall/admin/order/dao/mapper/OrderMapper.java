package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Order;

public interface OrderMapper {
	List<Order> getOrders();
}
