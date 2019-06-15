package jungmo.shoppingmall.user.review.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ReviewController {
	@Autowired private GoodsReviewService godrService;
	@Autowired private PageService pageService;
	@Autowired private GoodsCategoriesService godcService;
	private String godrSearch;
	private String godrType;
	
	public void godr(HttpServletRequest request,Model model,String idx,int godcNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodcNum(godcNum);
		PageService ps = new PageServiceImpl(5,myPage,pageService.selectGodrTotRowCnt(String.valueOf(godcNum)));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.selectGodr(myPage));
		model.addAttribute("category",godcService.getCategories());
		model.addAttribute("type","");
		model.addAttribute("godcNum",godcNum);
	}
	
	public void godrSearch(HttpServletRequest request,Model model,String idx,int godcNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,godcNum,godrSearch);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodrSearchTotRowCnt(godcNum,godrSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.getGodrSearch(myPage));
		model.addAttribute("type","Search");
		model.addAttribute("category",godcService.getCategories());
	}	
	
	@RequestMapping("/goodsReview{godcNum}I{idx}")
	public String goodsReview(@PathVariable String godcNum,@PathVariable String idx,HttpServletRequest request,Model model){
		godr(request,model,idx,Integer.parseInt(godcNum));
		return "user/review/GoodsReview";
	}
}
