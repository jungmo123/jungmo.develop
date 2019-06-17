package jungmo.shoppingmall.user.customerSupport.controller;

import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class CustomerSupportController {
	@Autowired private BoardCategoriesService boscService;
	@Autowired private PostsService posService;
	@Autowired private PageService pageService;
	@Autowired private CommentService commentService;
	private String noticeType;
	private String communityType;
	private int noticeCategory;
	private int noticeSearchType;
	private String noticeSearchContent;
	private int communityCategory;
	private int communitySearchType;
	private String communitySearchContent;
	
	public void common(HttpServletRequest request,Model model,String idx,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("type",String.valueOf(poscNum));
		model.addAttribute("categories",boscService.getBC(borNum));
		String userId = (String)request.getSession().getAttribute("user");
		model.addAttribute("user", userId);
	}
	
	public void search(HttpServletRequest request,Model model,String idx,int borNum,int poscNum,int searchType,String searchContent){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum,searchType,searchContent);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardSearchTotRowCnt(borNum, poscNum, searchType, searchContent));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getSearchPost(myPage));
		model.addAttribute("type","Search");
		model.addAttribute("categories",boscService.getBC(borNum));
	}
	
	public void read(Model model,String result,int borNum,HttpServletRequest request){
		String [] str = result.split("I");
		String userId = (String)request.getSession().getAttribute("user");
		int category = Integer.parseInt(str[0]);
		int poscNum = Integer.parseInt(str[1]);
		int posNum = Integer.parseInt(str[2]);
		int searchType;
		if(category == 0){
			searchType = -1;
		}else{
			searchType = category;
		}
		Posts post = posService.getPost(posNum,borNum,poscNum,category,searchType,noticeSearchContent);
		if(!post.getUserId().equals(userId)){
			posService.plusViewCnt(posNum);
		}
		model.addAttribute("post",post);
		model.addAttribute("category",category);
		model.addAttribute("comments",commentService.getComments(posNum));
		model.addAttribute("user", userId);
	}
	
	public void write(HttpServletRequest request,int borNum){
		String importance = request.getParameter("importance");
		String categorySelect = request.getParameter("categorySelect");
		String content = request.getParameter("writeContent");
		String title = request.getParameter("title");
		String userId = (String)request.getSession().getAttribute("user");
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
	
	// 공지사항
	
	@RequestMapping("/notice")
	public String cic(){
		return "redirect:notice1";
	}
	
	@RequestMapping("/notice{idx}")
	public String notice(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,1,0);
		noticeType = "";
		return "user/help/notice";
	}
	
	@RequestMapping("/noticeSearch{idx}")
	public String noticeSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("searchCategory") != null){
			noticeCategory = Integer.parseInt(request.getParameter("searchCategory"));
			noticeSearchType = Integer.parseInt(request.getParameter("searchType"));
			noticeSearchContent = request.getParameter("searchContent");			
		}
		search(request,model,idx,1,noticeCategory,noticeSearchType,noticeSearchContent);
		noticeType = "Search";
		return	"user/help/notice";
	}
	
	@RequestMapping("/noticeRead{result}")
	public String noticeRead(@PathVariable String result,Model model,HttpServletRequest request){
		read(model,result,1,request);
		return "user/help/noticeRead";
	}
	
	// 커뮤니티
	
	@RequestMapping("/community")
	public String comu(){
		return "redirect:community1";
	}
	
	@RequestMapping("/community{idx}")
	public String community(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx,2,0);
		communityType = "";
		return "user/help/community";
	}
	
	@RequestMapping("/communitySearch{idx}")
	public String communitySearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("searchCategory") != null){
			communityCategory = Integer.parseInt(request.getParameter("searchCategory"));
			communitySearchType = Integer.parseInt(request.getParameter("searchType"));
			communitySearchContent = request.getParameter("searchContent");			
		}
		search(request,model,idx,2,communityCategory,communitySearchType,communitySearchContent);
		communityType = "Search";
		return	"user/help/community";
	}
	
	@RequestMapping("/communityRead{result}")
	public String communityRead(@PathVariable String result,Model model,HttpServletRequest request){
		read(model,result,2,request); 
		return "user/help/communityRead";
	}
	
	@RequestMapping("/communityWrite")
	public String communityWrite(Model model){
		List<BoardCategories> board =  boscService.getBC(2);
		model.addAttribute("categories",board);
		return "user/help/communityWrite";
	}
	
	@RequestMapping(value = "/Cwrite",method=RequestMethod.POST)
	public String CWrite(HttpServletRequest request,Model model){
		write(request,2);
		return "redirect:community1";
	}
	
	@RequestMapping("/getComment")
	@ResponseBody
	public List<Comment> getComment(String posNum){
		List<Comment> comments = commentService.getComments(Integer.parseInt(posNum));
		return comments;
	}
	
	@RequestMapping("/comemntAdd")
	@ResponseBody
	public boolean comemntAdd(String posNum,String content,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		commentService.addComment(Integer.parseInt(posNum),content,userId);
		boolean data = true;
		return data;
	}
	
	@RequestMapping("/comemntModify")
	@ResponseBody
	public boolean comemntModify(String cmtNum,String cmtContent){
		commentService.updateComment(Integer.parseInt(cmtNum), cmtContent);
		boolean data = true;
		return data;
	}

	@RequestMapping("/comemntDelete")
	@ResponseBody
	public boolean comemntDelete(String cmtNum){
		commentService.deleteComment(Integer.parseInt(cmtNum));
		boolean data = true;
		return data;
	}
}
