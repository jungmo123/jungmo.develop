package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderDao {
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	int refundModify(HashMap<String,List<String>> map);
	int exchangeModify(HashMap<String,List<String>> map);
	PurchaseList getPurchase(String ordNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	int modifyOrder(String ordType,String ordNum,String deliveryRequest,String userName,String phone,String userPostcode,String userStreet,String userDetailArea,String memo);
	int addOrdercancel(String ordNum);
	int deleteOrdercancel(String ordNum);
	int cancelModify(HashMap<String,List<String>> map);
	Refund getOrderRefund(String ordNum);
	Exchange getOrderExchange(String ordNum);
	int refundDetailModify(String ordNum,String content,String state,String memo);
	int exchangeDetailModify(String ordNum,String content,String state,String memo);
	int deleteRefund(String ordNum);
	int deleteExchange(String ordNum);
	int deleteRefundImage(String ordNum);
	int deleteExchangeImage(String ordNum);
	OrderCancel getOrderCancel(String ordNum);
}
