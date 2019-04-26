package jungmo.shoppingmall.admin.boardadmin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;
import jungmo.shoppingmall.admin.boardadmin.domain.GoodsCategories;
import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.boardadmin.service.BoardCategoriesService;
import jungmo.shoppingmall.admin.boardadmin.service.GoodsCategoriesService;
import jungmo.shoppingmall.admin.boardadmin.service.PostsService;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.service.PageService;
import jungmo.shoppingmall.admin.order.service.PageServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardAdminController {
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private BoardCategoriesService boscService;
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
}
