package jungmo.shoppingmall.user.register.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.register.service.RegisterService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {
	@Autowired private RegisterService registerService;
	
	@RequestMapping("/register01")
	public String register01(Model model){
		model.addAttribute("clauses",registerService.getClauses());
		return "user/register/register01";
	}
	
	@RequestMapping("/register02")
	public String register02(){
		return "user/register/register02";
	}
	
	@RequestMapping(value = "/overlap",method=RequestMethod.POST)
	@ResponseBody
	public Boolean overlap(String userId){
		Boolean bl = registerService.overlapInjection(userId);
		return bl;
	}
	
	@RequestMapping("/address.do")
	public String address(){
		return "user/register/address";
	}
	
	@RequestMapping(value = "/register03",method=RequestMethod.POST)
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
			registerService.addUser(user);
			address = "redirect:main";
		}else{
			address = "redirect:user/register/register02";
		}
		return address;
	}
}
