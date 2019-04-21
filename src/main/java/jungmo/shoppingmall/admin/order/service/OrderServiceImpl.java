package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDao orderDao;
	
	public List<Purchase> getOrders(){
		return orderDao.getOrders();
	}
	
	public int dvModify(HashMap<String,List<String>> map){
		return orderDao.dvModify(map);
	}
	
	public int addMlc(HashMap<String,List<String>> map){
		return orderDao.addMlc(map);
	}
	
	public Purchase getPurchase(String ordNum){
		return orderDao.getPurchase(ordNum);
	}
	
	public SavedMoney getSm(int pnpNum){
		return orderDao.getSm(pnpNum);
	}
	
	public Delivery getDv(int dvpNum){
		return orderDao.getDv(dvpNum);
	}
}
