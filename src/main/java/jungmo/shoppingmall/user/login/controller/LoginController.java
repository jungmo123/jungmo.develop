package jungmo.shoppingmall.user.login.controller;

import javax.servlet.http.HttpSession;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.login.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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
		return "main";
	}
	
	@RequestMapping("/adminlogin")
	public String adminlogin(HttpSession session){
		session.removeAttribute("user");
		return "manager/login/login";
	}
	
	@RequestMapping(value= "/adminloginCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean adminloginSubmit(String userId,String userPwd,HttpSession session){
		User user = new User(userId,userPwd);
		boolean bl = loginService.adminTest(user);
		if(bl == true){
			session.setAttribute("admin", userId);
		}
		return bl;
	}
	
	@RequestMapping("/adminMain")
	public String adminHome(){
		return "manager/main/adminMain";
	}
	
	@RequestMapping("/adminlogout")
	public String adminlogout(HttpSession session){
		session.removeAttribute("admin");
		return "main";
	}
}
