package jungmo.shoppingmall.user.join.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.admin.user.service.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.join.service.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class JoinController {
	@Autowired private JoinService joinService;
	@Autowired private UserService userService;
	
	@RequestMapping("/join01")
	public String join01(Model model){
		model.addAttribute("clauses",joinService.getClauses());
		return "user/join/join01";
	}
	
	@RequestMapping(value="/join02",method=RequestMethod.GET)
	public String joinG02(){
		return "redirect:join01";
	}
	
	@RequestMapping(value="/join02",method=RequestMethod.POST)
	public String joinP02(){
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
		MailForm mf = userService.getMailForm("회원 가입 완료 메일");
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
		String userPhone = phone1+"-"+phone2+"-"+phone3;
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
		joinService.addJoinPoint(userId);
		if(mf.getAutomaticallySend().equals("예")){
			String mailContent = mf.getMailContent().replace("{아이디}", userId);
			joinService.mailSend(userEmail, mf.getMailTitle(),mailContent);
		}
		return "redirect:/";
	}
}
