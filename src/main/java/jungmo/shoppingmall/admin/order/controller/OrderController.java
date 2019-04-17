package jungmo.shoppingmall.admin.order.controller;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class OrderController {
	@Autowired private OrderService orderService;
	
	@RequestMapping("/admin/orderList")
	public String orderList(Model model){
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchase",purchases);
		return "manager/order/orderList";
	}
}
