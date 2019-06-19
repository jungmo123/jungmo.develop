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
	private String cancel;
	private String refund;
	private String exchange;
	
	public void modify(String ordNum){
		String list = ordNum;
		String type = "배송준비중";
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
	}
	
	public void common(HttpServletRequest request,Model model,String idx,String Type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),Type);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getTotRowCnt(Type));
		model.addAttribute("pageMaker",ps);
		List<PurchaseList> purchases = postService.getPosts(myPage);
		for(int i = 0 ; i < purchases.size() ; i++){
			PurchaseList go = purchases.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",Type);
		model.addAttribute("delivery",orderService.getDv(1));
	}
	
	public void cancel(HttpServletRequest request,Model model,String idx,String Type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),Type);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getCancelTotRowCnt(Type));
		model.addAttribute("pageMaker",ps);
		List<OrderCancel> ordercancel = postService.getCancelPosts(myPage);
				for(int i = 0 ; i < ordercancel.size() ; i++){
					OrderCancel go = ordercancel.get(i);
					List<GoodsList> gl = go.getGoods();
					String ordNum = go.getOrdNum();
					for(int j = 0 ; j < gl.size() ; j++){
						GoodsList g = gl.get(j);
						String godNum = String.valueOf(g.getGodNum());
						String purNum =  String.valueOf(g.getPurNum());
						g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
					}
				}		
		model.addAttribute("ordercancel",ordercancel);
		model.addAttribute("type",Type);
	}
	
	public void refund(HttpServletRequest request,Model model,String idx,String Type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),Type);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getRefundTotRowCnt(Type));
		model.addAttribute("pageMaker",ps);
		List<Refund> refund = postService.getRefundPosts(myPage);
		for(int i = 0 ; i < refund.size() ; i++){
			Refund go = refund.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("refund",refund);
		model.addAttribute("type",Type);
	}
	
	public void exchange(HttpServletRequest request,Model model,String idx,String Type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),Type);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getExchangeTotRowCnt(Type));
		model.addAttribute("pageMaker",ps);
		List<Exchange> exchange = postService.getExchangePosts(myPage);
		for(int i = 0 ; i < exchange.size() ; i++){
			Exchange go = exchange.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("exchange",exchange);
		model.addAttribute("type",Type);
	}
	
	public void date(HttpServletRequest request,Model model,String idx){
		String type = "search";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,date1,date2,search);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<PurchaseList> purchases = postService.getDatePosts(myPage);
		for(int i = 0 ; i < purchases.size() ; i++){
			PurchaseList go = purchases.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",type);	
		model.addAttribute("delivery",orderService.getDv(1));
	}
	
	public void canceldate(HttpServletRequest request,Model model,String idx){
		String type = "search";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,date1,date2,cancel);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getCancelDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<OrderCancel> ordercancel = postService.getCancelDatePosts(myPage);
		for(int i = 0 ; i < ordercancel.size() ; i++){
			OrderCancel go = ordercancel.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}	
		model.addAttribute("ordercancel",ordercancel);
		model.addAttribute("type",type);
	}
	
	public void refunddate(HttpServletRequest request,Model model,String idx){
		String type = "search";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,date1,date2,refund);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getRefundDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<Refund> refund = postService.getRefundDatePosts(myPage);
		for(int i = 0 ; i < refund.size() ; i++){
			Refund go = refund.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("refund",refund);
		model.addAttribute("type",type);
	}
	
	public void exchangedate(HttpServletRequest request,Model model,String idx){
		String type = "search";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,date1,date2,exchange);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getExchangeDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<Exchange> exchange = postService.getExchangeDatePosts(myPage);
		for(int i = 0 ; i < exchange.size() ; i++){
			Exchange go = exchange.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("exchange",exchange);
		model.addAttribute("type",type);
	}
	 
	@RequestMapping("/admin/orderList")
	public String orderList(){
		return "redirect:orderListAll1";
	}
	
	@RequestMapping("/admin/orderCancel")
	public String orderCancel(){
		return "redirect:orderCancelOne1";
	}
	
	@RequestMapping("/admin/orderRefund")
	public String orderRefund(){
		return "redirect:orderRefundOne1";
	}
	
	@RequestMapping("/admin/orderExchange")
	public String orderExchange(){
		return "redirect:orderExchangeOne1";
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
		List<PurchaseList> purchases = postService.getDatePosts(myPage);
		for(int i = 0 ; i < purchases.size() ; i++){
			PurchaseList go = purchases.get(i);
			List<GoodsList> gl = go.getGoods();
			String ordNum = go.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}
		}
		model.addAttribute("purchases",purchases);
		model.addAttribute("type",type);

		return "manager/order/orderList";
	}
	
	@RequestMapping(value = "/admin/Cancelsearch",method=RequestMethod.POST)
	public String cancelSearch(HttpServletRequest request,Model model){
		date1 = Date.valueOf(request.getParameter("date1"));
		date2 = Date.valueOf(request.getParameter("date2"));
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = date1;
			date1 = date2;
			date2 = date3;
		}
		cancel = request.getParameter("Cancelsearch");
		
		
		canceldate(request,model,"1");

		return "manager/order/orderCancel";
	}
	
	@RequestMapping(value = "/admin/Refundsearch",method=RequestMethod.POST)
	public String refundSearch(HttpServletRequest request,Model model){
		date1 = Date.valueOf(request.getParameter("date1"));
		date2 = Date.valueOf(request.getParameter("date2"));
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = date1;
			date1 = date2;
			date2 = date3;
		}
		refund = request.getParameter("Refundsearch");
		
		
		refunddate(request,model,"1");

		return "manager/order/orderRefund";
	}
	
	@RequestMapping(value = "/admin/Exchangesearch",method=RequestMethod.POST)
	public String exchangeSearch(HttpServletRequest request,Model model){
		date1 = Date.valueOf(request.getParameter("date1"));
		date2 = Date.valueOf(request.getParameter("date2"));
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = date1;
			date1 = date2;
			date2 = date3;
		}
		exchange = request.getParameter("Exchangesearch");
		exchangedate(request,model,"1");

		return "manager/order/orderExchange";
	}
	
	@RequestMapping("/admin/orderCancelsearch{idx}")
	public String CancelsearchList(@PathVariable String idx,HttpServletRequest request,Model model){
		canceldate(request,model,idx);
		return "manager/order/orderCancel";
	}
	
	@RequestMapping("/admin/orderListsearch{idx}")
	public String searchList(@PathVariable String idx,HttpServletRequest request,Model model){
		date(request,model,idx);
		return "manager/order/orderList";
	}
	
	@RequestMapping("/admin/orderRefundsearch{idx}")
	public String RefundsearchList(@PathVariable String idx,HttpServletRequest request,Model model){
		refunddate(request,model,idx);
		return "manager/order/orderRefund";
	}
	
	@RequestMapping("/admin/orderExchangesearch{idx}")
	public String ExchangesearchList(@PathVariable String idx,HttpServletRequest request,Model model){
		exchangedate(request,model,idx);
		return "manager/order/orderExchange";
	}
	
	@RequestMapping("/admin/orderDetail{idx}")
	public String searchList(@PathVariable String idx,Model model){
		PurchaseList purchase = orderService.getPurchase(idx);
			List<GoodsList> gl = purchase.getGoods();
			String ordNum = purchase.getOrdNum();
			for(int j = 0 ; j < gl.size() ; j++){
				GoodsList g = gl.get(j);
				String godNum = String.valueOf(g.getGodNum());
				String purNum =  String.valueOf(g.getPurNum());
				g.setGodoList(postService.getGodo(ordNum, godNum, purNum));
			}	
		model.addAttribute("purchase",purchase);
		model.addAttribute("savePoint",orderService.getSm(1));
		model.addAttribute("delivery",orderService.getDv(1));
		return "manager/order/orderDetail";
	}
	
	@RequestMapping(value="/admin/modifyOrder",method=RequestMethod.POST)
	@ResponseBody
	public boolean modifyOrder(String ordNum,String deliveryRequest,String userName,String userPostCode,String userStreet,String userDetailArea,String phone1,String phone2,String phone3,String memo,String ordType,String invoiceNum){
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		boolean data = true;
		HashMap<String,List<String>> option = new HashMap<>();
		List<String> tp = new ArrayList<>();
		List<String> ls = new ArrayList<>();
		ls.add(ordNum);
		tp.add(ordType);
		option.put("list", ls);
		option.put("type", tp);
		if(ordType.equals("주문취소")){
			if(orderService.getOrderCancel(ordNum) != null){
				data = false;
			}else{
				orderService.addOrdercancel(ordNum);
				orderService.addMlc(option);
				data = true;
			}
		}else{
			if(orderService.getOrderCancel(ordNum) != null){
				orderService.deleteOrdercancel(ordNum);
				orderService.addMlc(option);
			}else{
				orderService.addMlc(option);
			}
		}
		orderService.modifyOrder(ordType,ordNum,deliveryRequest,userName, phone, userPostCode, userStreet, userDetailArea,memo);
		return data;
	}
	
	@RequestMapping("/admin/orderRefundOne{idx}")
	public String orderrefundOne(@PathVariable String idx,HttpServletRequest request,Model model){
		refund(request,model,idx,"One");
		return "manager/order/orderRefund";
	}
	@RequestMapping("/admin/orderRefundTwo{idx}")
	public String orderrefundTwo(@PathVariable String idx,HttpServletRequest request,Model model){
		refund(request,model,idx,"Two");
		return "manager/order/orderRefund";
	}
	
	@RequestMapping("/admin/orderExchangeOne{idx}")
	public String orderexchangeOne(@PathVariable String idx,HttpServletRequest request,Model model){
		exchange(request,model,idx,"One");
		return "manager/order/orderExchange";
	}
	@RequestMapping("/admin/orderExchangeTwo{idx}")
	public String orderexchangeTwo(@PathVariable String idx,HttpServletRequest request,Model model){
		exchange(request,model,idx,"Two");
		return "manager/order/orderExchange";
	}
	
	@RequestMapping("/admin/orderCancelOne{idx}")
	public String ordercancelOne(@PathVariable String idx,HttpServletRequest request,Model model){
		cancel(request,model,idx,"One");
		return "manager/order/orderCancel";
	}
	
	@RequestMapping("/admin/orderCancelTwo{idx}")
	public String ordercancelTwo(@PathVariable String idx,HttpServletRequest request,Model model){
		cancel(request,model,idx,"Two");
		return "manager/order/orderCancel";
	}
	
	@RequestMapping("/admin/cancelModify")
	public String cancelModify(HttpServletRequest request,Model model){
		String list = request.getParameter("list");
		String type = "처리완료";
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
			orderService.cancelModify(option);
			orderService.addMlc(option);
		}

		cancel(request,model,"1","One");
		return "manager/order/orderCancel";
	}
	
	@RequestMapping("/admin/refundModify")
	public String refundModify(HttpServletRequest request,Model model){
		String list = request.getParameter("list");
		String type = "처리완료";
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
			orderService.refundModify(option);
			orderService.addMlc(option);
		}

		refund(request,model,"1","One");
		return "manager/order/orderRefund";
	}
	
	@RequestMapping("/admin/exchangeModify")
	public String exchangeModify(HttpServletRequest request,Model model){
		String list = request.getParameter("list");
		String type = "처리완료";
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
			orderService.exchangeModify(option);
			orderService.addMlc(option);
		}

		exchange(request,model,"1","One");
		return "manager/order/orderExchange";
	}
	
	@RequestMapping("/admin/ExchangeDetail{idx}")
	public String exchangeDetail(@PathVariable String idx,HttpServletRequest request,Model model){
		Exchange exchange = orderService.getOrderExchange(idx);
		model.addAttribute("exchange",exchange);
		return "/manager/order/orderExchangeDetail";
	}
	
	@RequestMapping("/admin/RefundDetail{idx}")
	public String refundDetail(@PathVariable String idx,HttpServletRequest request,Model model){
		Refund refund = orderService.getOrderRefund(idx);
		model.addAttribute("refund",refund);
		return "/manager/order/orderRefundDetail";
	}
	
	@RequestMapping("/admin/refundSave")
	public String refundSave(HttpServletRequest request){
		String state = request.getParameter("select");
		String ordNum = request.getParameter("ordNum");
		String content = request.getParameter("content");
		String memo = request.getParameter("memo");
		orderService.refundDetailModify(ordNum, content, state, memo);
		List<String> ls = new ArrayList<>();
		List<String> tp = new ArrayList<>();
		HashMap<String,List<String>> option = new HashMap<>();
		ls.add(ordNum);
		tp.add(state);
		option.put("list",ls);
		option.put("type", tp);
		orderService.addMlc(option);
		return "redirect:orderRefundOne1";
	}
	
	@RequestMapping("/admin/exchangeSave")
	public String exchangeSave(HttpServletRequest request){
		String state = request.getParameter("select");
		String ordNum = request.getParameter("ordNum");
		String content = request.getParameter("content");
		String memo = request.getParameter("memo");
		orderService.exchangeDetailModify(ordNum, content, state, memo);
		List<String> ls = new ArrayList<>();
		List<String> tp = new ArrayList<>();
		HashMap<String,List<String>> option = new HashMap<>();
		ls.add(ordNum);
		tp.add(state);
		option.put("list",ls);
		option.put("type", tp);
		orderService.addMlc(option);		
		return "redirect:orderExchangeOne1";
	}
	
	@RequestMapping("/admin/orderRefundDelete")
	public String refundDelete(HttpServletRequest request){
		String ordNum = request.getParameter("ordNum");
		orderService.deleteRefundImage(ordNum);
		orderService.deleteRefund(ordNum);
		modify(ordNum);
		return "redirect:orderRefundOne1";
	}
	
	@RequestMapping("/admin/orderExchangeDelete")
	public String exchangeDelete(HttpServletRequest request){
		String ordNum = request.getParameter("ordNum");
		orderService.deleteExchangeImage(ordNum);
		orderService.deleteExchange(ordNum);
		modify(ordNum);
		return "redirect:orderExchangeOne1";
	}
}
