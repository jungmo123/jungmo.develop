package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderDao {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	Purchase getPurchase(String ordNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	List<OrderCancel> getOrderCancels();
}
