package jungmo.shoppingmall.user.register.controller;
import javax.servlet.http.*;

import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.register.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

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
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String userEmail = email1 + "@" + email2;
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String userPhone = phone1+phone2+phone3;
		String userPostcode = request.getParameter("userPostcode");
		String userStreet = request.getParameter("userStreet");
		String userDetailArea = request.getParameter("userDetailArea");
		String mail = request.getParameter("userMailAgreement");
		String userMailAgreement;
		if(mail.equals("on")){
			userMailAgreement = "동의";
		}else{
			userMailAgreement = "거부";
		}
		System.out.println(userId + " " + userPwd + " " + userName + " " + userEmail + " " + userPhone + " " + userPostcode + 
				" " + userStreet + " " + userDetailArea + " " +userMailAgreement);
		
			User user = new User(userId,userName,userPwd,userEmail,userPhone,userPostcode,userStreet,userDetailArea);
			registerService.addUser(user);

		return "register02";
	}
}
