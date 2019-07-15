package jungmo.shoppingmall.user.buy.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.buy.dao.mapper.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class BuyDaoImpl implements BuyDao{
	@Autowired private BuyMapper buyMapper;
	
	public int getOrderNum(){
		return buyMapper.getOrderNum();
	}
	
	public void createOrder(Order order){
		buyMapper.createOrder(order);
	}
	
	public void createPurchase(Purchase purchase){
		buyMapper.createPurchase(purchase);
	}
	
	public void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap){
		buyMapper.createPurchaseOption(hashmap);
	}
	
	public void insertPointLogs(PointLogs pl){
		buyMapper.insertPointLogs(pl);
	}
	
	public void minusStock(String godNum,String godStock){
		buyMapper.minusStock(godNum, godStock);
	}
	
	public void deleteOrder(String ordNum){
		buyMapper.deleteOrder(ordNum);
	}
}
