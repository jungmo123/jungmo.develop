package jungmo.shoppingmall.user.register.controller;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.register.domain.*;
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
		List<Map<String,String>> list = (List<Map<String,String>>)session.getAttribute("names");
		Set set;
		Iterator iterator;		
		int clsNum;
		String clscAgreement;
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
		if(mail != null){
			userMailAgreement = "수신";
		}else{
			userMailAgreement = "거부";
		}
		
		User user = new User(userId,userName,userPwd,userEmail,userPhone,userPostcode,userStreet,userDetailArea,userMailAgreement);
		registerService.addUser(user);
		
		for(int i = 0 ; i < list.size() ; i++){
			set = list.get(i).keySet();
			iterator = set.iterator();
			String key = (String)iterator.next();
			String value = list.get(i).get(key);
			registerService.addClsc(new ClauseCategory(Integer.parseInt(key),userId,value));
		}

		return "redirect:/";
	}
}
