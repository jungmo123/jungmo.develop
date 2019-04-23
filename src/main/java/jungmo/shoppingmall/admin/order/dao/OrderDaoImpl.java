package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired private OrderMapper orderMapper;
	
	public List<Purchase> getOrders(){
		return orderMapper.getOrders();
	}
	
	public int dvModify(HashMap<String,List<String>> map){
		return orderMapper.dvModify(map);
	}
	
	public int addMlc(HashMap<String,List<String>> map){
		return orderMapper.addMlc(map);
	}
	
	public Purchase getPurchase(String ordNum){
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
	
	public List<OrderCancel> getOrderCancels(){
		return orderMapper.getOrderCancels();
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
	
	public List<Refund> getOrderRefund(){
		return orderMapper.getOrderRefund();
	}
	
	public List<Exchange> getOrderExchange(){
		return orderMapper.getOrderExchange();
	}
	
	public int refundModify(HashMap<String,List<String>> map){
		return orderMapper.refundModify(map);
	}
	
	public int exchangeModify(HashMap<String,List<String>> map){
		return orderMapper.exchangeModify(map);
	}
}