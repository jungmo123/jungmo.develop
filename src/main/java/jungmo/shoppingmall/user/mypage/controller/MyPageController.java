package jungmo.shoppingmall.user.mypage.controller;

import java.io.*;
import java.sql.Date;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.user.mypage.domain.*;
import jungmo.shoppingmall.user.mypage.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.dao.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.apache.commons.io.FilenameUtils;

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
	private String reImageUrl1 = "";
	private String reImageUrl2 = "";
	private String reImageUrl3 = "";
	private List<String> fileList;
	
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
	
	@RequestMapping("/mypage/orderHistory")
	public String oH(){
		return "redirect:orderHistory1";
	}
	
	@RequestMapping("/mypage/orderHistory{idx}")
	public String orderHistory(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,"");
		return "user/mypage/shopping/orderHistory";
	}
	
	@RequestMapping(value = "/mypage/orderHistorySearch{idx}",method=RequestMethod.POST)
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
	
	@RequestMapping(value = "/mypage/orderHistorySearch{idx}",method=RequestMethod.GET)
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
	
	@RequestMapping(value = "/mypage/orderHistoryDetail{idx}",method=RequestMethod.POST)
	public String orderHistorySearch(@PathVariable String idx,HttpServletRequest request,Model model){
		PurchaseList p = orderService.getPurchase(idx);
		model.addAttribute("purchase", p);
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		model.addAttribute("nda",clauseService.getNoDeliveryArea());
		return "user/mypage/shopping/orderHistoryDetail";
	}
	
	@RequestMapping("/mypage/modifyDI")
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
	
	@RequestMapping("/mypage/insertOrderCancel")
	@ResponseBody
	public String insertOrderCancel(String ordNum){
		try{
			return mypageService.updateOrderCancel(ordNum);
		}catch(Exception e){
			return "error";
		}
	}
	
	
	@RequestMapping(value ="/mypage/refundAndExchange{idx}",method=RequestMethod.POST)
	public String refundAndExchange(@PathVariable String idx,HttpServletRequest request,Model model){
		String type = request.getParameter("type");
		String ordName = request.getParameter("ordName");
		model.addAttribute("ordName", ordName);
		model.addAttribute("ordNum", idx);
		model.addAttribute("reasons",mypageService.getReason());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		return "user/mypage/shopping/refundAndExchange";
	}
	
	@RequestMapping("/mypage/addRe")
	@ResponseBody
	public String addRe(MultipartHttpServletRequest request){
		fileList = new ArrayList<>();
		String dir = request.getServletContext().getRealPath("/upload");
		try{
			return mypageService.addRea(request,mypageService,fileList);
		}catch(Exception e){
			if(fileList.size() != 0){
				for(int i = 0 ; i < fileList.size() ; i++){
					String filePath = dir + "/" + fileList.get(i);
					  File f = new File(filePath);
					 if(f.exists()){
						f.delete();
					}					
				}
			}
			return "error";
		}
	}
	
	@RequestMapping("/mypage/deleteRe")
	@ResponseBody
	public String deleteRe(String ordNum,String rx,HttpServletRequest request){
		String dir = request.getServletContext().getRealPath("/upload");
		if(rx.equals("exchange")){
			mypageService.deleteExchange(ordNum);
			if(fileList.size() != 0){
				for(int i = 0 ; i < fileList.size() ; i++){
					String filePath = dir + "/" + fileList.get(i);
					  File f = new File(filePath);
					 if(f.exists()){
						f.delete();
					}					
				}
			}
		}else{
			mypageService.deleteRefund(ordNum);
			if(fileList.size() != 0){
				for(int i = 0 ; i < fileList.size() ; i++){
					String filePath = dir + "/" + fileList.get(i);
					  File f = new File(filePath);
					 if(f.exists()){
						f.delete();
					}					
				}
			}
		}
		return "";
	}
	
	@RequestMapping(value = "/mypage/refundAndExchangeConfirm{idx}",method=RequestMethod.POST)
	public String refundAndExchangeConfirm(@PathVariable String idx,HttpServletRequest request,Model model){
		String ordName = request.getParameter("ordName");
		String rea = request.getParameter("rea");
		model.addAttribute("ordName", ordName);
		if(rea.equals("교환")){
			RefundAndExchange exc1 = mypageService.getExchange(idx);
			List<ImageList> exc2 = mypageService.getExchangeImage(idx);
			RefundAndExchangeImage exc3 = new RefundAndExchangeImage(idx,exc2);
			model.addAttribute("rea", exc1);
			model.addAttribute("imgList", exc3);
		}else{
			RefundAndExchange ref1 = mypageService.getRefund(idx);
			List<ImageList> ref2 = mypageService.getRefundImage(idx);
			RefundAndExchangeImage ref3 = new RefundAndExchangeImage(idx,ref2);
			model.addAttribute("rea", ref1);
			model.addAttribute("imgList", ref3);
		}
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		return "user/mypage/shopping/reaConfirm";
	}
	
	@RequestMapping("/mypage/cart")
	public String cart(HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		List<Cart> carts = mypageService.getCart(userId);
		List<CartList> cartList = new ArrayList<>();
		CartList cart2 = null;
		String cartNum = "";
		for(int i = 0 ; i < carts.size() ; i++){
			Cart cart = carts.get(i);
			if(i == 0){
				cartNum = cart.getCartNum();
				String godNum = cart.getGodNum();
				String godName = cart.getGodName();
				String godListImageUrl = cart.getGodListImageUrl();
				String godSellingPrice = cart.getGodSellingPrice();
				String godAmount = cart.getGodAmount();
				String optName = cart.getOptName();
				String optContent = cart.getOptContent();
				String optPrice = cart.getOptPrice();
				cart2 = new CartList(cartNum,godNum,godName,godListImageUrl,godSellingPrice,godAmount);
				List<GoodsOption> godoList = cart2.getGodoList();
				GoodsOption go = new GoodsOption(optName,optContent,optPrice);
				godoList.add(go);
			}else{
				if(!cart.getCartNum().equals(cartNum)){
					cartList.add(cart2);
					cartNum = cart.getCartNum();
					String godNum = cart.getGodNum();
					String godName = cart.getGodName();
					String godListImageUrl = cart.getGodListImageUrl();
					String godSellingPrice = cart.getGodSellingPrice();
					String godAmount = cart.getGodAmount();
					String optName = cart.getOptName();
					String optContent = cart.getOptContent();
					String optPrice = cart.getOptPrice();
					cart2 = new CartList(cartNum,godNum,godName,godListImageUrl,godSellingPrice,godAmount);
					List<GoodsOption> godoList = cart2.getGodoList();
					GoodsOption go = new GoodsOption(optName,optContent,optPrice);
					godoList.add(go);
				}else{
					String optName = cart.getOptName();
					String optContent = cart.getOptContent();
					String optPrice = cart.getOptPrice();				
					List<GoodsOption> godoList = cart2.getGodoList();
					GoodsOption go = new GoodsOption(optName,optContent,optPrice);
					godoList.add(go);
				}
			}
		}
		cartList.add(cart2);
		model.addAttribute("carts", cartList);
		return "user/mypage/shopping/cart";
	}
	
	@RequestMapping("/mypage/amountModify")
	@ResponseBody
	public String amountModify(String cartNum,String cartAmount){
		mypageService.modifyCartAmountString(cartNum, cartAmount);
		return "";
	}
	
	@RequestMapping("/mypage/deleteCart")
	@ResponseBody
	public String deleteCart(String[] list){
		List<String> array = new ArrayList<>();
		for(int i = 0 ; i < list.length ; i++){
			array.add(list[i]);
		}
		HashMap<String,List<String>> go = new HashMap<>(); 
		go.put("list", array);
		mypageService.deleteCart(go);
		return "";
	}
}
