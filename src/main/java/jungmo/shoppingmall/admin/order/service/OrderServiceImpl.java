package jungmo.shoppingmall.admin.order.service;

import java.util.List;

import jungmo.shoppingmall.admin.order.dao.OrderDao;
import jungmo.shoppingmall.admin.order.domain.Purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDao orderDao;
	
	public List<Purchase> getOrders(){
		return orderDao.getOrders();
	}
}
