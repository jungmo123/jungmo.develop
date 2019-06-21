package jungmo.shoppingmall.user.mypage.controller;

import java.sql.Date;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.user.mypage.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.dao.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class MyPageController {
	@Autowired private PageService pageService;
	@Autowired private PostService postService;
	@Autowired private OrderService orderService;
	@Autowired private MyPageService mypageService;
	@Autowired private ClauseService clauseService;
	private Date date1;
	private Date date2;
	private Date date3;
	private String sdate;
	private String edate;
	
	public void common(HttpServletRequest request,Model model,String idx,String Type){
		String userId = (String)request.getSession().getAttribute("user");
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setUserId(userId);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getMyTotRowCnt(userId));
		model.addAttribute("pageMaker",ps);
		List<PurchaseList> purchases = postService.getOrders(myPage);
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
	
	@RequestMapping("/orderHistory")
	public String oH(){
		return "redirect:orderHistory1";
	}
	
	@RequestMapping("/orderHistory{idx}")
	public String orderHistory(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,"");
		return "user/mypage/shopping/orderHistory";
	}
	
	@RequestMapping(value = "/orderHistorySearch{idx}",method=RequestMethod.POST)
	public String search(HttpServletRequest request,Model model){
		String str = request.getParameter("period");
		if(str != null){
			if(str.equals("sysdate")){
				sdate = mypageService.sdate();
				edate = mypageService.edate();
			}else if(str.equals("1week")){
				sdate = mypageService.week1();
				edate = mypageService.sdate();
			}else if(str.equals("3week")){
				sdate = mypageService.week3();
				edate = mypageService.sdate();				
			}else if(str.equals("1month")){
				sdate = mypageService.month1();
				edate = mypageService.sdate();				
			}else if(str.equals("3month")){
				sdate = mypageService.month3();
				edate = mypageService.sdate();				
			}
		}else{
			date1 = Date.valueOf(request.getParameter("date1"));
			date2 = Date.valueOf(request.getParameter("date2"));
			int compare = date1.compareTo(date2);
			if(compare > 0){
				date3 = date1;
				date1 = date2;
				date2 = date3;
			}
			sdate = date1.toString();
			edate = date2.toString();
		}
		String userId = (String)request.getSession().getAttribute("user");
		Page myPage = null;
		myPage = new Page(1,5,sdate,edate,userId);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getMyDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<PurchaseList> purchases = postService.getMyDatePosts(myPage);
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
		model.addAttribute("type","Search");

		return "user/mypage/shopping/orderHistory";
	}
	
	@RequestMapping(value = "/orderHistorySearch{idx}",method=RequestMethod.GET)
	public String Gsearch(@PathVariable String idx,HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,sdate,edate,userId);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getMyDateTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		List<PurchaseList> purchases = postService.getMyDatePosts(myPage);
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
		model.addAttribute("type","Search");

		return "user/mypage/shopping/orderHistory";
	}
	
	@RequestMapping(value = "/orderHistoryDetail{idx}",method=RequestMethod.POST)
	public String orderHistorySearch(@PathVariable String idx,HttpServletRequest request,Model model){
		PurchaseList p = orderService.getPurchase(idx);
		model.addAttribute("purchase", p);
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		model.addAttribute("nda",clauseService.getNoDeliveryArea());
		return "user/mypage/shopping/orderHistoryDetail";
	}
	
	@RequestMapping("/modifyDI")
	@ResponseBody
	public PurchaseList modifyDI(MultipartHttpServletRequest request){
		String ordNum = request.getParameter("ordNum");
		String userName = request.getParameter("name");
		String userPostCode = request.getParameter("userPostcode");
		String userStreet = request.getParameter("userStreet");
		String userDetailArea = request.getParameter("userDetailArea");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		String userRequest = request.getParameter("request");
		orderService.modifyDi(ordNum, userPostCode, userStreet, userDetailArea, userRequest, userName, phone);
		PurchaseList p = orderService.getPurchase(ordNum);
		return p;
	}
	
	@RequestMapping("/insertOrderCancel")
	@ResponseBody
	public String insertOrderCancel(String ordNum){
		try{
			return mypageService.updateOrderCancel(ordNum);
		}catch(Exception e){
			return "error";
		}
	}
	
	
	@RequestMapping(value ="/refundAndExchange{idx}",method=RequestMethod.POST)
	public String refundAndExchange(@PathVariable String idx,HttpServletRequest request,Model model){
		String type = request.getParameter("type");
		String ordName = request.getParameter("ordName");
		model.addAttribute("ordName", ordName);
		if(type.equals("modify")){
			
		}
		return "user/mypage/shopping/refundAndExchange";
	}
}
