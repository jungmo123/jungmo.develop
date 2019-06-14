package jungmo.shoppingmall.user.buy.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;

public interface BuyDao {
	int getOrderNum();
	void createOrder(Order order);
	void createPurchase(Purchase purchase);
	void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap);
	void insertPointLogs(PointLogs pl);
}
