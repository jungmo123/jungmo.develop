package jungmo.shoppingmall.admin.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	@Autowired private OrderService orderService;
	@Autowired private PageService pageService;
	@Autowired private PostService postService;
	
	public void common(HttpServletRequest request,Model model,String idx,String Type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),Type);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getTotRowCnt(Type));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",postService.getPosts(myPage));
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",Type);		
	}
	
	@RequestMapping("/admin/orderList")
	public String orderList(){
		return "redirect:orderListAll1";
	}
	
	@RequestMapping("/admin/orderListAll{idx}")
	public String listIdx(@PathVariable String idx,HttpServletRequest request,Model model){
			common(request,model,idx,"All");
			return "manager/order/orderList";
	}
	
	@RequestMapping("/admin/orderListOne{idx}")
	public String dvTypeOne(@PathVariable String idx,HttpServletRequest request,Model model){
			common(request,model,idx,"One");
			return "manager/order/orderList";
	}
	
	@RequestMapping("/admin/orderListTwo{idx}")
	public String dvTypeTwo(@PathVariable String idx,HttpServletRequest request,Model model){
			common(request,model,idx,"Two");
			return "manager/order/orderList";
	}
	
	@RequestMapping("/admin/orderListThree{idx}")
	public String dvTypeThree(@PathVariable String idx,HttpServletRequest request,Model model){
			common(request,model,idx,"Three");
			return "manager/order/orderList";
	}
	
	@RequestMapping(value = "/admin/dvModify",method=RequestMethod.POST)
	public String dvModify(HttpServletRequest request,Model model){
		String list = request.getParameter("list");
		String type = request.getParameter("dvState");
		List<String> ls = new ArrayList<>();
		List<String> tp = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(list,",");
		HashMap<String,List<String>> option = new HashMap<>();
		while(st.hasMoreElements()){
			ls.add(st.nextToken());
		}
		tp.add(type);
		option.put("list",ls);
		option.put("type", tp);
		if(ls.size() != 0){
			orderService.dvModify(option);
		}

		common(request,model,"1","All");
		return "manager/order/orderList";
	}
	
	@RequestMapping(value = "/admin/search",method=RequestMethod.POST)
	public String search(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("date1"));
		System.out.println(request.getParameter("date2"));
		System.out.println(request.getParameter("type"));
		System.out.println(request.getParameter("search"));
		return "manager/order/orderList";
	}
}
