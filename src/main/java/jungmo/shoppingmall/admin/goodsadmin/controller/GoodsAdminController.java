package jungmo.shoppingmall.admin.goodsadmin.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.goodsadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.apache.commons.lang3.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;

@Controller
public class GoodsAdminController {
	@Autowired private OrderService orderService;
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private GoodsAdminService gaService;
	@Autowired private PageService pageService;
	private GoodsSearch gs = null;
	private int index;
	private String type;
	private String title;
	private String SearchBar;
	private String sdate;
	private String edate;
	private String category;
	private String minPrice;
	private String maxPrice;
	private String displayType;
	private String ListImageUrl = "";
	private String MainImageUrl = "";
	private String repreImageUrl1 = "";
	private String repreImageUrl2 = "";
	private String repreImageUrl3 = "";
	private String repreImageUrl4 = "";
	private List<String> images;
	
	// 상품등록
	
	@RequestMapping("/admin/goodsRegister")
	public String goodsadmin(HttpServletRequest request,Model model){
		images = new ArrayList<>();
		model.addAttribute("categories", godcService.getCategories());
		return "manager/goodsadmin/goodsRegister";
	}
	
	@RequestMapping("/admin/addGoods")
	@ResponseBody
	public String addGoods(MultipartHttpServletRequest request){
		try{
			String result = gaService.addGoods(request, gaService);
			if(result.equals("nameoverlap")){
				return "nameoverlap";
			}
			return "success";
		}catch(Exception e){
			String str = e.getMessage();
			if(str.contains("ITR_PK")){
				return "itr";
			}else if(str.contains("GODO_PK")){
				return "godo";
			}
			return "error";
		}
	}
	@RequestMapping("/admin/addGoodsInfo")
	@ResponseBody
	public String addGoodsInfo(@RequestParam(value="list[]")List<String> list){
		System.out.println(list);
		return "";
	}
	
	//상품목록
	
