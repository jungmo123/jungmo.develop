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
	private List<Integer> deleteArray;
	
	@RequestMapping("/admin/clause")
	public String clause(){
		deleteArray = new ArrayList<>();
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
		deleteArray.add(clsNum);
		for(int i = 0 ; i < deleteArray.size() ;i++){
			System.out.println(deleteArray.get(i));
		}
		return "";
	}
}
