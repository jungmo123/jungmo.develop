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
}
