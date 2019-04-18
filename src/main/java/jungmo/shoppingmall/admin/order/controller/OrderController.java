package jungmo.shoppingmall.admin.order.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

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
	
	@RequestMapping("/admin/orderList{idx}")
	public String listIdx(@PathVariable String idx,HttpServletRequest request,Model model){
			Page myPage = null;
			myPage = new Page(Integer.parseInt(idx));
			PageService ps = new PageServiceImpl(5,myPage,pageService.getTotRowCnt());
			model.addAttribute("pageMaker",ps);
			model.addAttribute("posts",postService.getPosts(myPage));
			List<Purchase> purchases = orderService.getOrders();
			model.addAttribute("purchases",purchases);
			return "manager/order/orderList";
	}
}
