package jungmo.shoppingmall.user.login.controller;

import javax.servlet.http.*;

import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.login.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;


@Controller
public class LoginController {
	@Autowired private LoginService loginService;
	
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
		}
		return bl;
	}
	
	@RequestMapping("/admin/main")
	public String adminHome(){
		return "manager/main/adminMain";
	}
	
	@RequestMapping("/admin/logout")
	public String adminlogout(HttpSession session){
		session.removeAttribute("admin");
		return "redirect:/";
	}
}
