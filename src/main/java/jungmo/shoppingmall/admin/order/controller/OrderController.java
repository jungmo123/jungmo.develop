package jungmo.shoppingmall.admin.order.controller;

import java.sql.Date;
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
	private Date date1;
	private Date date2;
	private Date date3;
	private String search;
	
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
	
	public void date(HttpServletRequest request,Model model,String idx){
		String type = "search";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,date1,date2,search);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",postService.getDatePosts(myPage));
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",type);		
	}
	 
	@RequestMapping("/admin/orderList")
	public String orderList(){
		return "redirect:orderListAll1";
	}
	
	@RequestMapping("/admin/orderCancel")
	public String orderCancel(){
		return "redirect:orderCancel1";
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
			orderService.addMlc(option);
		}

		common(request,model,"1","All");
		return "manager/order/orderList";
	}
	
	@RequestMapping(value = "/admin/search",method=RequestMethod.POST)
	public String search(HttpServletRequest request,Model model){
		date1 = Date.valueOf(request.getParameter("date1"));
		date2 = Date.valueOf(request.getParameter("date2"));
		String type = "search";
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = date1;
			date1 = date2;
			date2 = date3;
		}
		search = request.getParameter("search");
		
		Page myPage = null;
		myPage = new Page(1,5,date1,date2,search);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",postService.getDatePosts(myPage));
		List<Purchase> purchases = orderService.getOrders();
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",type);

		return "manager/order/orderList";
	}
	 
	@RequestMapping("/admin/orderListsearch{idx}")
	public String searchList(@PathVariable String idx,HttpServletRequest request,Model model){
		date(request,model,idx);
		return "manager/order/orderList";
	}
	
	@RequestMapping("/admin/orderDetail{idx}")
	public String searchList(@PathVariable String idx,Model model){
		System.out.println(orderService.getPurchase(idx).getOrder().getUser().getUserPhone());
		model.addAttribute("purchase",orderService.getPurchase(idx));
		model.addAttribute("savePoint",orderService.getSm(1));
		model.addAttribute("delivery",orderService.getDv(1));
		return "manager/order/orderDetail";
	}
	
	@RequestMapping("/admin/orderCancel{idx}")
	public String ordercancelAll(@PathVariable String idx,HttpServletRequest request,Model model){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),"Four");
		PageService ps = new PageServiceImpl(5,myPage,pageService.getTotRowCnt("Four"));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",postService.getPosts(myPage));
		List<OrderCancel> ordercancel = orderService.getOrderCancels();
		model.addAttribute("ordercancel",ordercancel);
		model.addAttribute("type","Four");		
		System.out.println(orderService.getOrderCancels().get(0).getGoods().get(0).getGodName());
		return "manager/order/orderCancel";
	}
}
