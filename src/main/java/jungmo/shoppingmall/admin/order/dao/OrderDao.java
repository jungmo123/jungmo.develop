package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderDao {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	int refundModify(HashMap<String,List<String>> map);
	int exchangeModify(HashMap<String,List<String>> map);
	Purchase getPurchase(String ordNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	int modifyOrder(String ordType,String ordNum,String deliveryRequest,String userName,String phone,String userPostcode,String userStreet,String userDetailArea,String memo);
	List<OrderCancel> getOrderCancels();
	OrderCancel getOrderCancel(String ordNum);
	int addOrdercancel(String ordNum);;
	int deleteOrdercancel(String ordNum);
	int cancelModify(HashMap<String,List<String>> map);
	List<Refund> getOrderRefund();
	List<Exchange> getOrderExchange();
}
