package jungmo.shoppingmall.user.mypage.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.domain.PurchaseList;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.admin.user.service.*;
import jungmo.shoppingmall.user.buy.domain.*;
import jungmo.shoppingmall.user.buy.service.*;
import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.login.service.*;
import jungmo.shoppingmall.user.mypage.domain.*;
import jungmo.shoppingmall.user.mypage.service.*;
import jungmo.shoppingmall.user.styleshop.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.dao.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

@Controller
public class MyPageController {
	@Autowired private PageService pageService;
	@Autowired private PostService postService;
	@Autowired private OrderService orderService;
	@Autowired private MyPageService mypageService;
	@Autowired private ClauseService clauseService;
	@Autowired private UserService userService;
	@Autowired private BuyService buyService;
	@Autowired private UPageService upageService;
	@Autowired private OtoQuestionService otoService;
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private GoodsReviewService godrService;
	@Autowired private StyleShopService ssService;
	@Autowired private GoodsQuestionService godqService;
	@Autowired private LoginService loginService;
	private Date date1;
	private Date date2;
	private Date date3;
	private String sdate;
	private String edate;
	private String polgSDate;
	private String polgEDate;
	private String reImageUrl1 = "";
	private String reImageUrl2 = "";
	private String reImageUrl3 = "";
	private List<String> fileList;
	private List<CartList> cartList;
	private List<BuyList> buyList;
	private List<String>cartNums;
	private String otoqContent;
	private String reviewType;
	private String reviewIdx;
	private String godrSearch;
	private String godcNum;
	private  String godqType;
	private String godqIdx;
	private String godqSearch;
	private String godq;
	
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
			return mypageService.updateOrderCancel(ordNum,mypageService);
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
		cartList = new ArrayList<>();
		CartList cart2 = null;
		String cartNum = "";
		for(int i = 0 ; i < carts.size() ; i++){
			Cart cart = carts.get(i);
			if(i == 0){
				cartNum = cart.getCartNum();
				String godNum = cart.getGodNum();
				String godName = cart.getGodName();
				String godcName = cart.getGodcName();
				String godListImageUrl = cart.getGodListImageUrl();
				String godSellingPrice = cart.getGodSellingPrice();
				String godAmount = cart.getGodAmount();
				String optName = cart.getOptName();
				String optContent = cart.getOptContent();
				String optPrice = cart.getOptPrice();
				cart2 = new CartList(cartNum,godNum,godName,godcName,godListImageUrl,godSellingPrice,godAmount);
				List<GoodsOption> godoList = cart2.getGodoList();
				GoodsOption go = new GoodsOption(optName,optContent,optPrice);
				godoList.add(go);
			}else{
				if(!cart.getCartNum().equals(cartNum)){
					cartList.add(cart2);
					cartNum = cart.getCartNum();
					String godNum = cart.getGodNum();
					String godName = cart.getGodName();
					String godcName = cart.getGodcName();
					String godListImageUrl = cart.getGodListImageUrl();
					String godSellingPrice = cart.getGodSellingPrice();
					String godAmount = cart.getGodAmount();
					String optName = cart.getOptName();
					String optContent = cart.getOptContent();
					String optPrice = cart.getOptPrice();
					cart2 = new CartList(cartNum,godNum,godName,godcName,godListImageUrl,godSellingPrice,godAmount);
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
	
	@RequestMapping("/mypage/addCart")
	@ResponseBody
	public String addCart(String[] list,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		cartNums = new ArrayList<>();
		List<String> array = new ArrayList<>();
		buyList = new ArrayList<>();
		for(int i = 0 ; i < list.length ; i++){
			array.add(list[i]);
		}		
		for(int i = 0 ; i < cartList.size() ; i++){
			CartList cl = cartList.get(i);
			for(int j = 0 ; j < array.size() ; j++){
				if(cl.getCartNum().equals(array.get(j))){
					cartNums.add(cl.getCartNum());
					BuyList buy = new BuyList(userId,cl.getGodNum(), cl.getGodAmount(),cl.getGodName(),cl.getGodcName(),cl.getGodSellingPrice(),cl.getGodListImageUrl(),cl.getGodoList());
					buyList.add(buy);
				}
			}
		}
		return "";
	}
	
	@RequestMapping(value = "/mypage/CartBuy",method=RequestMethod.POST)
	public String CartBuy(HttpServletRequest request,Model model){
		User user = userService.getUser(buyList.get(0).getUserId());
		List<PointLogs> pl = userService.getPointLogs(user.getUserId());
		int userPoint = 0;
		for(int i = 0 ; i < pl.size() ; i++){
			userPoint +=pl.get(i).getPolgChange();
		}
		model.addAttribute("userPoint",userPoint);
		model.addAttribute("buys",buyList);
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("nda",clauseService.getNoDeliveryArea());
		model.addAttribute("user", user);
		return "user/mypage/shopping/cartBuy";
	}
	
	@RequestMapping(value = "/mypage/CartBuyResult",method=RequestMethod.POST)
	public String CartBuyResult(HttpServletRequest request,Model model){
		String ordNum = request.getParameter("ordNum");
		PurchaseList p = orderService.getPurchase(ordNum);
		model.addAttribute("purchase", p);
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		return"user/mypage/shopping/cartBuyResult";
	}
	
	@RequestMapping("/mypage/getOrderNum")
	@ResponseBody
	public int mgetOrderNum(HttpServletRequest request){
		return buyService.getOrderNum();
	}
	
	@RequestMapping("/mypage/createOrder")
	@ResponseBody
	public String mcreateOrder(MultipartHttpServletRequest request){
		try{
			return buyService.insertMOrder(request,buyService, buyList,cartNums);
		}catch(DuplicateKeyException e){
			return "error";
		}
	}
	
	@RequestMapping("/mypage/deleteOrder")
	@ResponseBody
	public String deleteOrder(String day){
		buyService.deleteOrder(day);
		return "";
	}
	
	// 포인트
	
	public void pointCommon(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getPlTotRowCnt(userId));
		model.addAttribute("pageMaker",ps);
		int totalPoint = 0;
		List<PointLogs> pointLogs = mypageService.getPl(myPage);
		for(int i = 0 ; i < pointLogs.size() ; i++){
			totalPoint += pointLogs.get(i).getPolgChange();
		}
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("pointLogs",pointLogs);
		model.addAttribute("type","");
	}
	
	public void pointSearch(HttpServletRequest request,Model model,String idx,String sdate,String edate){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId,sdate,edate);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getSearchPlTotRowCnt(myPage));
		model.addAttribute("pageMaker",ps);
		int totalPoint = 0;
		List<PointLogs> pointLogs = mypageService.getSearchPl(myPage);
		List<PointLogs> pointLog = mypageService.getPl(myPage);
		for(int i = 0 ; i < pointLog.size() ; i++){
			totalPoint += pointLog.get(i).getPolgChange();
		}
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("pointLogs",pointLogs);
		model.addAttribute("type","Search");		
	}
	