	public void common(HttpServletRequest request,Model model,String idx){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGoodsTotRowCnt());
		model.addAttribute("cnt",pageService.getGoodsTotRowCnt());
		model.addAttribute("SearchCnt",pageService.getGoodsTotRowCnt());
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",gaService.getGoods(myPage));
		model.addAttribute("categories", godcService.getCategories());
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
			category =request.getParameter("category");
			minPrice = request.getParameter("minPrice");
			maxPrice = request.getParameter("maxPrice");
			displayType = request.getParameter("displayType");
			if(displayType == null){
				displayType = "";
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
		gs = new GoodsSearch(SearchBar,title,sdate,edate,minPrice,maxPrice,category,displayType);
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),SearchBar,title,sdate,edate,minPrice,maxPrice,category,displayType);
		PageService ps = new PageServiceImpl(5,myPage,pageService.getGoodsSearchTotRowCnt(gs));
		model.addAttribute("cnt",pageService.getGoodsTotRowCnt());
		model.addAttribute("SearchCnt",pageService.getGoodsSearchTotRowCnt(gs));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("posts",gaService.getGoodsSearch(myPage));
		model.addAttribute("categories", godcService.getCategories());
		model.addAttribute("type","Search");
		index = Integer.valueOf(idx);
		type = "Search";
	}
	
	@RequestMapping("/admin/goodsList")
	public String orderList(){
		index = 1;
		return "redirect:goodsList1";
	}
	
	@RequestMapping("/admin/goodsList{idx}")
	public String goodsList(@PathVariable String idx,HttpServletRequest request,Model model){
		common(request,model,idx);
		return "manager/goodsadmin/goodsList";
	}
	
	@RequestMapping(value="/admin/goodsListSearch{idx}",method=RequestMethod.GET)
	public String godGSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,true);
		return "manager/goodsadmin/goodsList";
	}
	
	@RequestMapping(value="/admin/goodsListSearch{idx}",method=RequestMethod.POST)
	public String godPSearch(@PathVariable String idx,HttpServletRequest request,Model model) throws ParseException{
		search(request,model,idx,false);
		return "manager/goodsadmin/goodsList";
	}
	
	// 상품정보수정
	
	@RequestMapping("/admin/goodsModify{idx}")
	public String goodsModify(@PathVariable String idx,HttpServletRequest request,Model model){
		images = new ArrayList<>();
		repreImageUrl1 = "";
		repreImageUrl2 = "";
		repreImageUrl3 = "";
		repreImageUrl4 = "";		
		model.addAttribute("categories", godcService.getCategories());
		int godNum = Integer.valueOf(idx);
		Goods god = gaService.selectGoods(godNum);
		ListImageUrl = god.getGodListImageUrl();
		MainImageUrl = god.getGodMainImageUrl();
		String content = god.getGodDetailInfo();
		if(content != "" && content != null){
			content = content.trim();
		}
		god.setGodDetailInfo(content);
		model.addAttribute("god",god);
		List<GoodsOptionList> godoList = new ArrayList<>();
		List<GoodsOption> godo = gaService.selectGodcList(godNum);
		if(godo.size() >= 1){
			for(int i = 0 ; i < godo.size() ; i++){
				GoodsOptionList gl = new GoodsOptionList();
				String optName = godo.get(i).getOptName();
				gl.setOptName(optName);
				gl.setGodoList(gaService.selectGodc(idx, optName));
				godoList.add(gl);
			}
		}
		List<GoodsIntroduce> godi = gaService.selectGodI(godNum);
		model.addAttribute("godiList",godi);
		model.addAttribute("godoList",godoList);
		List<GoodsSubImage> gsi = gaService.selectSubImg(godNum);
		for(int i = 0 ; i < gsi.size() ; i++){
			switch(i){
			case 0:	repreImageUrl1 = gsi.get(i).getSubImageUrl();
						break;
			case 1:repreImageUrl2 = gsi.get(i).getSubImageUrl();
						break;
			case 2:repreImageUrl3 = gsi.get(i).getSubImageUrl();
						break;
			case 3:repreImageUrl4 = gsi.get(i).getSubImageUrl();
						break;
			}
		}
		model.addAttribute("repreImageUrl1",repreImageUrl1);
		model.addAttribute("repreImageUrl2",repreImageUrl2);
		model.addAttribute("repreImageUrl3",repreImageUrl3);
		model.addAttribute("repreImageUrl4",repreImageUrl4);
		model.addAttribute("goodsManageLogs",gaService.selectGml(idx));
		return "manager/goodsadmin/goodsModify";
	}
	
	@RequestMapping("/admin/ModifyGoods")
	@ResponseBody
	public String ModifyGoods(MultipartHttpServletRequest request){
		try{
		String result = gaService.modifyGoods(request, gaService, orderService, ListImageUrl, MainImageUrl, repreImageUrl1, repreImageUrl2, repreImageUrl3, repreImageUrl4);
		if(result.equals("nameoverlap")){
			return "nameoverlap";
		}
		return "success";
		}catch(Exception e){
			String str = e.getMessage();
			if(str.contains("ITR_PK")){
				return "itr";
			}else if(str.contains("GODO_PK")){
				return "godo";
			}
			return "error";
		}
	}
	
	@RequestMapping("/admin/deleteRepre")
	@ResponseBody
	public String ModifyGoods(String name,String godNum){
		if(name.equals("repreImg2")){
			repreImageUrl2 = "";
			gaService.removeGoodsSub(godNum, "2");
		}else if(name.equals("repreImg3")){
			repreImageUrl3 = "";
			gaService.removeGoodsSub(godNum, "3");
		}else if(name.equals("repreImg4")){
			repreImageUrl4 = "";
			gaService.removeGoodsSub(godNum, "4");
		}
		return "";
	}
	
	@RequestMapping(value="/admin/DeleteGoods",method=RequestMethod.POST)
	public String DeleteGoods(HttpServletRequest request,Model model){
		HashMap<String,List<String>> map = new HashMap<>();
		List<String> list = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(request.getParameter("list"),",");
		while(st.hasMoreTokens()){
			list.add(st.nextToken()); 
		}
		map.put("list", list);
		gaService.removeGoods(map);
		return "redirect:goodsList" + type+ index;
	}
	
	
	// 카테고리 관리
	
	@RequestMapping("/admin/categoryManagement")
	public String categoryManagement(HttpServletRequest request,Model model){
		model.addAttribute("categories",godcService.selectCategories());
		return "manager/goodsadmin/goodsCategory";
	}

	@RequestMapping("/admin/createCategory")
	@ResponseBody
	public String createCategory(MultipartHttpServletRequest request){
		String categoryName = request.getParameter("categoryName");
		String displayType = request.getParameter("show");
		godcService.addCategory(new GoodsCategories(categoryName,displayType));
		return "";
	}
	
	@RequestMapping("/admin/modifyCategory")
	@ResponseBody
	public String modifyCategory(MultipartHttpServletRequest request){
		String categoryName = request.getParameter("categoryName");
		String displayType = request.getParameter("show");
		String godcNum = request.getParameter("categoryNum");
		try{
			godcService.modifyCategory(new GoodsCategories(Integer.valueOf(godcNum),categoryName,displayType));
		}catch(Exception e){
			return "overlap";
		}
		return "";
	}
	
	@RequestMapping("/admin/deleteCategory")
	@ResponseBody
	public String deleteCategory(int categoryNum){
		godcService.deleteCategory(categoryNum);
		return "";
	}
	
	@RequestMapping(value="/uploadImage",method=RequestMethod.POST)
	public String uploadImage(HttpServletRequest req, HttpServletResponse resp, 
            MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/upload");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						images.add(fileName);
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() + "/upload/" + fileName;
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}
	
	@RequestMapping("/admin/deleteImg")
	@ResponseBody
	public String deleteImg(HttpServletRequest request){
		String dir = request.getServletContext().getRealPath("/upload");
		for(int i = 0 ; i < images.size() ; i++){
			String address = dir + "/" + images.get(i);
			  File f = new File(address);
			 if(f.exists()){
				f.delete();
			}
		}
		return "";
	}
	
}
