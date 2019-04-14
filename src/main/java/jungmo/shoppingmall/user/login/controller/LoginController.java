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
	
	@RequestMapping("/register01")
	public String register01(){
		return "user/register/register01";
	}
	
	@RequestMapping("/register02")
	public String register02(){
		return "user/register/register02";
	}
	
	@RequestMapping("/address.do")
	public String address(){
		return "user/register/address";
	}
	
	@RequestMapping(value = "/register02",method=RequestMethod.POST)
	public String registerComplete(HttpServletRequest request,HttpSession session){
		String address = "";
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		int userPhone = Integer.parseInt(request.getParameter("userPhone"));
		String userSi = request.getParameter("userSi");
		String userGu = request.getParameter("userGu");
		String userDong = request.getParameter("userDong");
		String userDetailArea = request.getParameter("userDetailArea");
		String userMailAgreement = request.getParameter("userMailAgreement");
		
		if(userId != null &&
			userPwd != null &&
			userName != null &&
			userEmail != null &&
			userPhone != 0 &&
			userSi != null &&
			userGu != null &&
			userDong != null &&
			userDetailArea != null &&
			userMailAgreement != null){
			User user = new User(userId,userName,userPwd,userEmail,userPhone,userSi,
					userGu,userDong,userDetailArea,userMailAgreement);
			loginService.addUser(user);
			address = "redirect:main";
		}else{
			address = "redirect:user/register/register02";
		}
		return address;
	}

	@RequestMapping("/login")
	public String login(){
		return "user/login/login";
	}
	
	@RequestMapping(value= "/login",method=RequestMethod.POST)
	public String loginSubmit(){
		return "main";
	}
}