	@RequestMapping("/mypage/pointLogs")
	public String pl(){
		return "redirect:pointLogs1";
	}
		
	@RequestMapping("/mypage/pointLogs{idx}")
	public String pointLogs(@PathVariable String idx,HttpServletRequest request,Model model){
		pointCommon(request,model,idx);
		return "user/mypage/shopping/pointLogs";
	}
	
	@RequestMapping(value="/mypage/pointLogsSearch{idx}",method=RequestMethod.POST)
	public String pointLogsPSearch(@PathVariable String idx,HttpServletRequest request,Model model){
		date1 = Date.valueOf(request.getParameter("date1"));
		date2 = Date.valueOf(request.getParameter("date2"));
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = date1;
			date1 = date2;
			date2 = date3;
		}
		polgSDate = date1.toString();
		polgEDate = date2.toString();
		pointSearch(request,model,idx,polgSDate,polgEDate);
		return "user/mypage/shopping/pointLogs";
	}
	
	@RequestMapping(value="/mypage/pointLogsSearch{idx}",method=RequestMethod.GET)
	public String pointLogsGSearch(@PathVariable String idx,HttpServletRequest request,Model model){
		pointSearch(request,model,idx,polgSDate,polgEDate);
		return "user/mypage/shopping/pointLogs";
	}
	
	// 1:1 문의
	
	public void otoCommon(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getOtoqTotRowCnt(userId));
		model.addAttribute("pageMaker",ps);
		List<OtoQuestion> otoq = mypageService.getMOtoq(myPage);
		model.addAttribute("otoq", otoq);
		model.addAttribute("type","");
	}
	
	public void otoSearch(HttpServletRequest request,Model model,String idx,String otoqContent){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		myPage.setOtoqContent(otoqContent);
		UPageService ps = new UPageServiceImpl(10,myPage,upageService.getSearchOtoqTotRowCnt(otoqContent, userId));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("otoq",mypageService.getMOtoqSearch(myPage));
		model.addAttribute("type","Search");
	}
	
	@RequestMapping("/mypage/oneTwoOne")
	public String oto(){
		return "redirect:oneTwoOne1";
	}
	
	@RequestMapping("/mypage/oneTwoOne{idx}")
	public String oneTwoOne(@PathVariable String idx,HttpServletRequest request,Model model){
		otoCommon(request,model,idx);
		return "user/mypage/board/oneTwoOne";
	}
	
	@RequestMapping(value="/mypage/oneTwoOneSearch{idx}",method=RequestMethod.POST)
	public String oneTwoOnePSearch(@PathVariable String idx,HttpServletRequest request,Model model){
		otoqContent = request.getParameter("otoqContent");
		otoSearch(request,model,idx,otoqContent);
		return "user/mypage/board/oneTwoOne";
	}
	
	@RequestMapping(value="/mypage/oneTwoOneSearch{idx}",method=RequestMethod.GET)
	public String oneTwoOneGSearch(@PathVariable String idx,HttpServletRequest request,Model model){
		otoSearch(request,model,idx,otoqContent);
		return "user/mypage/board/oneTwoOne";
	}
	
	@RequestMapping(value="/mypage/oneTwoOneRead",method=RequestMethod.POST)
	public String oneTwoOne(HttpServletRequest request,Model model){
		String otoqNum = request.getParameter("otoqNum");
		model.addAttribute("oto",otoService.getOto(Integer.parseInt(otoqNum)));
		return "user/mypage/board/oneTwoOneRead";
	}
	
	@RequestMapping(value="/mypage/otoqModify",method=RequestMethod.POST)
	public String otoqPModify(Model model,HttpServletRequest request){
		String otoqNum = request.getParameter("otoqNum");
		String otocNum = request.getParameter("otocNum");
		String otoqTitle = request.getParameter("otoqTitle");
		String otoqContent = request.getParameter("otoqContent");
		model.addAttribute("otoqNum", otoqNum);
		model.addAttribute("otocNum", otocNum);
		model.addAttribute("otoqTitle", otoqTitle);
		model.addAttribute("otoqContent", otoqContent);
		model.addAttribute("otoc", mypageService.getOtoc());
		return "user/mypage/board/oneTwoOneWrite";
	}
	
	@RequestMapping(value="/mypage/otoqAdd",method=RequestMethod.GET)
	public String otoqGModify(Model model,HttpServletRequest request){
		model.addAttribute("otoc", mypageService.getOtoc());
		return "user/mypage/board/oneTwoOneWrite";
	}
	
	@RequestMapping(value="/mypage/otoqAM",method=RequestMethod.POST)
	public String otoqAM(Model model,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		String otoqNum = request.getParameter("otoqNum");
		String otocNum = request.getParameter("otocNum").trim();
		String otoqTitle = request.getParameter("otoqTitle");
		String otoqContent = request.getParameter("otoqContent");
		if(!otoqNum.equals("")){
			mypageService.modifyOtoq(new OtoQuestion(Integer.valueOf(otoqNum),Integer.valueOf(otocNum),otoqTitle,otoqContent));
		}else{
			mypageService.addOtoq(new OtoQuestion(Integer.valueOf(otocNum),otoqTitle,otoqContent,userId));
		}
		return "redirect:oneTwoOne";
	}
	
	
	
	
	// 리뷰
	
	public void godr(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getMGodrTotRowCnt(userId));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",mypageService.getMGodr(myPage));
		model.addAttribute("category",godcService.getCategories());
		reviewType = "";
		reviewIdx = idx;
	}
	
	public void godrSearch(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user"); 
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,godcNum,userId,godrSearch,true);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getMGodrSearchTotRowCnt(userId,godcNum,godrSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",mypageService.getMGodrSearch(myPage));
		model.addAttribute("type","Search");
		model.addAttribute("category",godcService.getCategories());
	} 
	
	@RequestMapping("/mypage/goodsReview")
	public String mgodr(){
		return "redirect:goodsReview1";
	}
	
	@RequestMapping("/mypage/goodsReview{idx}")
	public String mgoodsReview(@PathVariable String idx,Model model,HttpServletRequest request){
		godr(request,model,idx);
		return "user/mypage/board/goodsReview";
	}
	
	@RequestMapping(value="/mypage/goodsReviewSearch{idx}",method=RequestMethod.POST)
	public String goodsMReviewPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("godrSearch") != null){
			godrSearch = request.getParameter("godrSearch");		
		}
		if(request.getParameter("godcNum") != ""){
			godcNum= request.getParameter("godcNum");
		}
		godrSearch(request,model,idx);
		return "user/mypage/board/goodsReview";
	}
	
	@RequestMapping(value="/mypage/goodsReviewSearch{idx}",method=RequestMethod.GET)
	public String goodsMReviewGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		godrSearch(request,model,idx);
		return "user/mypage/board/goodsReview";
	}
	
	
	@RequestMapping("/mypage/modifyGoodsReview")
	@ResponseBody
	public String modifyGoodsReview(String godrNum,String godrContent,String grade,HttpServletRequest request){
		ssService.modifyGoodsReview(godrNum, godrContent, grade);
		return reviewType + reviewIdx;
	}
	
	@RequestMapping("/mypage/godrDelete")
	public String godrDelete(Model model,HttpServletRequest request){
		String Num = request.getParameter("godrNum");
		godrService.deleteGodr(Integer.parseInt(Num));
		return "redirect:goodsReview" + reviewType + reviewIdx;
	}
	
	
	
	
	// 상품 문의
	
	public void godq(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user"); 
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getMGodqTotRowCnt(userId));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("godq",mypageService.getMGodq(myPage));
		model.addAttribute("category",godcService.getCategories());
		godqType = "";
		godqIdx = idx;
	}
	
	public void godqSearch(HttpServletRequest request,Model model,String idx){
		String userId = (String)request.getSession().getAttribute("user");
		jungmo.shoppingmall.user.styleshop.domain.Page myPage = null;
		myPage = new jungmo.shoppingmall.user.styleshop.domain.Page(Integer.parseInt(idx),5,userId);
		myPage.setGodqContent(godqSearch);
		myPage.setGodqType(godq);
		UPageService ps = new UPageServiceImpl(5,myPage,upageService.getMGodqSearchTotRowCnt(userId, godq, godqSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("godq",mypageService.getMGodqSearch(myPage));
		model.addAttribute("category",godcService.getCategories());
		model.addAttribute("type","Search");
		godqType = "Search";
		godqIdx = idx;
	}
	
	@RequestMapping("/mypage/goodsQuestion")
	public String mgodq(){
		return "redirect:goodsQuestion1";
	}
	
	@RequestMapping("/mypage/goodsQuestion{idx}")
	public String goodsQuestion(@PathVariable String idx,Model model,HttpServletRequest request){
		godq(request,model,idx);
		return "user/mypage/board/goodsQuestion";
	}
	
	@RequestMapping(value="/mypage/goodsQuestionSearch{idx}",method=RequestMethod.POST)
	public String goodsQuestionPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("godqSearch") != null){
			godqSearch = request.getParameter("godqSearch");		
		}
		godq = request.getParameter("godqType");
		godqSearch(request,model,idx);
		return "user/mypage/board/goodsQuestion";
	}
	
	@RequestMapping(value="/mypage/goodsQuestionSearch{idx}",method=RequestMethod.GET)
	public String goodsQuestionGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		godqSearch(request,model,idx);
		return "user/mypage/board/goodsQuestion";
	}
	
	@RequestMapping("/mypage/questionModify")
	public String questionModify(HttpServletRequest request){
		String Num = request.getParameter("godqNum");
		String Content = "";
		if(request.getParameter("godqContent") != ""){
			Content = request.getParameter("godqContent");
		}
		godqService.updateGodq(Integer.parseInt(Num),Content);
		return "redirect:goodsQuestion" + godqType + godqIdx;
	}

	@RequestMapping("/mypage/QuestionDelete")
	public String QuestionDelete(HttpServletRequest request){
		String godqNum = request.getParameter("godqNum");
		godqService.deleteGodq(Integer.parseInt(godqNum));
		return "redirect:goodsQuestion" + godqType + godqIdx;
	}
	
	
	
	// 개인정보 수정
	
	@RequestMapping("/mypage/personalData")
	public String personalData(HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		Cookie[] myCookies = request.getCookies();
		boolean button = false;
		String address = "";
	    for(int i = 0; i < myCookies.length; i++) {
	    	if(myCookies[i].getName().equals("identification")){
	    		button = true;
	    	}
	    }
	    if(button == true){
	    	User user = mypageService.getUser(userId);
	    	model.addAttribute("user", user);
	    	address ="user/mypage/myinfo/personalData";
	    }else{
	    	address ="user/mypage/myinfo/identification";
	    	request.setAttribute("address", "personalData");
	    }
		return address;
	}
	
	@RequestMapping("/mypage/passCheck")
	@ResponseBody
	public String passCheck(String password,HttpServletRequest request,HttpServletResponse response){
		String userId = (String)request.getSession().getAttribute("user");
		User user = new User(userId,password);
		boolean u = loginService.loginTest(user);
		if(u == true){
			Cookie myCookie = new Cookie("identification", userId);
			myCookie.setMaxAge(60*60*24);
			myCookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
			response.addCookie(myCookie);
			return "true";
		}else{
			return "false";
		}
	}
	
	@RequestMapping("/mypage/modifyUser")
	@ResponseBody
	public String modifyUser(String phone1,String phone2,String phone3,String emailid,String emailAddress,String emailSelect,HttpServletRequest request,HttpServletResponse response){
		String userId = (String)request.getSession().getAttribute("user");
		String userPhone = phone1+"-"+phone2+"-"+phone3;
		String userEmail = emailid + "@" + emailAddress;
		User user = new User(userId,userEmail,userPhone,emailSelect);
		mypageService.modifyUser(user);
		return "";
	}
	
	@RequestMapping("/mypage/passwordModify")
	public String passwordModify(HttpServletRequest request,Model model){
		Cookie[] myCookies = request.getCookies();
		boolean button = false;
		String address = "";
	    for(int i = 0; i < myCookies.length; i++) {
	    	if(myCookies[i].getName().equals("identification")){
	    		button = true;
	    	}
	    }
	    if(button == true){
	    	address ="user/mypage/myinfo/passwordModify";
	    }else{
	    	address ="user/mypage/myinfo/identification";
	    	request.setAttribute("address", "passwordModify");
	    }
		return address;
	}
	
	@RequestMapping("/mypage/passModify")
	@ResponseBody
	public String passModify(String current,String change,String changeC,HttpServletRequest request,HttpServletResponse response){
		String userId = (String)request.getSession().getAttribute("user");
		User user = new User(userId,current);
		boolean u = loginService.loginTest(user);
		if(u == true){
			mypageService.updatePassword(userId, change);
			return "true";
		}else{
			return "false";
		}		
	}
	
	@RequestMapping("/mypage/unregister")
	public String unregister(HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		User user = mypageService.getUser(userId);
		model.addAttribute("user", user);
		model.addAttribute("scd", mypageService.getScd());
		return "user/mypage/myinfo/unregister";
	}
	
	@RequestMapping(value="/mypage/addSecedeUser",method = RequestMethod.POST)
	@ResponseBody
	public String addSecedeUser(String scdCode,String scdContent,String password,HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		User user = new User(userId,password);
		boolean u = loginService.loginTest(user);
		try{
			if(u == true){
				mypageService.addSecede(userId,scdCode, scdContent, password, mypageService);
				return "true";
			}else{
				return "false";
			}
		}catch(Exception e){
			return "error";
		}
	}
}
