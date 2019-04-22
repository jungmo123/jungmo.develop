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
	
	public List<OrderCancel> getOrderCancels(){
		return orderMapper.getOrderCancels();
	}
}
