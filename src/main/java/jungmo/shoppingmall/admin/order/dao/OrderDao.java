package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderDao {
	List<Purchase> getOrders();
}
