package jungmo.shoppingmall.user.login.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.login.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;


@Controller
public class LoginController {
	@Autowired private LoginService loginService;
	@Autowired private PageService pageService;
	@Autowired private PostsService posService;
	@Autowired private BoardCategoriesService boscService;
	@Autowired private CommentService commentService;
	private int category;
	private int searchType;
	private String searchContent = "";
	
	public void common(HttpServletRequest request,Model model,int board,String idx,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("categories",boscService.getBC(board));
	}
	
	public void search(HttpServletRequest request,Model model,String idx,int borNum,int poscNum,int searchType,String searchContent){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum,searchType,searchContent);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardSearchTotRowCnt(borNum, poscNum, searchType, searchContent));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getSearchPost(myPage));
		model.addAttribute("type","Search");
	}
	
	public void read(Model model,String result,int borNum,HttpServletRequest request){
		String [] str = result.split("I");
		String userId = (String)request.getSession().getAttribute("admin");
		int category = Integer.parseInt(str[0]);
		int poscNum = Integer.parseInt(str[1]);
		int posNum = Integer.parseInt(str[2]);
		int searchType;
		if(category == 0){
			searchType = -1;
		}else{
			searchType = category;
		}
		Posts post = posService.getPost(posNum,borNum,poscNum,category,searchType,searchContent);
		if(!post.getUserId().equals(userId)){
			posService.plusViewCnt(posNum);
		}
		model.addAttribute("post",post);
		model.addAttribute("category",category);
		model.addAttribute("comments",commentService.getComments(posNum));
	}
	
	public void write(HttpServletRequest request,int borNum){
		String importance = request.getParameter("importance");
		String categorySelect = request.getParameter("categorySelect");
		String content = request.getParameter("writeContent");
		String title = request.getParameter("title");
		String userId = (String)request.getSession().getAttribute("admin");
		String posNum = request.getParameter("posNum");
		if(importance != null){
			importance = "Y";
		}else{
			importance = "N";
		}
		if(posNum != null){
			posService.updatePosts(Integer.parseInt(posNum), importance, title, content);
		}else{
			Posts pos = new Posts(borNum,Integer.parseInt(categorySelect),importance,title,content,userId);
			posService.addNotice(pos);
		}
	}
	
	@RequestMapping("/")
	public String home(HttpServletRequest request,Model model){
		List<Banner> top = new ArrayList<>();
		List<Banner> main = new ArrayList<>();
		List<Banner> left = new ArrayList<>();
		List<Banner> right = new ArrayList<>();
		Banner t = null;
		Banner m= null;
		Banner l= null;
		Banner r = null;
		List<Banner> banners = loginService.getBanner();
		for(int i = 0 ; i < banners.size() ; i++){
			Banner b = banners.get(i);
			if(b.getBnnLocation().equals("top")){
				top.add(b);
			}else if(b.getBnnLocation().equals("main")){
				main.add(b);
			}else if(b.getBnnLocation().equals("left")){
				left.add(b);
			}else if(b.getBnnLocation().equals("right")){
				right.add(b);
			}
		}
		int n;
		for(int i = 0 ; i < 4 ; i++){
			switch(i){
			case 0: if(top.size() != 0){
							n = (int)(Math.random()*top.size());
							t = top.get(n);				
						}
						break;
			case 1:if(main.size() != 0){
							n = (int)(Math.random()*main.size());
							m = main.get(n);		
						} 
						break;
			case 2: if(left.size() != 0){
							n = (int)(Math.random()*left.size());
							l = left.get(n);
						} 
						break;
			case 3: if(right.size() != 0){
							n = (int)(Math.random()*right.size());
							r = right.get(n);
						} 
						break;
			}
		}
		model.addAttribute("topBanner", t);
		return "main";
	}

	@RequestMapping("/login")
	public String login(){
		return "user/login/login";
	}
	
	@RequestMapping(value= "/loginCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean loginSubmit(String userId,String userPwd,HttpSession session){
		User user = new User(userId,userPwd);
		boolean bl = loginService.loginTest(user);
		if(bl == true){
			session.setAttribute("user", userId);
			loginService.addVisit(userId);
			loginService.updateLatestDate(userId);
		}
		return bl;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping("/admin/login")
	public String adminlogin(HttpSession session){
		session.removeAttribute("user");
		return "manager/login/login";
	}
	
	@RequestMapping(value= "/admin/loginCheck",method=RequestMethod.POST)
	@ResponseBody
	public boolean adminloginSubmit(String userId,String userPwd,HttpSession session){
		User user = new User(userId,userPwd);
		boolean bl = loginService.adminTest(user);
		if(bl == true){
			session.setAttribute("admin", userId);
			loginService.addVisit(userId);
			loginService.updateLatestDate(userId);
		}
		return bl;
	}
	
	@RequestMapping("/admin/main")
	public String adminHome(HttpServletRequest request,Model model){
		String userId = (String)request.getSession().getAttribute("admin");
		model.addAttribute("admin",userId);
		model.addAttribute("joinCnt",loginService.getTodayJoin());
		model.addAttribute("secedeCnt",loginService.getTodaySecede());
		model.addAttribute("goodsCnt",loginService.getTodayGoods());
		model.addAttribute("ordersCnt",loginService.getTodayOrders());
		model.addAttribute("reCnt",loginService.getRE());
		model.addAttribute("otoCnt",loginService.getOto());
		model.addAttribute("qnaCnt",loginService.getGodQnA());
		model.addAttribute("boards",loginService.selectBoard());
		model.addAttribute("exp",loginService.getDday());
		return "manager/main/adminMain";
	}
	
	@RequestMapping("/admin/board")
	public String bo(){
		return "redirect:board1";
	}
	
	@RequestMapping("/admin/board{idx}")
	public String board(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,3,idx,3,65);
		return "manager/main/board";
	}
	
	@RequestMapping("/admin/boardSearch{idx}")
	public String postcicSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		System.out.println(request.getParameter("searchCategory") + " " + request.getParameter("searchType") + " " + request.getParameter("searchContent"));
		category = 65;
		searchType = Integer.parseInt(request.getParameter("searchType"));
		searchContent = request.getParameter("searchContent");
		search(request,model,idx,3,category,searchType,searchContent);
		return	"manager/main/board";
	}
	
	@RequestMapping("/admin/boardWrite")
	public String boardWrite(Model model){
		List<BoardCategories> board =  boscService.getBC(3);
		model.addAttribute("categories",board);
		return "manager/main/boardWrite";
	}
	
	@RequestMapping(value = "/admin/Bwrite",method=RequestMethod.POST)
	public String boardWrite(HttpServletRequest request,Model model){
		write(request,3);
		return "redirect:board1";
	}
	
	@RequestMapping("/admin/boardRead{result}")
	public String boardRead(@PathVariable String result,Model model,HttpServletRequest request){
		read(model,result,3,request);
		return "manager/main/boardRead";
	}
	
	@RequestMapping("/admin/boardModify{idx}")
	public String cicModify(@PathVariable String idx,Model model){
		List<BoardCategories> board =  boscService.getBC(3);
		model.addAttribute("categories",board);
		model.addAttribute("idx",idx);
		model.addAttribute("pos",posService.getPos(Integer.valueOf(idx)));
		return "manager/main/boardWrite";
	}
	
	@RequestMapping(value = "/admin/hostModify",method=RequestMethod.POST)
	public String hostModify(HttpServletRequest request){
		String date = request.getParameter("expiration");
		loginService.updateExpiration(1, date);
		return "redirect:main";
	}
	
	@RequestMapping(value = "/admin/domainModify",method=RequestMethod.POST)
	public String domainModify(HttpServletRequest request){
		String date = request.getParameter("expiration");
		loginService.updateExpiration(2, date);
		return "redirect:main";
	}
	
	@RequestMapping("/admin/logout")
	public String adminlogout(HttpSession session){
		session.removeAttribute("admin");
		return "redirect:/";
	}
	
	@RequestMapping("/aboutUs01")
	public String aboutUs01(){
		return "user/aboutUs/aboutUs01";
	}
	
	@RequestMapping("/aboutUs02")
	public String aboutUs02(){
		return "user/aboutUs/aboutUs02";
	}
}
