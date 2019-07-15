package jungmo.shoppingmall.user.buy.dao.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;

public interface BuyMapper {
	int getOrderNum();
	void createOrder(Order order);
	void createPurchase(Purchase purchase);
	void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap);
	void insertPointLogs(PointLogs pl);
	void minusStock(@Param("godNum") String godNum,@Param("godStock") String godStock);
	void deleteOrder(String ordNum);
}
