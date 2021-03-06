package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface OrderMapper {
	Goods getGod(String godName);
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	int cancelModify(HashMap<String,List<String>> map);
	int refundModify(HashMap<String,List<String>> map);
	int exchangeModify(HashMap<String,List<String>> map);
	int addOrdercancel(String ordNum);
	int deleteOrdercancel(String ordNum);
	int getRefundImage(String ordNum);
	int getExchangeImage(String ordNum);
	int modifyOrder(
			@Param("ordType") String ordType,
			@Param("ordNum") String ordNum,
			@Param("deliveryRequest") String deliveryRequest,
			@Param("userName") String userName,
			@Param("phone") String phone,
			@Param("postCode") String userPostcode,
			@Param("street") String userStreet,
			@Param("detailArea") String userDetailArea,
			@Param("memo") String memo,
			@Param("invoiceNumber") String invoiceNumber,
			@Param("tcode") String tcode,
			@Param("tname") String tname);
	PurchaseList getPurchase(String ordNum);
	GoodsOption getGodo(String ordNum,int godNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	ManageLogCategories getMlc(String ordNum);
	OrderCancel getOrderCancel(String ordNum);
	List<Goods> getGoods(String ordNum);
	Refund getOrderRefund(String ordNum);
	Exchange getOrderExchange(String ordNum);
	int refundDetailModify(
			@Param("ordNum") String ordNum,
			@Param("content") String content,
			@Param("state") String state,
			@Param("memo") String memo);
	int exchangeDetailModify(
			@Param("ordNum") String ordNum,
			@Param("content") String content,
			@Param("state") String state,
			@Param("memo") String memo);
	int deleteRefund(String ordNum);
	int deleteExchange(String ordNum);
	int deleteRefundImage(String ordNum);
	int deleteExchangeImage(String ordNum);
	int modifyDi(
			@Param("ordNum") String ordNum,
			@Param("postCode") String postCode,
			@Param("street") String street,
			@Param("detailArea") String detailArea,
			@Param("deliveryRequest") String deliveryRequest,
			@Param("userName") String userName,
			@Param("phone") String phone);
	int modifyOrdType(@Param("ordNum") String ordNum,@Param("ordType") String ordType);
	List<Order> sOrder();
}
