package jungmo.shoppingmall.user.buy.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.domain.PurchaseList;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.admin.user.service.*;
import jungmo.shoppingmall.user.buy.domain.*;
import jungmo.shoppingmall.user.buy.service.*;
import jungmo.shoppingmall.user.login.domain.*;
import net.sf.json.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.dao.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.siot.IamportRestClient.*;
import com.siot.IamportRestClient.exception.*;
import com.siot.IamportRestClient.response.*;

@Controller
public class BuyController {
	@Autowired private ClauseService clauseService;
	@Autowired private UserService userService;
	@Autowired private BuyService buyService;
	@Autowired private OrderService orderService;
	private List<BuyList> buyList;
	private IamportClient client;
	
	@RequestMapping("/addBuy")
	@ResponseBody
	public String addBuy(HttpServletRequest request,@RequestBody String param) throws Exception{
		List<Map<String,String>> result = new ArrayList<>();
		result = JSONArray.fromObject(param);	
		BuyList buy = null;
		GoodsOption go;
		for(int i = 0 ; i < result.size() ; i++){
			Map<String,String> list = result.get(i);
			String godNum = list.get("godNum");
			String userId = list.get("userId");
			String godAmount = list.get("godAmount");
			String godName = list.get("godName");
			String godcName = list.get("godcName");
			String godSellingPrice = list.get("godSellingPrice");
			String godListImageUrl = list.get("godListImageUrl");
			String optionName = list.get("optionName");
			String optionContent = list.get("optionContent");
			String optionPrice = list.get("optionPrice");	
			if(i == 0){
				buy = new BuyList(userId,godNum,godAmount,godName,godcName,godSellingPrice,godListImageUrl);
				if(!optionName.equals("")){
					go = new GoodsOption(Integer.parseInt(godNum),optionName,optionContent,optionPrice);
					buy.getGodoList().add(go);
				}
			}else{			
				go = new GoodsOption(Integer.parseInt(godNum),optionName,optionContent,optionPrice);
				buy.getGodoList().add(go);
			}
		}
		buyList = new ArrayList<>();
		buyList.add(buy);
		return "";
	}
	
	@RequestMapping(value = "/GoodsBuy",method=RequestMethod.POST)
	public String goodsBuy(HttpServletRequest request,Model model){
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
		return "user/buy/GoodsBuy";
	}
	
	@RequestMapping(value = "/GoodsBuyResult",method=RequestMethod.POST)
	public String GoodsBuyResult(HttpServletRequest request,Model model){
		String ordNum = request.getParameter("ordNum");
		PurchaseList p = orderService.getPurchase(ordNum);
		model.addAttribute("purchase", p);
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		return "user/buy/GoodsBuyResult";
	}
	
	@RequestMapping("/getOrderNum")
	@ResponseBody
	public int getOrderNum(HttpServletRequest request){
		return buyService.getOrderNum();
	}
	
	@RequestMapping("/createOrder")
	@ResponseBody
	public String createOrder(MultipartHttpServletRequest request){
		try{
			return buyService.insertOrder(request,buyService, buyList);
		}catch(DuplicateKeyException e){
			return "error";
		}
	}
	
	@RequestMapping("/deleteOrder")
	@ResponseBody
	public String deleteOrder(String day){
		buyService.deleteOrder(day);
		return "";
	}
	
	@RequestMapping("/payment")
	@ResponseBody
	public String payment(String imp){
		String test_imp_uid = imp;
		String test_api_key = "5368000379886321";
		String test_api_secret = "Qoutm7mTq3Jx5ORMKICp6UBHCmYrfSS6hmADtWxU0gr55jSP2ue9pQQ1dPstHkzYHaCb6966qxbvR4lT";
		client = new IamportClient(test_api_key, test_api_secret);
		try {
			IamportResponse<Payment> payment_response = client.paymentByImpUid(test_imp_uid);
			assertNotNull(payment_response.getResponse());
			assertEquals(test_imp_uid, payment_response.getResponse().getImpUid());
			String state = payment_response.getResponse().getStatus();
			if(state.equals("paid")) {
				return "success";
			}else {
				return "cancel";
			}
		} catch (IamportResponseException e) {
			String error = "";
			switch(e.getHttpStatusCode()) {
			case 401 :
				error = "401";
				break;
			case 500 :
				error = "500";
				break;
			}
			return error;
		} catch (IOException e) {
			e.printStackTrace();
			return "ioe";
		}		
	}
}
