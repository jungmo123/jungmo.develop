package jungmo.shoppingmall.admin.boardadmin.controller;

import jungmo.shoppingmall.admin.boardadmin.service.GoodsCategoriesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardAdminController {
	@Autowired private GoodsCategoriesService godcService;
	
	@RequestMapping("/admin/styleshop")
	public String stringShop(Model model){
		model.addAttribute("categories",godcService.getCategories());
		return "manager/boardadmin/styleshop";
	}
}
