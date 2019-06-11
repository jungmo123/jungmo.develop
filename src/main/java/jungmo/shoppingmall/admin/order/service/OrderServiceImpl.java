package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDao orderDao;
	
	public int dvModify(HashMap<String,List<String>> map){
		return orderDao.dvModify(map);
	}
	
	public int addMlc(HashMap<String,List<String>> map){
		return orderDao.addMlc(map);
	}
	
	public PurchaseList getPurchase(String ordNum){
		return orderDao.getPurchase(ordNum);
	}
	
	public SavedMoney getSm(int pnpNum){
		return orderDao.getSm(pnpNum);
	}
	
	public Delivery getDv(int dvpNum){
		return orderDao.getDv(dvpNum);
	}
	
	public int modifyOrder(String ordType,String ordNum,String deliveryRequest,String userName,String phone,String userPostcode,String userStreet,String userDetailArea,String memo){
		return orderDao.modifyOrder(ordType,ordNum,deliveryRequest,userName, phone, userPostcode, userStreet, userDetailArea, memo);
	}
	
	public int addOrdercancel(String ordNum){
		return orderDao.addOrdercancel(ordNum);
	}
	
	public int deleteOrdercancel(String ordNum){
		return orderDao.deleteOrdercancel(ordNum);
	}
	
	public int cancelModify(HashMap<String,List<String>> map){
		return orderDao.cancelModify(map);
	}
	
	public List<Refund> getOrderRefund(){
		return orderDao.getOrderRefund();
	}
	
	public int refundModify(HashMap<String,List<String>> map){
		return orderDao.refundModify(map);
	}
	
	public int exchangeModify(HashMap<String,List<String>> map){
		return orderDao.exchangeModify(map);
	}
	
	public List<Exchange> getOrderExchange(){
		return orderDao.getOrderExchange();
	}
	
	public int refundDetailModify(String ordNum,String content,String state,String memo){
		return orderDao.refundDetailModify(ordNum, content, state, memo);
	}
	
	public int exchangeDetailModify(String ordNum,String content,String state,String memo){
		return orderDao.exchangeDetailModify(ordNum, content, state, memo);
	}
	
	public int deleteRefund(String ordNum){
		return orderDao.deleteRefund(ordNum);
	}
	
	public int deleteExchange(String ordNum){
		return orderDao.deleteExchange(ordNum);
	}
	
	public int deleteRefundImage(String ordNum){
		return orderDao.deleteRefundImage(ordNum);
	}
	
	public int deleteExchangeImage(String ordNum){
		return orderDao.deleteExchangeImage(ordNum);
	}
}
