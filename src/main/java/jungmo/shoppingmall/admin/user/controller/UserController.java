package jungmo.shoppingmall.admin.user.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.user.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
	@Autowired private UserService userService;
	@Autowired private PageService pageService;
	
	public void common(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getUsers(myPage));
	}
	
	@RequestMapping("/admin/userIdx")
	public String cic(){
		return "redirect:userIdx1";
	}
	
	@RequestMapping("/admin/userIdx{idx}")
	public String userIdx(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx);
		return "manager/user/userIndex";
	}
}
