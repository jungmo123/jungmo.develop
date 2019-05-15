package jungmo.shoppingmall.admin.user.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.admin.user.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
	@Autowired private UserService userService;
	@Autowired private PageService pageService;
	private int index;
	private String type;
	private String title;
	private String SearchBar;
	private String sdate;
	private String edate;
	private String date3;
	private String userLevel;
	private String minPrice;
	private String maxPrice;
	private String minSaved;
	private String maxSaved;
	private String mail;
	
	public void common(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserTotRowCnt());
		model.addAttribute("cnt",pageService.getUserTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getUsers(myPage));
		index = Integer.valueOf(idx);
		type = "";
	}
	
	public void search(HttpServletRequest request,Model model,String idx,boolean bl) throws ParseException{
		if(bl == false){
			title = request.getParameter("title");
			SearchBar = request.getParameter("SearchBar");
			SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd");
			sdate = request.getParameter("sdate");
			edate = request.getParameter("edate");
			String date3;
			if(sdate != "" && edate != ""){
				Date date1 = dt.parse(sdate);
				Date date2 = dt.parse(edate);
				int compare = date1.compareTo(date2);
				if(compare > 0){
					date3 = sdate;
					sdate = edate;
					edate = date3;
				}			
			}
			userLevel =request.getParameter("userLevel");
			minPrice = request.getParameter("minPrice");
			maxPrice = request.getParameter("maxPrice");
			minSaved = request.getParameter("minSaved");
			maxSaved = request.getParameter("maxSaved");
			mail = request.getParameter("mail");
			if(mail == null){
				mail = "";
			}			
		}else{
			SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd");
			String date3;
			if(sdate != "" && edate != ""){
				Date date1 = dt.parse(sdate);
				Date date2 = dt.parse(edate);
				int compare = date1.compareTo(date2);
				if(compare > 0){
					date3 = sdate;
					sdate = edate;
					edate = date3;
				}			
			}			
		}
		UserSearch us = new UserSearch(title,SearchBar,sdate,edate,userLevel,minPrice,maxPrice,minSaved,maxSaved,mail);
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),title,SearchBar,sdate,edate,userLevel,minPrice,maxPrice,minSaved,maxSaved,mail);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserSearchTotRowCnt(us));
		model.addAttribute("cnt",pageService.getUserSearchTotRowCnt(us));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getSearchUsers(myPage));
		model.addAttribute("type","Search");
		index = Integer.valueOf(idx);
		type = "Search";
	}
	
	@RequestMapping("/admin/userIdx")
	public String cic(){
		index = 1;
		return "redirect:userIdx1";
	}
	
	@RequestMapping("/admin/userIdx{idx}")
	public String userIdx(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx);
		return "manager/user/userIndex";
	}
	
	@RequestMapping(value="/admin/userIdxSearch{idx}",method=RequestMethod.GET)
	public String userGSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,true);
		return "manager/user/userIndex";
	}
	
	@RequestMapping(value="/admin/userIdxSearch{idx}",method=RequestMethod.POST)
	public String userPSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,false);
		return "manager/user/userIndex";
	}
	
	@RequestMapping(value="/admin/userStateChange",method=RequestMethod.POST)
	public String userStateChange(HttpServletRequest request,Model model){
		HashMap<String,List<String>> map = new HashMap<>();
		List<String> list = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(request.getParameter("list"),",");
		while(st.hasMoreTokens()){
			list.add(st.nextToken()); 
		}
		map.put("list", list);
		userService.userStateChange(map);
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping("/admin/userInfo{userId}")
	public String userInfo(@PathVariable String userId,Model model){
		model.addAttribute("user",userService.getUser(userId));
		return "manager/user/userInfo";
	}
	
	@RequestMapping("/admin/getLoglog")
	@ResponseBody
	public List<Loglog> getLoglog(String userId){
		List<Loglog> list = userService.getLoglog(userId);
		return list;
	}
	
	@RequestMapping("/admin/getPurl")
	@ResponseBody
	public List<PurchaseList> getPurl(String userId){
		List<PurchaseList> list = userService.getPurl(userId);
		return list;
	}
}
