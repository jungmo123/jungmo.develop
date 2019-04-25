package jungmo.shoppingmall.admin.boardadmin.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class BoardAdminController {
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private PostsService posService;
	@Autowired private PageService pageService;
	
	public void common(HttpServletRequest request,Model model,String idx,String type,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		System.out.println(ps.getStartPage() + " " + ps.getEndPage());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("type",type);
	}
	
	@RequestMapping("/admin/styleshop")
	public String stringShop(Model model){
		model.addAttribute("categories",godcService.getCategories());
		return "manager/boardadmin/styleshop";
	}
	
	@RequestMapping("/admin/newCategory")
	@ResponseBody
	public boolean modifyCategory(String [] array,String content){
		String godcNum = "";
		if(array.length == 1){
			godcNum = array[0];
		}
		godcService.newCategory(content, godcNum);
		boolean data = true;
		return data;
	}
	
	@RequestMapping("admin/getCategoryContent")
	@ResponseBody
	public GoodsCategories getCategoryContent(String num){
		GoodsCategories data = godcService.getCategory(num);
		return data;
	}
	
	@RequestMapping("/admin/cic")
	public String cic(){
		return "redirect:cic0I1";
	}
	
	@RequestMapping("admin/cic{category}I{idx}")
	public String cic(@PathVariable String category,@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,category,1,Integer.parseInt(category));
		return "manager/boardadmin/cic";
	}
	
	@RequestMapping("/admin/cicWrite")
	public String cicWrite(){
		return "manager/boardadmin/cicWrite";
	}
}
