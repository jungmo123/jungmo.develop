package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Purchase;

public interface OrderMapper {
	List<Purchase> getOrders();
}
