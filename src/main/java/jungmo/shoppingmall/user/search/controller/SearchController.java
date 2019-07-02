package jungmo.shoppingmall.user.search.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.user.search.service.*;
import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.user.styleshop.service.*;
import jungmo.shoppingmall.admin.order.domain.Goods;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SearchController {
	@Autowired private UPageService pageService;
	@Autowired private SearchService searchService;
	
	@RequestMapping(value="unifiedSearch={Search}",method=RequestMethod.GET)
	public String unifiedSearch(@PathVariable String Search,HttpServletRequest request,Model model){
		model.addAttribute("Search", Search);
		return "user/search/unifiedSearch";
	}
	
	public void god(String idx,String search,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setSearch(search);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getGodTotRowCnt(search));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("god", searchService.getGoods(myPage));
	}
	
	public void godr(String idx,String search,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setSearch(search);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getSGodrTotRowCnt(search));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("godr", searchService.getGoodsReviews(myPage));
	}
	
	public void post(String idx,String search,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setSearch(search);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getSPostsTotRowCnt(search));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("posts", searchService.getPosts(myPage));
	}
	
	@RequestMapping("/getSGoods")
	@ResponseBody
	public Map<String,Object> getGoods(String Search,String idx,HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		god(idx,Search,map);
		return map;
	}
	
	@RequestMapping("/getSGoodsReviews")
	@ResponseBody
	public Map<String,Object> getSGoodsReviews(String Search,String idx,HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		godr(idx,Search,map);
		return map;
	}
	
	@RequestMapping("/getSPosts")
	@ResponseBody
	public Map<String,Object> getSPosts(String Search,String idx,HttpServletRequest request){
		Map<String,Object> map = new HashMap<>();
		post(idx,Search,map);
		return map;
	}
}
