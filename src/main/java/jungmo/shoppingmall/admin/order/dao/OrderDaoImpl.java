package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired private OrderMapper orderMapper;
	
	
	public int dvModify(HashMap<String,List<String>> map){
		return orderMapper.dvModify(map);
	}
	
	public int addMlc(HashMap<String,List<String>> map){
		return orderMapper.addMlc(map);
	}
	
	public PurchaseList getPurchase(String ordNum){
		return orderMapper.getPurchase(ordNum);
	}
	
	public SavedMoney getSm(int pnpNum){
		return orderMapper.getSm(pnpNum);
	}
	public Delivery getDv(int dvpNum){
		return orderMapper.getDv(dvpNum);
	}
	
	public int modifyOrder(String ordType,String ordNum,String deliveryRequest,String userName,String phone,String userPostcode,String userStreet,String userDetailArea,String memo){
		return orderMapper.modifyOrder(ordType,ordNum,deliveryRequest,userName, phone, userPostcode, userStreet, userDetailArea, memo);
	}
	
	public int addOrdercancel(String ordNum){
		return orderMapper.addOrdercancel(ordNum);
	}
	
	public OrderCancel getOrderCancel(String ordNum){
		return orderMapper.getOrderCancel(ordNum);
	}
	
	public int deleteOrdercancel(String ordNum){
		return orderMapper.deleteOrdercancel(ordNum);
	}
	
	public int cancelModify(HashMap<String,List<String>> map){
		return orderMapper.cancelModify(map);
	}
	
	public Refund getOrderRefund(String ordNum){
		return orderMapper.getOrderRefund(ordNum);
	}
	
	public Exchange getOrderExchange(String ordNum){
		return orderMapper.getOrderExchange(ordNum);
	}
	
	public int refundModify(HashMap<String,List<String>> map){
		return orderMapper.refundModify(map);
	}
	
	public int exchangeModify(HashMap<String,List<String>> map){
		return orderMapper.exchangeModify(map);
	}
	
	public int refundDetailModify(String ordNum,String content,String state,String memo){
		return orderMapper.refundDetailModify(ordNum, content, state, memo);
	}
	
	public int exchangeDetailModify(String ordNum,String content,String state,String memo){
		return orderMapper.exchangeDetailModify(ordNum, content, state, memo);
	}
	
	public int deleteRefund(String ordNum){
		return orderMapper.deleteRefund(ordNum);
	}
	
	public int deleteExchange(String ordNum){
		return orderMapper.deleteExchange(ordNum);
	}
	
	public int deleteRefundImage(String ordNum){
		return orderMapper.deleteRefundImage(ordNum);
	}
	
	public int deleteExchangeImage(String ordNum){
		return orderMapper.deleteExchangeImage(ordNum);
	}
}