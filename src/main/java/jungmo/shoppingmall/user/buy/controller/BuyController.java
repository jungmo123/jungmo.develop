package jungmo.shoppingmall.user.buy.controller;

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

@Controller
public class BuyController {
	@Autowired private ClauseService clauseService;
	@Autowired private UserService userService;
	@Autowired private BuyService buyService;
	@Autowired private OrderService orderService;
	private List<BuyList> buyList;
	
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
}
