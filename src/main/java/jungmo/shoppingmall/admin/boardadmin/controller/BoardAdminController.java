package jungmo.shoppingmall.admin.boardadmin.controller;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class BoardAdminController {
	@Autowired private GoodsCategoriesService godcService;
	
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
	
	@RequestMapping("admin/cic")
	public String cic(Model model){
		return "manager/boardadmin/cic";
	}
}
