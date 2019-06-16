package jungmo.shoppingmall.user.customerSupport.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerSupportController {
	@RequestMapping("/notice")
	public String notice(){
		return "user/help/notice";
	}
}
