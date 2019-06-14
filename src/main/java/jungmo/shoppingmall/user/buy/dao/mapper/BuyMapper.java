package jungmo.shoppingmall.user.buy.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;

public interface BuyMapper {
	int getOrderNum();
	void createOrder(Order order);
	void createPurchase(Purchase purchase);
	void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap);
	void insertPointLogs(PointLogs pl);
}
