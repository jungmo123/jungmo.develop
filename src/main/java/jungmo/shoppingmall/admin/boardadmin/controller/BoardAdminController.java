package jungmo.shoppingmall.admin.boardadmin.controller;

import java.io.*;
import java.text.*;
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
import org.springframework.web.multipart.*;

@Controller
public class BoardAdminController {
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private BoardCategoriesService boscService;
	@Autowired private PostsService posService;
	@Autowired private PageService pageService;
	@Autowired private CommentService commentService;
	@Autowired private GoodsQuestionService godqService;
	@Autowired private OtoQuestionService otoService;
	@Autowired private GoodsReviewService godrService;
	@Autowired private EventService eventService;
	private int category;
	private int searchType;
	private String searchContent;
	private String godqType;
	private String godqSearch;
	private String otoqType;
	private String otoqSearch;
	private String otoIdx;
	private int godcNum;
	private String godrSearch;
	private String eventType;
	private String eventSearch;
	private String eventIdx;
	
	//공지사항
	
	public void common(HttpServletRequest request,Model model,int board,String idx,int borNum,int poscNum){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),borNum,poscNum);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getBoardTotRowCnt(borNum, poscNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",posService.getPosts(myPage));
		model.addAttribute("type",String.valueOf(poscNum));
		model.addAttribute("categories",boscService.getBC(board));
	}
	
	public void QAmodify(HttpServletRequest request){
		String Num = request.getParameter("godqNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godqContent") != ""){
			Content = request.getParameter("godqContent");
		}
		if(request.getParameter("godqType") != ""){
			Type = request.getParameter("godqType");
		}
		godqService.updateGoda(Integer.parseInt(Num),Content);		
	}
	
	public void godq(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodqTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("godq",godqService.getGodq(myPage));
	}

	public void godqSearch(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodqContent(godqSearch);
		myPage.setGodqType(godqType);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodqSearchTotRowCnt(godqType,godqSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("godq",godqService.getGodqSearch(myPage));
		model.addAttribute("type","Search");
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
	
	@RequestMapping("/admin/styleshop")
	public String stringShop(Model model){
		model.addAttribute("categories",godcService.getCategories());
		return "manager/boardadmin/styleshop";
	}
	
	@RequestMapping("/admin/newCategory")
	@ResponseBody
	public boolean modifyCategory(String [] array,String content){
		String godcNum = "";
		if(array.length == 1){
			godcNum = array[0];
		}
		godcService.newCategory(content, godcNum);
		boolean data = true;
		return data;
	}
	
	@RequestMapping("admin/getCategoryContent")
	@ResponseBody
	public GoodsCategories getCategoryContent(String num){
		GoodsCategories data = godcService.getCategory(num);
		return data;
	}
	
	@RequestMapping("/admin/cic")
	public String cic(){
		return "redirect:cic0I1";
	}
	
	@RequestMapping("admin/cic{category}I{idx}")
	public String cic(@PathVariable int category,@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,1,idx,1,category);
		return "manager/boardadmin/cic";
	}
	
	@RequestMapping("/admin/cicWrite")
	public String cicWrite(Model model){
		List<BoardCategories> board =  boscService.getBC(1);
		model.addAttribute("categories",board);
		return "manager/boardadmin/cicWrite";
	}
	
	@RequestMapping(value = "/admin/write",method=RequestMethod.POST)
	public String cicWrite(HttpServletRequest request,Model model){
		write(request,1);
		return "redirect:cic0I1";
	}
	
	@RequestMapping("/admin/cicRead{result}")
	public String cicRead(@PathVariable String result,Model model,HttpServletRequest request){
		read(model,result,1,request);
		return "manager/boardadmin/cicRead";
	}
	
	@RequestMapping("/admin/cicSearch{idx}")
	public String postcicSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("searchCategory") != null){
			category = Integer.parseInt(request.getParameter("searchCategory"));
			searchType = Integer.parseInt(request.getParameter("searchType"));
			searchContent = request.getParameter("searchContent");			
		}
		search(request,model,idx,1,category,searchType,searchContent);
		return	"manager/boardadmin/cic";
	}
	
	@RequestMapping("/admin/cicDelete{idx}")
	public String cicDelete(@PathVariable String idx){
		posService.deletePosts(Integer.valueOf(idx));
		return "redirect:cic0I1";
	}
	
	@RequestMapping("/admin/cicModify{idx}")
	public String cicModify(@PathVariable String idx,Model model){
		List<BoardCategories> board =  boscService.getBC(1);
		model.addAttribute("categories",board);
		model.addAttribute("idx",idx);
		model.addAttribute("pos",posService.getPos(Integer.valueOf(idx)));
		return "manager/boardadmin/cicWrite";
	}
	
	// 커뮤니티
	
	@RequestMapping("/admin/community")
	public String comu(){
		return "redirect:community0I1";
	}
	
	@RequestMapping("/admin/community{category}I{idx}")
	public String community(@PathVariable int category,@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,2,idx,2,category);
		return "manager/boardadmin/community";
	}
	
	@RequestMapping("/admin/communityWrite")
	public String communityWrite(Model model){
		List<BoardCategories> board =  boscService.getBC(2);
		model.addAttribute("categories",board);
		return "manager/boardadmin/communityWrite";
	}
	
	@RequestMapping("/admin/communityModify{idx}")
	public String communityModify(@PathVariable String idx,Model model){
		List<BoardCategories> board =  boscService.getBC(2);
		model.addAttribute("categories",board);
		model.addAttribute("idx",idx);
		model.addAttribute("pos",posService.getPos(Integer.valueOf(idx)));
		return "manager/boardadmin/communityWrite";
	}
	
	@RequestMapping(value = "/admin/Cwrite",method=RequestMethod.POST)
	public String CWrite(HttpServletRequest request,Model model){
		write(request,2);
		return "redirect:community0I1";
	}
	
	@RequestMapping("/admin/Cread{result}")
	public String CRead(@PathVariable String result,Model model,HttpServletRequest request){
		read(model,result,2,request);
		return "manager/boardadmin/communityRead";
	}
	
	@RequestMapping("/admin/getComment")
	@ResponseBody
	public List<Comment> getComment(String posNum){
		List<Comment> comments = commentService.getComments(Integer.parseInt(posNum));
		return comments;
	}
	
	@RequestMapping("/admin/communitySearch{idx}")
	public String Csearch(@PathVariable String idx,Model model,HttpServletRequest request){
		System.out.println(request.getParameter("searchCategory") + " " + request.getParameter("searchType") + " " + request.getParameter("searchContent"));
		if(request.getParameter("searchCategory") != null){
			category = Integer.parseInt(request.getParameter("searchCategory"));
			searchType = Integer.parseInt(request.getParameter("searchType"));
			searchContent = request.getParameter("searchContent");			
		}
		search(request,model,idx,2,category,searchType,searchContent);
		return	"manager/boardadmin/community";
	}
	
	@RequestMapping("/admin/comemntAdd")
	@ResponseBody
	public boolean comemntAdd(String posNum,String content,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("admin");
		commentService.addComment(Integer.parseInt(posNum),content,userId);
		boolean data = true;
		return data;
	}
	
	@RequestMapping("/admin/comemntModify")
	@ResponseBody
	public boolean cmtModify(String cmtNum,String cmtContent){
		commentService.updateComment(Integer.parseInt(cmtNum), cmtContent);
		boolean data = true;
		return data;
	}

	@RequestMapping("/admin/comemntDelete")
	@ResponseBody
	public boolean comemntDelete(String cmtNum){
		commentService.deleteComment(Integer.parseInt(cmtNum));
		boolean data = true;
		return data;
	}
	
	//상품Q&A
	
	@RequestMapping("/admin/goodsQuestion")
	public String godq(){
		return "redirect:goodsQuestion1";
	}
	
	@RequestMapping("/admin/goodsQuestion{idx}")
	public String goodsQuestion(@PathVariable String idx,Model model,HttpServletRequest request){
		godq(request,model,idx);
		return "manager/boardadmin/goodsQuestion";
	}
	
	@RequestMapping(value="/admin/goodsQuestionSearch{idx}",method=RequestMethod.POST)
	public String goodsQuestionPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("godqSearch") != null){
			godqSearch = request.getParameter("godqSearch");		
		}
		if(request.getParameter("godqType") != ""){
			godqType = request.getParameter("godqType");
		}
		godqSearch(request,model,idx);
		return "manager/boardadmin/goodsQuestion";
	}
	
	@RequestMapping(value="/admin/goodsQuestionSearch{idx}",method=RequestMethod.GET)
	public String goodsQuestionGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		godqSearch(request,model,idx);
		return "manager/boardadmin/goodsQuestion";
	}
	
	@RequestMapping("/admin/anserModify")
	public String anserModify(HttpServletRequest request){
		String Num = request.getParameter("godqNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godqContent") != ""){
			Content = request.getParameter("godqContent");
		}
		if(request.getParameter("godqType") != ""){
			Type = request.getParameter("godqType");
		}
		godqService.updateGoda(Integer.parseInt(Num),Content);
		return "redirect:goodsQuestion" + Type + idx;
	}
	
	@RequestMapping("/admin/questionModify")
	public String questionModify(HttpServletRequest request){
		String Num = request.getParameter("godqNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godqContent") != ""){
			Content = request.getParameter("godqContent");
		}
		if(request.getParameter("godqType") != ""){
			Type = request.getParameter("godqType");
		}
		godqService.updateGodq(Integer.parseInt(Num),Content);
		return "redirect:goodsQuestion" + Type + idx;
	}
	
	@RequestMapping("/admin/AnserDelete")
	public String AnserDelete(HttpServletRequest request){
		String godqNum = request.getParameter("godqNum");
		String godqType = request.getParameter("godqType");
		String idx = request.getParameter("idx");
		godqService.deleteGoda(Integer.parseInt(godqNum));
		return "redirect:goodsQuestion" + godqType + idx;
	}
	
	@RequestMapping("/admin/QuestionDelete")
	public String QuestionDelete(HttpServletRequest request){
		String godqNum = request.getParameter("godqNum");
		String godqType = request.getParameter("godqType");
		String idx = request.getParameter("idx");
		godqService.deleteGodq(Integer.parseInt(godqNum));
		return "redirect:goodsQuestion" + godqType + idx;
	}
	
	@RequestMapping("/admin/writeAnser")
	public String writeAnser(HttpServletRequest request){
		String Num = request.getParameter("godqNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		String userId = (String)request.getSession().getAttribute("admin");
		if(request.getParameter("godqContent") != ""){
			Content = request.getParameter("godqContent");
		}
		if(request.getParameter("godqType") != ""){
			Type = request.getParameter("godqType");
		}
		godqService.addGoda(Integer.parseInt(Num), Content, userId);
		return "redirect:goodsQuestion" + Type + idx;		
	}
	
	// 1대1 문의
	
	public void otoq(HttpServletRequest request,Model model,String idx){
		otoIdx= idx;
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),true);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getOtoqTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",otoService.getOtoq(myPage));
	}
	
	public void otoqSearch(HttpServletRequest request,Model model,String idx){
		otoIdx= idx;
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),true);
		myPage.setOtoqContent(otoqSearch);
		myPage.setOtoqType(otoqType);
		PageService ps = new PageServiceImpl(10,myPage,pageService.getOtoqSearchTotRowCnt(otoqType,otoqSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",otoService.getOtoqSearch(myPage));
		model.addAttribute("type","Search");
	}	
	
	@RequestMapping("/admin/oneTwoOne")
	public String otoQuestion(){
		return "redirect:oneTwoOne1";
	}
	@RequestMapping("/admin/oneTwoOne{idx}")
	public String oneTwoOne(@PathVariable String idx,Model model,HttpServletRequest request){
		otoq(request,model,idx);
		return "manager/boardadmin/oneTwoOne";
	}
	
	@RequestMapping("/admin/oneTwoOneRead{idx}")
	public String otoRead(@PathVariable String idx,Model model,HttpServletRequest request){
		model.addAttribute("oto",otoService.getOto(Integer.parseInt(idx)));
		return "manager/boardadmin/oneTwoOneRead";
	}
	
	@RequestMapping(value="/admin/oneTwoOneSearch{idx}",method=RequestMethod.POST)
	public String otoPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("otoqSearch") != null){
			otoqSearch = request.getParameter("otoqSearch");		
		}
		if(request.getParameter("otoqType") != ""){
			otoqType = request.getParameter("otoqType");
		}
		otoqSearch(request,model,idx);
		return "manager/boardadmin/oneTwoOne";
	}
	
	@RequestMapping(value="/admin/oneTwoOneSearch{idx}",method=RequestMethod.GET)
	public String otoGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		otoqSearch(request,model,idx);
		return "manager/boardadmin/oneTwoOne";
	}
	
	@RequestMapping(value="/admin/Qmodify",method=RequestMethod.POST)
	public String qmodify(Model model,HttpServletRequest request){
		String otoqNum = request.getParameter("otoqNum");
		String otoqContent = request.getParameter("WriteContent");
		otoService.updateOtoq(Integer.parseInt(otoqNum), otoqContent);
		return "redirect:oneTwoOneRead" + otoqNum;
	}
	
	@RequestMapping(value="/admin/Amodify",method=RequestMethod.POST)
	public String amodify(Model model,HttpServletRequest request){
		String otoqNum = request.getParameter("otoqNum");
		String otoaContent = request.getParameter("WriteContent");
		otoService.updateOtoq(Integer.parseInt(otoqNum), otoaContent);
		return "redirect:oneTwoOneRead" + otoqNum;
	}
	
	@RequestMapping(value="/admin/addAnser",method=RequestMethod.POST)
	public String addAnser(Model model,HttpServletRequest request){
		String otoqNum = request.getParameter("otoqNum");
		String otoaContent = request.getParameter("WriteContent");
		String userId = (String)request.getSession().getAttribute("admin");
		otoService.addOtoa(Integer.parseInt(otoqNum), otoaContent,userId);
		return "redirect:oneTwoOneRead" + otoqNum;
	}
	@RequestMapping("/admin/OtoIndex")
	public String otoIndex(){
		String type;
		if(otoqType != null){
			type = "Search";
		}else{
			type = "";
		}
		return "redirect:oneTwoOne" + type + otoIdx;
	}
	
	//리뷰
	
	public void godr(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodrTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.getGodr(myPage));
		model.addAttribute("category",godcService.getCategories());
	}
	
	public void godrSearch(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),5,godcNum,godrSearch);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGodrSearchTotRowCnt(godcNum,godrSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",godrService.getGodrSearch(myPage));
		model.addAttribute("type","Search");
		model.addAttribute("category",godcService.getCategories());
	}
	
	@RequestMapping("/admin/goodsReview")
	public String godr(){
		return "redirect:goodsReview1";
	}
	
	@RequestMapping("/admin/goodsReview{idx}")
	public String goodsReview(@PathVariable String idx,Model model,HttpServletRequest request){
		godr(request,model,idx);
		return "manager/boardadmin/GoodsReview";
	}

	@RequestMapping(value="/admin/goodsReviewSearch{idx}",method=RequestMethod.POST)
	public String goodsReviewPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("godrSearch") != null){
			godrSearch = request.getParameter("godrSearch");		
		}
		if(request.getParameter("godcNum") != ""){
			godcNum= Integer.valueOf(request.getParameter("godcNum"));
		}
		godrSearch(request,model,idx);
		return "manager/boardadmin/GoodsReview";
	}
	
	@RequestMapping(value="/admin/goodsReviewSearch{idx}",method=RequestMethod.GET)
	public String goodsReviewGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		godrSearch(request,model,idx);
		return "manager/boardadmin/GoodsReview";
	}
	
	@RequestMapping(value="/admin/godrModify",method=RequestMethod.POST)
	public String godrModify(Model model,HttpServletRequest request){
		String Num = request.getParameter("godrNum");
		String Content = "";
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godrContent") != ""){
			Content = request.getParameter("WriteContent");
		}
		if(request.getParameter("godrType") != ""){
			Type = request.getParameter("godrType");
		}
		godrService.updateGodr(Integer.parseInt(Num),Content);
		return "redirect:goodsReview" + Type + idx;
	}
	
	@RequestMapping("/admin/godrDelete")
	public String godrDelete(Model model,HttpServletRequest request){
		String Num = request.getParameter("godrNum");
		String Type = "";
		String idx = request.getParameter("idx");
		if(request.getParameter("godrType") != ""){
			Type = request.getParameter("godrType");
		}
		godrService.deleteGodr(Integer.parseInt(Num));
		return "redirect:goodsReview" + Type + idx;		
	}
	
	// 이벤트
	
	public void event(HttpServletRequest request,Model model,String idx){
		eventType = "";
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getEventTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",eventService.getEvent(myPage));
		eventIdx = idx;
	}

	public void eventSearch(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setEventContent(eventSearch);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getEventSearchTotRowCnt(eventSearch));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",eventService.getEventSearch(myPage));
		model.addAttribute("type","Search");
		eventIdx = idx;
		System.out.println(eventType);
	}	
	
	@RequestMapping("/admin/getEventContent")
	@ResponseBody
	public Event getEventContent(int eventNum){
		return eventService.getEventContent(eventNum);
	}
	
	@RequestMapping(value="/admin/eventSearch{idx}",method=RequestMethod.GET)
	public String eventGSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		eventSearch(request,model,idx);
		return "manager/boardadmin/event";
	}	
	
	@RequestMapping(value="/admin/eventSearch{idx}",method=RequestMethod.POST)
	public String eventPSearch(@PathVariable String idx,Model model,HttpServletRequest request){
		if(request.getParameter("eventSearch") != null){
			eventSearch = request.getParameter("eventSearch");		
		}
		if(request.getParameter("eventType") != ""){
			eventType = request.getParameter("eventType");
		}
		eventSearch(request,model,idx);
		return "manager/boardadmin/event";
	}
	
	@RequestMapping("/admin/event")
	public String ev(){
		return "redirect:event1";
	}
	
	@RequestMapping("/admin/event{idx}")
	public String event(@PathVariable String idx,Model model,HttpServletRequest request){
		event(request,model,idx);
		return "manager/boardadmin/event";
	}
	
	@RequestMapping("/admin/eventRead{idx}")
	public String eventRead(@PathVariable String idx,Model model,HttpServletRequest request){
		model.addAttribute("event",eventService.getEventRead(Integer.valueOf(idx)));
		return "manager/boardadmin/eventRead";
	}
	
	@RequestMapping("/admin/EIDX")
	public String eventIdx(){
		String type;
		if(eventType != ""){
			type = "Search";
		}else{
			type = "";
		}
		return "redirect:event" + type + eventIdx;
	}
	
	@RequestMapping(value="/admin/eventDelete",method=RequestMethod.POST)
	public String eventDelete(HttpServletRequest request){
		String str = request.getParameter("list");
		List<Integer> list = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(str,",");
		while(st.hasMoreTokens()){
			list.add(Integer.valueOf(st.nextToken()));
		}
		eventService.deleteEvent(list);
		return "redirect:EIDX";
	}
	
	@RequestMapping(value="/admin/eventDel",method=RequestMethod.POST)
	public String eventDel(HttpServletRequest request){
		int eventNum = Integer.valueOf(request.getParameter("eventNum"));
		eventService.delEvent(Integer.valueOf(eventNum));
		return "redirect:EIDX";
	}
	
	@RequestMapping(value="/admin/eventRegister",method=RequestMethod.GET)
	public String eventGR(Model model,HttpServletRequest request){
		return "manager/boardadmin/eventRegister";
	}
	
	@RequestMapping(value="/admin/eventRegister",method=RequestMethod.POST)
	public String eventPR(Model model,HttpServletRequest request){
		model.addAttribute("event",eventService.getEventRead(Integer.valueOf(request.getParameter("eventNum"))));
		return "manager/boardadmin/eventRegister";
	}
	
	@RequestMapping(value="/admin/addEvent",method=RequestMethod.POST)
	public String addEvent(Model model,HttpServletRequest request,MultipartFile file) throws ParseException{
		String dir = request.getServletContext().getRealPath("/upload");
		String id = (String)request.getSession().getAttribute("admin");
		String original = request.getParameter("original");
		String fullname;
		SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String date3;
		Date date1 = dt.parse(sdate);
		Date date2 = dt.parse(edate);
		int compare = date1.compareTo(date2);
		if(compare > 0){
			date3 = sdate;
			sdate = edate;
			edate = date3;
		}
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String content = request.getParameter("content");
		String view = request.getParameter("viewcount");
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String [] value = summary.split("\n");
		if(value.length != 1 && value.length != 0){
			summary = "";
			summary += value[0]+"<br>";
			summary += value[1];
		}
		if(original != null && !original.equals("")){
			int eventNum = Integer.valueOf(request.getParameter("eventNum"));
			if(!file.getOriginalFilename().equals("")){
				String fileName = file.getOriginalFilename();
				fullname = id+today+fileName;
				save(dir + "/" + id+today+fileName,file);
				eventService.modifyEvent(new Event(eventNum,title,summary,content,fullname,Integer.parseInt(view),sdate,edate));
			}else{
				eventService.modifyEvent(new Event(eventNum,title,summary,content,original,Integer.parseInt(view),sdate,edate));
			}
		}else{
			String fileName = file.getOriginalFilename();
			fullname = id+today+fileName;
			save(dir + "/" + id+today+fileName,file);
			eventService.addEvent(new Event(title,summary,content,fullname,Integer.parseInt(view),sdate,edate));
		} 			
		return "redirect:EIDX";
	}
	
	private void save(String fileFullName,MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	// boardCategory
	
	@RequestMapping("/admin/boardCategory")
	public String boardCategory(Model model){
		model.addAttribute("boards",boscService.getBoard());
		return "manager/boardadmin/boardCategory";
	}
	
	@RequestMapping("/admin/getBoard")
	@ResponseBody
	public List<BoardCategories> getBoard(int borNum){
		List<BoardCategories> bor = boscService.getBorc(borNum);
		return bor;
	}
	
	@RequestMapping("/admin/addBorc")
	@ResponseBody
	public List<BoardCategories> addBorc(int borNum,int borcNum,String poscName,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("admin");
		BoardCategories borc = new BoardCategories(borNum,borcNum,poscName,userId);
		BoardCategories boardCategory = boscService.getExistBorc(borNum, borcNum);
		if(boardCategory != null){
			System.out.println("true");
			boscService.updatePosc(borNum, borcNum);
			boscService.addBorc(borc);
		}else{
			System.out.println("false");
			boscService.addBorc(borc);
		}
		List<BoardCategories> bor = boscService.getBorc(borNum);
		return bor;
	}

	@RequestMapping("/admin/deleteBorc")
	@ResponseBody
	public List<BoardCategories> deleteBorc(@RequestParam(value="list[]")List<Integer> list,int borNum,HttpServletRequest request){
		HashMap<String,List<Integer>> map = new HashMap<>();
		map.put("list", list);
		List<Integer> bornum = new ArrayList<>();
		bornum.add(borNum);
		map.put("borNum", bornum);
		boscService.deleteBorc(map);
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		for(int i = list.size()-1 ; 0 <= i ; i--){
			System.out.println(borNum + " " + list.get(i));
			boscService.updateDeleteBorc(borNum,list.get(i));
		}
		List<BoardCategories> bor = boscService.getBorc(borNum);
		return bor;
	}
	
	@RequestMapping("/admin/modifyBorc")
	@ResponseBody
	public List<BoardCategories> modifyBorc(int borNum,int borcNum,int poscNum,String poscName,int currentBorcNum,HttpServletRequest request){
		BoardCategories borc = new BoardCategories(poscNum,borNum,borcNum,poscName);
		BoardCategories boardCategory = boscService.getExistBorc(borNum, borcNum);
		System.out.println(currentBorcNum);
		if(boardCategory != null && (boardCategory.getPoscNum() != poscNum && currentBorcNum > borcNum)){
			System.out.println("1");
			boscService.updatePosc(borNum, borcNum);
			boscService.updateBorc(borc);
		}else if(boardCategory != null && (boardCategory.getPoscNum() != poscNum && currentBorcNum < borcNum)){
			System.out.println("2");
			boscService.downPosc(borNum, borcNum,currentBorcNum);
			boscService.updateBorc(borc);			
		}else{
			boscService.updateBorc(borc);
		}
		System.out.println("수정");
		List<BoardCategories> bor = boscService.getBorc(borNum);
		return bor;
	}
}
