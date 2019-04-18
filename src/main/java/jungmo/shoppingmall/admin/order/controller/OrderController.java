package jungmo.shoppingmall.admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Purchase;
import jungmo.shoppingmall.admin.order.service.OrderService;
import jungmo.shoppingmall.admin.order.service.PageService;
import jungmo.shoppingmall.admin.order.service.PageServiceImpl;
import jungmo.shoppingmall.admin.order.service.PostService;
import jungmo.shoppingmall.admin.order.service.PostServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@Autowired private OrderService orderService;
	@Autowired private PageService pageService;
	@Autowired private PostService postService;
	
	@RequestMapping("/admin/orderList")
	public String orderList(HttpServletRequest request,Model model){
		pageService = new PageServiceImpl();
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchases",purchases);
		return "manager/order/orderList";
	}
}
