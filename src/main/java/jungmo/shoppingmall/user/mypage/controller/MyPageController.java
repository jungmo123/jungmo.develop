package jungmo.shoppingmall.user.mypage.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MyPageController {
	@Autowired private PageService pageService;
	@Autowired private PostService postService;
	@Autowired private OrderService orderService;
	
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
}
