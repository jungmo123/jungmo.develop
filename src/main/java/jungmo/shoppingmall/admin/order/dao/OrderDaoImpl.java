package jungmo.shoppingmall.admin.order.dao;

import java.util.List;

import jungmo.shoppingmall.admin.order.dao.mapper.OrderMapper;
import jungmo.shoppingmall.admin.order.domain.Purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired private OrderMapper orderMapper;
	
	public List<Purchase> getOrders(){
		return orderMapper.getOrders();
	}
}
