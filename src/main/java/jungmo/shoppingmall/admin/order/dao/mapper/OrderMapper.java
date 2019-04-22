package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface OrderMapper {
	List<Purchase> getOrders();
	int dvModify(HashMap<String,List<String>> map);
	int addMlc(HashMap<String,List<String>> map);
	Purchase getPurchase(String ordNum);
	GoodsOption getGodo(String ordNum,int godNum);
	SavedMoney getSm(int pnpNum);
	Delivery getDv(int dvpNum);
	ManageLogCategories getMlc(String ordNum);
	List<OrderCancel> getOrderCancels();
	List<Goods> getGoods(String ordNum);
}
