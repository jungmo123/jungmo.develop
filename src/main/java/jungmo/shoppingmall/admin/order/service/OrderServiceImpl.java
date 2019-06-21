package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDao orderDao;
	
	public Goods getGod(String godName){
		return orderDao.getGod(godName);
	}
	
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
	
	public int modifyOrder(String ordType,String ordNum,String deliveryRequest,String userName,String phone,String userPostcode,String userStreet,String userDetailArea,String memo,String invoiceNumber,String tcode,String tname){
		return orderDao.modifyOrder(ordType,ordNum,deliveryRequest,userName, phone, userPostcode, userStreet, userDetailArea, memo,invoiceNumber,tcode,tname);
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
	
	public Refund getOrderRefund(String ordNum){
		return orderDao.getOrderRefund(ordNum);
	}
	
	public int refundModify(HashMap<String,List<String>> map){
		return orderDao.refundModify(map);
	}
	
	public int exchangeModify(HashMap<String,List<String>> map){
		return orderDao.exchangeModify(map);
	}
	
	public Exchange getOrderExchange(String ordNum){
		return orderDao.getOrderExchange(ordNum);
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
	
	public OrderCancel getOrderCancel(String ordNum){
		return orderDao.getOrderCancel(ordNum);
	}
	
	public int modifyDi(String ordNum,String postCode,String street,String detailArea,String deliveryRequest,String userName,String phone){
		return orderDao.modifyDi(ordNum, postCode, street, detailArea, deliveryRequest, userName, phone);
	}
	
	public int modifyOrdType(String ordNum,String ordType){
		return orderDao.modifyOrdType(ordNum, ordType);
	}
}
