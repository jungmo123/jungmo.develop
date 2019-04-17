package jungmo.shoppingmall.admin.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping("/admin/orderList")
	public String orderList(){
		return "manager/order/orderList";
	}
}
