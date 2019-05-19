package jungmo.shoppingmall.admin.user.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.admin.user.service.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
	@Autowired private UserService userService;
	@Autowired private PageService pageService;
	private int index;
	private int leaveIndex;
	private String leaveType;
	private String leaveTitle;
	private String leaveSearchBar;
	private String type;
	private String title;
	private String SearchBar;
	private String sdate;
	private String edate;
	private String userLevel;
	private String minPrice;
	private String maxPrice;
	private String minSaved;
	private String maxSaved;
	private String mail;
	
	public void common(HttpServletRequest request,Model model,String idx,String userState){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setUserState(userState);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserTotRowCnt(userState));
		model.addAttribute("cnt",pageService.getUserTotRowCnt(userState));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getUsers(myPage));
		index = Integer.valueOf(idx);
		type = "";
	}
	
	public void leaveCommon(HttpServletRequest request,Model model,String idx,String userState){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setUserState(userState);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserTotRowCnt(userState));
		model.addAttribute("cnt",pageService.getUserTotRowCnt(userState));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getLeaveUsers(myPage));
		leaveIndex = Integer.valueOf(idx);
		leaveType = "";
	}
	
	public void search(HttpServletRequest request,Model model,String idx,boolean bl,String userState) throws ParseException{
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
		UserSearch us = new UserSearch(title,SearchBar,sdate,edate,userLevel,minPrice,maxPrice,minSaved,maxSaved,mail,userState);
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),title,SearchBar,sdate,edate,userLevel,minPrice,maxPrice,minSaved,maxSaved,mail);
		myPage.setUserState(userState);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getUserSearchTotRowCnt(us));
		model.addAttribute("cnt",pageService.getUserSearchTotRowCnt(us));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getSearchUsers(myPage));
		model.addAttribute("type","Search");
		index = Integer.valueOf(idx);
		type = "Search";
	}
	
	public void LeaveSearch(HttpServletRequest request,Model model,String idx,boolean bl) throws ParseException{
		if(bl == false){
			leaveTitle = request.getParameter("title");
			leaveSearchBar = request.getParameter("SearchBar");
		}
		UserSearch us = new UserSearch(leaveTitle,leaveSearchBar);
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setTitle(leaveTitle);
		myPage.setSearchBar(leaveSearchBar);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getLeaveUserSearchTotRowCnt(us));
		model.addAttribute("cnt",pageService.getLeaveUserSearchTotRowCnt(us));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",userService.getLeaveSearchUsers(myPage));
		model.addAttribute("type","Search");
		leaveIndex = Integer.valueOf(idx);
		leaveType = "Search";
	}
	
	@RequestMapping("/admin/userIdx")
	public String userIndex(){
		index = 1;
		return "redirect:userIdx1";
	}
	
	@RequestMapping("/admin/userIdx{idx}")
	public String userIdx(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,"가입");
		return "manager/user/userIndex";
	}
	
	@RequestMapping(value="/admin/userIdxSearch{idx}",method=RequestMethod.GET)
	public String userGSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,true,"가입");
		return "manager/user/userIndex";
	}
	
	@RequestMapping(value="/admin/userIdxSearch{idx}",method=RequestMethod.POST)
	public String userPSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,false,"가입");
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
		userService.addLeaveUser(map);
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping("/admin/userInfo{userId}")
	public String userInfo(@PathVariable String userId,Model model){
		model.addAttribute("user",userService.getUser(userId));
		model.addAttribute("clauses",userService.getClauses(userId));
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
	
	@RequestMapping("/admin/getPointLogs")
	@ResponseBody
	public List<PointLogs> getPointLogs(String userId){
		List<PointLogs> list = userService.getPointLogs(userId);
		return list;
	}
	
	@RequestMapping("/admin/checkPoint")
	public String checkPoint(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("checkPoint"));
		System.out.println(request.getParameter("reason"));
		System.out.println(request.getParameter("point"));
		List<String> userId = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(request.getParameter("checkPoint"),",");
		while(st.hasMoreTokens()){
			userId.add(st.nextToken());
		}
		PointLogs pl = new PointLogs(userId,request.getParameter("reason"),Integer.valueOf(request.getParameter("point")));
		userService.addPoint(pl);
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping("/admin/useridx")
	public String useridx(){
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping(value="/admin/modifyUserInfo",method=RequestMethod.POST)
	public String modifyUserInfo(HttpServletRequest request){
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
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
		String userLevel = request.getParameter("userLevel");
		System.out.println(userId + " " + userPwd + " " + userEmail + " " + userPhone + " " + userPostcode + " " + userStreet + " " + userDetailArea + " " + userLevel);
		User user = new User(userId,userPwd,userEmail,userPhone,userPostcode,userStreet,userDetailArea,Integer.valueOf(userLevel));
		userService.updateUserInfo(user);
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping(value="/admin/modifyUserState",method=RequestMethod.POST)
	public String modifyUserState(HttpServletRequest request){
		userService.updateUserState(request.getParameter("userId"));
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping(value="/admin/SearchPoint",method=RequestMethod.POST)
	public String SearchPoint(HttpServletRequest request,Model model){
		System.out.println(request.getParameter("reason"));
		System.out.println(request.getParameter("point"));
		Page myPage = null;
		if(type == ""){
			myPage = new Page();
			myPage.setType(type);
		}else{
			myPage = new Page(type,title,SearchBar,sdate,edate,userLevel,minPrice,maxPrice,minSaved,maxSaved,mail);
		}
		myPage.setPolgContent(request.getParameter("reason"));
		myPage.setPolgChange(Integer.parseInt(request.getParameter("point")));
		System.out.println(myPage.getTitle());
		userService.SearchAddPoint(myPage);
		return "redirect:userIdx" + type+ index;
	}
	
	@RequestMapping("/admin/leaveUserIdx")
	public String leaveUserIndex(){
		leaveIndex = 1;
		return "redirect:leaveUserIdx1";
	}	
	
	@RequestMapping("/admin/leaveUserIdx{idx}")
	public String leaveUserIdx(@PathVariable String idx,HttpServletRequest request,Model model){
		leaveCommon(request,model,idx,"탈퇴");
		return "manager/user/leaveUserIndex";
	}
	
	@RequestMapping(value="/admin/leaveUserIdxSearch{idx}",method=RequestMethod.GET)
	public String leaveUserGSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		LeaveSearch(request,model,idx,true);
		return "manager/user/leaveUserIndex";
	}
	
	@RequestMapping(value="/admin/leaveUserIdxSearch{idx}",method=RequestMethod.POST)
	public String leaveUserPSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		LeaveSearch(request,model,idx,false);
		return "manager/user/leaveUserIndex";
	}
	
	@RequestMapping(value="/admin/LeaveUserDelete",method=RequestMethod.POST)
	public String userDelete(HttpServletRequest request,Model model){
		HashMap<String,List<String>> map = new HashMap<>();
		List<String> list = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(request.getParameter("list"),",");
		while(st.hasMoreTokens()){
			list.add(st.nextToken()); 
		}
		map.put("list", list);
		userService.deleteUser(map);
		return "redirect:leaveUserIdx" + type+ index;
	}
	
	@RequestMapping("/admin/mail")
	public String Mail(){
		return "manager/user/mail";
	}

	@RequestMapping("/admin/getMailForm")
	@ResponseBody
	public MailForm getMailForm(String mailType){
		MailForm mf = userService.getMailForm(mailType);
		return mf;
	}
	
	@RequestMapping("/admin/modifyMailForm")
	@ResponseBody
	public String modifyMailForm(String mailType,String auto,String mailTitle,String mailContent){
		MailForm mailForm = new MailForm(mailType,auto,mailTitle,mailContent);
		userService.updateMailForm(mailForm);
		return "성공";
	}
}
