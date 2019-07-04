package jungmo.shoppingmall.user.buy.service;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.springframework.web.multipart.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.buy.domain.*;

public interface BuyService {
	int getOrderNum();
	void createOrder(Order order);
	void createPurchase(Purchase purchase);
	void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap);
	void insertPointLogs(PointLogs pl);
	String insertOrder(MultipartHttpServletRequest request,BuyService buyService,List<BuyList> buyList);
	String insertMOrder(MultipartHttpServletRequest request,BuyService buyService,List<BuyList> buyList,List<String> cartNums);
	void minusStock(String godNum,String godStock);
}
