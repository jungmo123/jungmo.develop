package jungmo.shoppingmall.admin.boardadmin.controller;

import java.util.*;

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
	@Autowired private BoardCategoriesService boscService;
	@Autowired private PostsService posService;
	@Autowired private PageService pageService;
	
	public void common(HttpServletRequest request,Model model,String idx,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("type",poscNum);
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
	public String cic(@PathVariable int category,@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,1,category);
		return "manager/boardadmin/cic";
	}
	
	@RequestMapping("/admin/cicWrite")
	public String cicWrite(Model model){
		List<BoardCategories> board =  boscService.getBC(1);
		model.addAttribute("categories",board);
		return "manager/boardadmin/cicWrite";
	}
	
	@RequestMapping(value = "/admin/write",method=RequestMethod.POST)
	public String cicWrite(HttpServletRequest request,Model model){
		String importance = request.getParameter("importance");
		String categorySelect = request.getParameter("categorySelect");
		String content = request.getParameter("writeContent");
		String title = request.getParameter("title");
		String userId = (String)request.getSession().getAttribute("admin");
		if(importance != null){
			importance = "Y";
		}else{
			importance = "N";
		}
		System.out.println(importance + " " + categorySelect + " " + content + " " + title + userId);
		Posts pos = new Posts(1,Integer.parseInt(categorySelect),importance,title,content,userId);
		posService.addNotice(pos);
		return "manager/boardadmin/cicWrite";
	}
	
	@RequestMapping("/admin/cicRead{result}")
	public String cicRead(@PathVariable String result,Model model){
		String [] str = result.split("I");
		int category = Integer.parseInt(str[0]);
		int poscNum = Integer.parseInt(str[1]);
		int posNum = Integer.parseInt(str[2]);
		model.addAttribute("post",posService.getPost(posNum,1,poscNum,category));
		model.addAttribute("category",category);
		return "manager/boardadmin/cicRead";
	}
}
