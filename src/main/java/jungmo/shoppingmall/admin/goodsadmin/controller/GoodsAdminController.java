package jungmo.shoppingmall.admin.goodsadmin.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class GoodsAdminController {
	@Autowired private GoodsCategoriesService godcService;
	
	@RequestMapping("/admin/goodsRegister")
	public String goodsadmin(HttpServletRequest request,Model model){
		model.addAttribute("categories", godcService.getCategories());
		return "manager/goodsadmin/goodsRegister";
	}
	
	@RequestMapping("/admin/addGoods")
	@ResponseBody
	public String addGoods(MultipartHttpServletRequest request){
		String sellingPrice = request.getParameter("sellingPrice");
		System.out.println(sellingPrice);
		return "";
	}
	
	@RequestMapping("/admin/addGoodsInfo")
	@ResponseBody
	public String addGoodsInfo(@RequestParam(value="list[]")List<String> list){
		System.out.println(list);
		return "";
	}
}
