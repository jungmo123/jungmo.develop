package jungmo.shoppingmall.user.login.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
	@RequestMapping("/")
	public String home(){
		return "main";
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
