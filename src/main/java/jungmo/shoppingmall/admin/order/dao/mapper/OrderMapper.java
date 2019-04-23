package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderMapper {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	int cancelModify(HashMap<String,List<String>> map);
	int addOrdercancel(String ordNum);
	int deleteOrdercancel(String ordNum);
	int modifyOrder(
			@Param("ordType") String ordType,
			@Param("ordNum") String ordNum,
			@Param("deliveryRequest") String deliveryRequest,
			@Param("userName") String userName,
			@Param("phone") String phone,
			@Param("postCode") String userPostcode,
			@Param("street") String userStreet,
			@Param("detailArea") String userDetailArea,
			@Param("memo") String memo);
	List<OrderCancel> getOrderCancels();
	Purchase getPurchase(String ordNum);
	GoodsOption getGodo(String ordNum,int godNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	ManageLogCategories getMlc(String ordNum);
	OrderCancel getOrderCancel(String ordNum);
	List<Goods> getGoods(String ordNum);
	List<Refund> getOrderRefund();
}
