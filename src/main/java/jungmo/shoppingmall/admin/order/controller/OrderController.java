package jungmo.shoppingmall.admin.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Purchase;
import jungmo.shoppingmall.admin.order.service.OrderService;
import jungmo.shoppingmall.admin.order.service.PageService;
import jungmo.shoppingmall.admin.order.service.PageServiceImpl;
import jungmo.shoppingmall.admin.order.service.PostService;

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
		Page myPage = null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null)myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();
		PageService ps = new PageServiceImpl(5,myPage,pageService.getTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",postService.getPosts(myPage));
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchases",purchases);
		return "manager/order/orderList";
	}
}
