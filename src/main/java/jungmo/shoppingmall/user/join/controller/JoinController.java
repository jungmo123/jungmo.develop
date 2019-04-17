package jungmo.shoppingmall.user.join.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jungmo.shoppingmall.user.join.domain.ClauseCategory;
import jungmo.shoppingmall.user.join.service.JoinService;
import jungmo.shoppingmall.user.login.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JoinController {
	@Autowired private JoinService joinService;
	
	@RequestMapping("/join01")
	public String join01(Model model){
		model.addAttribute("clauses",joinService.getClauses());
		return "user/join/join01";
	}
	
	@RequestMapping("/join02")
	public String join02(){
		return "user/join/join02";
	}
	
	@RequestMapping(value = "/overlap",method=RequestMethod.POST)
	@ResponseBody
	public Boolean overlap(String userId){
		Boolean bl = joinService.overlapInjection(userId);
		return bl;
	}
	
	@RequestMapping(value = "/join03",method=RequestMethod.POST)
	public String joinComplete(HttpServletRequest request,HttpSession session){
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
		joinService.addUser(user);
		
		for(int i = 0 ; i < list.size() ; i++){
			set = list.get(i).keySet();
			iterator = set.iterator();
			String key = (String)iterator.next();
			String value = list.get(i).get(key);
			joinService.addClsc(new ClauseCategory(Integer.parseInt(key),userId,value));
		}

		return "redirect:/";
	}
}
