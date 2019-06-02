package jungmo.shoppingmall.user.login.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.login.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;


@Controller
public class LoginController {
	@Autowired private LoginService loginService;
	@Autowired private PageService pageService;
	@Autowired private PostsService posService;
	@Autowired private BoardCategoriesService boscService;
	private int index;
	private String type;
	
	public void common(HttpServletRequest request,Model model,int board,String idx,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("type",String.valueOf(poscNum));
		model.addAttribute("categories",boscService.getBC(board));
		index = Integer.valueOf(idx);
		type = "";
	}
	
	@RequestMapping("/")
	public String home(){
		return "main";
	}

	@RequestMapping("/login")
	public String login(){
		return "user/login/login";
	}
	
	@RequestMapping(value= "/loginCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean loginSubmit(String userId,String userPwd,HttpSession session){
		User user = new User(userId,userPwd);
		boolean bl = loginService.loginTest(user);
		if(bl == true){
			session.setAttribute("user", userId);
			loginService.addVisit(userId);
			loginService.updateLatestDate(userId);
		}
		return bl;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping("/admin/login")
	public String adminlogin(HttpSession session){
		session.removeAttribute("user");
		return "manager/login/login";
	}
	
	@RequestMapping(value= "/admin/loginCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean adminloginSubmit(String userId,String userPwd,HttpSession session){
		User user = new User(userId,userPwd);
		boolean bl = loginService.adminTest(user);
		if(bl == true){
			session.setAttribute("admin", userId);
			loginService.addVisit(userId);
			loginService.updateLatestDate(userId);
		}
		return bl;
	}
	
	@RequestMapping("/admin/main")
	public String adminHome(){
		return "manager/main/adminMain";
	}
	
	@RequestMapping("/admin/board")
	public String bo(){
		return "redirect:board1";
	}
	
	@RequestMapping("/admin/board{idx}")
	public String board(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,65,idx,1,65);
		return "manager/main/board";
	}
	
	@RequestMapping("/admin/logout")
	public String adminlogout(HttpSession session){
		session.removeAttribute("admin");
		return "redirect:/";
	}
	
	@RequestMapping("/aboutUs01")
	public String aboutUs01(){
		return "user/aboutUs/aboutUs01";
	}
	
	@RequestMapping("/aboutUs02")
	public String aboutUs02(){
		return "user/aboutUs/aboutUs02";
	}
}
