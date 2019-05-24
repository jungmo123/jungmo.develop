package jungmo.shoppingmall.admin.goodsadmin.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class GoodsAdminController {
	@Autowired private GoodsCategoriesService godcService;
	
	@RequestMapping("/admin/goodsRegister")
	public String goodsadmin(HttpServletRequest request,Model model){
		model.addAttribute("categories", godcService.getCategories());
		return "manager/goodsadmin/goodsRegister";
	}
}
