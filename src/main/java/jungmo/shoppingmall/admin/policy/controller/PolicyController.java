package jungmo.shoppingmall.admin.policy.controller;

import java.util.*;

import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.join.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class PolicyController {
	@Autowired private JoinService joinService;
	
	@RequestMapping("/admin/clause")
	public String clause(){
		return "manager/policy/clause";
	}
	
	@RequestMapping("/admin/getClause")
	@ResponseBody
	public List<Clause> getClause(){
		return joinService.getClauses();
	}
	
	@RequestMapping("/admin/deleteClause")
	@ResponseBody
	public String deleteClause(int clsNum){
		System.out.println(clsNum);
		return "";
	}
}
