package jungmo.shoppingmall.admin.policy.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.join.service.*;
import net.sf.json.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.dao.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class PolicyController {
	@Autowired private JoinService joinService;
	@Autowired private ClauseService clsService;
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
		if(clsNum != 0){
			deleteArray.add(clsNum);
		}
		return "";
	}
	
	@RequestMapping("/admin/modifyClause")
	@ResponseBody
	public String modifyClause(HttpServletRequest request,@RequestBody String param) throws Exception{
		List<Map<String,String>> result = new ArrayList<>();
		List<Clause> insert = new ArrayList<>();
		List<Clause> update = new ArrayList<>();
		result = JSONArray.fromObject(param);
		for(int i = 0 ; i < result.size() ; i++){
			Map<String,String> list = result.get(i);
			Clause cls = new Clause(list.get("title"),list.get("content"),list.get("radio"));
			String clsNum =  list.get("clsNum");
			if(clsNum.equals("")){
				insert.add(cls);
			}else{
				cls.setClsNum(Integer.parseInt(clsNum));
				update.add(cls);
			}
		}
		if(deleteArray.size() != 0){
			HashMap<String,List<Integer>> map = new HashMap<>();
			map.put("delete", deleteArray);
			clsService.deleteClause(map);
		}
		for(int i = 0 ; i < insert.size() ; i++){
			clsService.insertClause(insert.get(i));
		}
		for(int i = 0 ; i < update.size() ; i++){
			clsService.updateClause(update.get(i));
		}
		return "";
	}
	
	// 정책
	
	@RequestMapping("/admin/policy")
	public String policy(HttpServletRequest request,Model model){
		model.addAttribute("delivery",clsService.getDeliveryPolicy());
		model.addAttribute("nda",clsService.getNoDeliveryArea());
		model.addAttribute("pp",clsService.getPointPolicy());
		model.addAttribute("cmp",clsService.getCommonPolicy());
		return "/manager/policy/policy";
	}
	
	@RequestMapping("/admin/getCp")
	@ResponseBody
	public CommonPolicy getCp(){
		return clsService.getCommonPolicy();
	}
	
	@RequestMapping("/admin/ModifyPolicy")
	@ResponseBody
	public String ModifyPolicy(MultipartHttpServletRequest request){
		try{
			clsService.modifyPolicy(request,clsService);
		}catch(DuplicateKeyException e){
			return "uk";
		}
		return "";
	}
}
