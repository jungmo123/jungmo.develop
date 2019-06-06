package jungmo.shoppingmall.user.styleshop.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.user.styleshop.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class StyleShopController {
	@Autowired private GoodsCategoriesService gcService;
	@Autowired private StyleShopService ssService;
	@Autowired private UPageService pageService;
	private String godrIndex = "1";
	
	public void common(HttpServletRequest request,Model model,String idx,String godcNum,String type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),20,godcNum,type);
		UPageService ps = new UPageServiceImpl(5,myPage,pageService.getTotRowCnt(godcNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("goods",ssService.getGoods(myPage));
		model.addAttribute("godcNum",godcNum);
		model.addAttribute("type",type);

	}
	
	public void godr(String idx,String godNum,String userId,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodNum(godNum);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getGodrTotRowCnt(godNum));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("godr", ssService.getGoodsReviews(myPage));
		map.put("userId", userId);
	}
	
	@RequestMapping("/styleshop{godcNum}I{idx}I{type}")
	public String styleShop(@PathVariable String godcNum,@PathVariable String idx,@PathVariable String type,HttpServletRequest request,Model model){
		model.addAttribute("godc", gcService.getCategory(godcNum));
		common(request,model,idx,godcNum,type);
		return "user/goods/styleshop";
	}
	
	@RequestMapping("/goodsDetail{godNum}")
	public String styleShop(@PathVariable String godNum,HttpServletRequest request,Model model){
		model.addAttribute("godNum", godNum);
		return "user/goods/goodsDetail";
	}
	
	@RequestMapping("/getGoodsReviews")
	@ResponseBody
	public Map<String,Object> getGoodsReviews(String godNum,String idx,HttpServletRequest request){
		if(!idx.equals("0")){
			godrIndex = idx;
		}
		System.out.println(godrIndex);
		String userId = (String)request.getSession().getAttribute("user");
		Map<String,Object> map = new HashMap<>();
		godr(godrIndex,godNum,userId,map);
		return map;
	}
}
