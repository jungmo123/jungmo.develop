package jungmo.shoppingmall.user.review.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.user.review.domain.*;
import jungmo.shoppingmall.user.review.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class ReviewController {
	@Autowired private GoodsReviewService godrService;
	@Autowired private PageService pageService;
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private ReviewService rvService;
	private String godrSearch;
	private String godcNum;
	private String godrType;
	private String Type;
	
	public void godr(HttpServletRequest request,Model model,String idx,int godcNum,String userId){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodcNum(godcNum);
		PageService ps = new PageServiceImpl(5,myPage,pageService.selectGodrTotRowCnt(String.valueOf(godcNum)));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.selectGodr(myPage));
		model.addAttribute("category",godcService.getCategories());
		model.addAttribute("type","");
		model.addAttribute("godcNum",godcNum);
		model.addAttribute("rvList", rvService.getRg(userId));
		model.addAttribute("userId", userId);
		Type = "";
	}
	
	public void godrSearch(HttpServletRequest request,Model model,String idx,int godcNum,String userId){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,godcNum,godrSearch);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodrSearchTotRowCnt(godcNum,godrSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.getGodrSearch(myPage));
		model.addAttribute("type","Search");
		model.addAttribute("category",godcService.getCategories());
		model.addAttribute("rvList", rvService.getRg(userId));
		model.addAttribute("userId", userId);
		Type = "Search";
	}	
	
	@RequestMapping("/goodsReview{godcNum}I{idx}")
	public String goodsReview(@PathVariable String godcNum,@PathVariable String idx,HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("user");
		godrType = godcNum;
		if(userId != null){
			
		}else{
			userId = "";
		}
		godr(request,model,idx,Integer.parseInt(godcNum),userId);
		return "user/review/GoodsReview";
	}
	
	@RequestMapping(value="/godrModify",method=RequestMethod.POST)
	public String godrModify(Model model,HttpServletRequest request){
		String Num = request.getParameter("godrNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godrContent") != ""){
			Content = request.getParameter("WriteContent");
		}
		if(request.getParameter("godrType") != ""){
			Type = request.getParameter("godrType");
		}
		godrService.updateGodr(Integer.parseInt(Num),Content);
		String address = "";
		if(Type.equals("")){
			address =   "redirect:goodsReview"+ Type + godrType +"I" + idx;
		}else{
			address = "redirect:goodsReview" + Type + idx;
		}
		return address;	
	}
	
	@RequestMapping("/godrDelete")
	public String godrDelete(Model model,HttpServletRequest request){
		String Num = request.getParameter("godrNum");
		String idx = request.getParameter("idx");
		godrService.deleteGodr(Integer.parseInt(Num));
		String address = "";
		if(Type.equals("")){
			address =   "redirect:goodsReview"+ Type + godrType +"I" + idx;
		}else{
			address = "redirect:goodsReview" + Type + 1;
		}
		return address;	
	}
	
	@RequestMapping("/addRv")
	@ResponseBody
	public String addRv(String select,String grade,String content,String godcNum,String userId){
		rvService.addReview(new ReviewGoods(select,userId,grade,content));
		String address = "";
		if(Type.equals("")){
			address =   "/shoppingmall/goodsReview" + godcNum + "I" + 1;
		}else{
			address = "/shoppingmall/goodsReview" + Type + 1;
		}
		return address;
	}
	
	@RequestMapping(value="/goodsReviewSearch{idx}",method=RequestMethod.GET)
	public String goodsReviewGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		if(userId != null){
			
		}else{
			userId = "";
		}		
		godrSearch(request,model,idx,Integer.valueOf(godcNum),userId);
		return "user/review/GoodsReview";
	}
	
	@RequestMapping(value="/goodsReviewSearch{idx}",method=RequestMethod.POST)
	public String goodsReviewPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		if(userId != null){
			
		}else{
			userId = "";
		}
		if(request.getParameter("godName") != null){
			godrSearch = request.getParameter("godName");
		}else{
			godrSearch = "";
		}
		godcNum = request.getParameter("godcNum");
		godrSearch(request,model,idx,Integer.valueOf(godcNum),userId);
		return "user/review/GoodsReview";
	}
}
