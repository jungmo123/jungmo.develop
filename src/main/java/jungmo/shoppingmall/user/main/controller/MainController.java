package jungmo.shoppingmall.user.main.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.login.service.*;
import jungmo.shoppingmall.user.main.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	@Autowired private LoginService loginService;
	@Autowired private GoodsCategoriesService gcService;
	@Autowired private MainService mainService;
	
	@RequestMapping("/")
	public String home(HttpServletRequest request,Model model){
		List<Banner> top = new ArrayList<>();
		List<Banner> main = new ArrayList<>();
		List<Banner> left = new ArrayList<>();
		List<Banner> right = new ArrayList<>();
		Banner t = null;
		Banner m= null;
		Banner l= null;
		Banner r = null;
		List<Banner> banners = loginService.getBanner();
		for(int i = 0 ; i < banners.size() ; i++){
			Banner b = banners.get(i);
			if(b.getBnnLocation().equals("top")){
				top.add(b);
			}else if(b.getBnnLocation().equals("main")){
				main.add(b);
			}else if(b.getBnnLocation().equals("left")){
				left.add(b);
			}else if(b.getBnnLocation().equals("right")){
				right.add(b);
			}
		}
		int n;
		for(int i = 0 ; i < 4 ; i++){
			switch(i){
			case 0: if(top.size() != 0){
							n = (int)(Math.random()*top.size());
							t = top.get(n);				
						}
						break;
			case 1:if(main.size() != 0){

						} 
						break;
			case 2: if(left.size() != 0){
							n = (int)(Math.random()*left.size());
							l = left.get(n);
						} 
						break;
			case 3: if(right.size() != 0){
							n = (int)(Math.random()*right.size());
							r = right.get(n);
						} 
						break;
			}
		}
		List<GoodsCategories> gc = gcService.getCategories();
		model.addAttribute("topBanner", t);
		model.addAttribute("leftBanner", l);
		model.addAttribute("rightBanner", r);
		model.addAttribute("mainBanner", main);
		model.addAttribute("goodsCategories",gc);
		model.addAttribute("category", mainService.getCategory());
		model.addAttribute("latelyGoods", mainService.getLatelyGoods());
		return "main";
	}
	
	@RequestMapping("/getLatelyGoods")
	@ResponseBody
	public List<Goods> getLatelyGoods(String godcNum){
		return mainService.getCategoryGoods(godcNum);
	}
	
	@RequestMapping("/accessTerms")
	public String accessTerms(){
		return "user/aboutUs/accessTerms";
	}
	
	@RequestMapping("/PersonalDataPolicy")
	public String PersonalDataPolicy(){
		return "user/aboutUs/PersonalDataPolicy";
	}
}
