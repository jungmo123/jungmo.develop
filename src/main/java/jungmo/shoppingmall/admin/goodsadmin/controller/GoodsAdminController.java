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

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

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
	
	// 상품등록
	
	@RequestMapping("/admin/goodsRegister")
	public String goodsadmin(HttpServletRequest request,Model model){
		model.addAttribute("categories", godcService.getCategories());
		return "manager/goodsadmin/goodsRegister";
	}
	
	@RequestMapping("/admin/addGoods")
	@ResponseBody
	public String addGoods(MultipartHttpServletRequest request){
		String category = request.getParameter("category");
		String godName = request.getParameter("productName");
		String sellingPrice = request.getParameter("sellingPrice");
		String normalPrice = request.getParameter("normalPrice");
		String godSellingLimit = request.getParameter("godSellingLimit");
		String godStock = request.getParameter("godStock");
		String goodsIntroduce = request.getParameter("productIntroduce");
		String productInfo = request.getParameter("WriteContent");
		String memo = request.getParameter("memo");
		String productState = request.getParameter("productstate");
		String optionList = request.getParameter("optionList");
		String infoList = request.getParameter("infoList");
		String indexFile = "";
		String mainFile ="";
		productInfo.trim();
		String userId = (String)request.getSession().getAttribute("admin");
		List<String> files = new ArrayList<String>();
		List<String> repreFiles = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		Iterator<String> itr = request.getFileNames();
		int idx = 1;
		while(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")){
				fullName = fileName + userId+ today + idx + ".jpg";
				files.add(fullName);
				save(dir + "/" + fullName,file);
			}
			idx++;
		}
		for(int i = 0 ; i < files.size() ; i++){
			if(i == 0){
				indexFile = files.get(i);
			}else if(i == files.size()-1){
				mainFile = files.get(i);
			}else{
				repreFiles.add(files.get(i));
			}
		}
		Goods god = new Goods(Integer.valueOf(normalPrice),Integer.valueOf(sellingPrice),mainFile,indexFile,Integer.valueOf(godStock),Integer.valueOf(godSellingLimit),godName,productState,Integer.valueOf(category),productInfo,memo,goodsIntroduce);
		try{
		gaService.insertGoods(god);
		}catch(Exception e){
			return "nameoverlap";
		}
		String godNum = String.valueOf(god.getGodNum());
		List<String> num = new ArrayList<>();
		num.add(godNum);
		HashMap<String,List<String>> godSub = new HashMap<>();
		godSub.put("num", num);
		godSub.put("img", repreFiles);
		gaService.insertGoodsSub(godSub);
		List<GoodsOption> optionArray = new ArrayList<>();
		List<GoodsIntroduce> giArray = new ArrayList<>();
		HashMap<String,List<GoodsOption>> go = new HashMap<>(); 
		HashMap<String,List<GoodsIntroduce>> intro = new HashMap<>();
		int k = 0;
		GoodsOption ol = new GoodsOption();
		GoodsIntroduce gi = new GoodsIntroduce();
		StringTokenizer st1 = new StringTokenizer(optionList,"$$%");
		StringTokenizer st2 = new StringTokenizer(infoList,"$$%");
		try{
			while(st2.hasMoreTokens()){
				String str2 = st2.nextToken();
				StringTokenizer str22 = new StringTokenizer(str2,"@^&");
				while(str22.hasMoreTokens()){
					String str222 = str22.nextToken();
					switch(k){
					case 0:	gi.setGodNum(god.getGodNum());
								gi.setItrName(str222);
								k++;
								break;
					case 1:gi.setItrContent(str222);
								k = 0;
								giArray.add(gi);
								gi = new GoodsIntroduce();
								break;
					}					
				}
			}
			if(!infoList.equals("")){
				intro.put("gi",giArray);
				gaService.insertGoodsIntroduce(intro);
			}
		}catch(Exception e){
			gaService.deleteGoods(god.getGodNum());
			return "Gioverlap";
		}
		try{
			while(st1.hasMoreTokens()){
				String str1 = st1.nextToken();
				StringTokenizer str11= new StringTokenizer(str1,"@^&");
				while(str11.hasMoreTokens()){
					String str111 = str11.nextToken();
					switch(k){
					case 0:	ol.setGodNum(god.getGodNum());
								ol.setOptName(str111);
								k++;
								break;
					case 1:ol.setOptContent(str111);
								k++;
								break;
					case 2:ol.setOptPrice(str111);
								k = 0;
								optionArray.add(ol);
								ol = new GoodsOption();
								break;
					}					
				}
			}
			if(!optionList.equals("")){
				go.put("ol", optionArray);
				gaService.insertGoodsOption(go);
			}
			gaService.insertGml(godNum, "상품 등록", userId);
		}catch(Exception e){
			gaService.deleteGoods(god.getGodNum());
			return "Gooverlap";
		}
		return "";
	}
	@RequestMapping("/admin/addGoodsInfo")
	@ResponseBody
	public String addGoodsInfo(@RequestParam(value="list[]")List<String> list){
		System.out.println(list);
		return "";
	}
	
	private void save(String fileFullName,MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
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
		String godNum = request.getParameter("godNum");
		String category = request.getParameter("category");
		String godName = request.getParameter("productName");
		String sellingPrice = request.getParameter("sellingPrice");
		String normalPrice = request.getParameter("normalPrice");
		String godSellingLimit = request.getParameter("godSellingLimit");
		String godStock = request.getParameter("godStock");
		String goodsIntroduce = request.getParameter("productIntroduce");
		String productInfo = request.getParameter("WriteContent");
		String memo = request.getParameter("memo");
		String productState = request.getParameter("productstate");
		String optionList = request.getParameter("optionList");
		String infoList = request.getParameter("infoList");
		String optionCheck  = request.getParameter("optionCheck");
		String indexFile = "";
		String mainFile ="";
		productInfo.trim();
		String userId = (String)request.getSession().getAttribute("admin");
		Goods god = orderService.getGod(godName);
		if(god != null){
			if(god.getGodNum() != Integer.valueOf(godNum)){
				return "nameoverlap";
			}
		}
		List<String> files = new ArrayList<String>();
		List<String> repreFiles = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		Iterator<String> itr = request.getFileNames();
		String filePath;
		File f;
		int idx = 1;
		while(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")){
				switch(idx){
				case 1:filePath = dir + "/" + ListImageUrl;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
						 break;
				case 2:filePath = dir + "/" + repreImageUrl1;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 3:filePath = dir + "/" + repreImageUrl2;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 4:filePath = dir + "/" + repreImageUrl3;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 5:filePath = dir + "/" + repreImageUrl4;
				  f = new File(filePath);
				 if(f.exists()){
					f.delete();
				}
				 break;
				case 6:filePath = dir + "/" + MainImageUrl;
				  f = new File(filePath);
				 if(f.exists()){
					f.delete();
				}
				 break;
				}
				fullName = fileName + userId+ today + idx + ".jpg";
				files.add(fullName);
				save(dir + "/" + fullName,file);
			}else{
				files.add("");
			}
			idx++;
		}
		for(int i = 0 ; i < files.size() ; i++){
			if(i == 0){
				indexFile = files.get(i);
			}else if(i == files.size()-1){
				mainFile = files.get(i);
			}else{
				if(!files.get(i).equals("")){
					repreFiles.add(files.get(i));
				}else{
					switch(i){
					case 1:repreFiles.add(repreImageUrl1);
							 break;
					case 2:repreFiles.add(repreImageUrl2);
					  		 break;
					case 3:repreFiles.add(repreImageUrl3);
					  		 break;
					case 4:repreFiles.add(repreImageUrl4);
					  		 break;
					}
				}
			}
		}
		
		for(int i = 3 ; i > 0 ; i--){
			if(repreFiles.get(i).equals("")){
				repreFiles.remove(i);
			}
		}
		if(mainFile.equals("")){
			mainFile = MainImageUrl;
		}
		if(indexFile.equals("")){
			indexFile = ListImageUrl;
		}
		Goods goods = new Goods(Integer.valueOf(godNum),Integer.valueOf(normalPrice),Integer.valueOf(sellingPrice),mainFile,indexFile,Integer.valueOf(godStock),Integer.valueOf(godSellingLimit),godName,productState,Integer.valueOf(category),productInfo,memo,goodsIntroduce);
		gaService.updateGoods(goods);
		gaService.insertGml(godNum, "상품 수정", userId);
		gaService.deleteGoodsSub(Integer.valueOf(godNum));
		List<String> num = new ArrayList<>();
		num.add(godNum);
		HashMap<String,List<String>> godSub = new HashMap<>();
		godSub.put("num", num);
		godSub.put("img", repreFiles);
		gaService.insertGoodsSub(godSub);
		List<GoodsOption> optionArray = new ArrayList<>();
		List<GoodsIntroduce> giArray = new ArrayList<>();
		HashMap<String,List<GoodsOption>> go = new HashMap<>(); 
		HashMap<String,List<GoodsIntroduce>> intro = new HashMap<>();
		int k = 0;
		GoodsOption ol = new GoodsOption();
		GoodsIntroduce gi = new GoodsIntroduce();
		StringTokenizer st1 = new StringTokenizer(optionList,"$$%");
		StringTokenizer st2 = new StringTokenizer(infoList,"$$%");
		gaService.deleteGoodsIntroduce(Integer.valueOf(godNum));
		try{ 
			while(st2.hasMoreTokens()){
				String str2 = st2.nextToken();
				StringTokenizer str22 = new StringTokenizer(str2,"@^&");
				while(str22.hasMoreTokens()){
					String str222 = str22.nextToken();
					switch(k){
					case 0:	gi.setGodNum(Integer.valueOf(godNum));
								gi.setItrName(str222);
								k++;
								break;
					case 1:gi.setItrContent(str222);
								k = 0;
								giArray.add(gi);
								gi = new GoodsIntroduce();
								break;
					}					
				}
			}
			if(!infoList.equals("")){
				intro.put("gi",giArray);
				gaService.insertGoodsIntroduce(intro);
			}
		}catch(Exception e){
			gaService.deleteGoods(Integer.valueOf(godNum));
			return "Gioverlap";
		}
		if(optionCheck.equals("사용")){
			gaService.deleteGoodsOption(Integer.valueOf(godNum));
			try{ 
				while(st1.hasMoreTokens()){
					String str1 = st1.nextToken();
					StringTokenizer str11= new StringTokenizer(str1,"@^&");
					while(str11.hasMoreTokens()){
						String str111 = str11.nextToken();
						switch(k){
						case 0:	ol.setGodNum(Integer.valueOf(godNum));
									ol.setOptName(str111);
									k++;
									break;
						case 1:ol.setOptContent(str111);
									k++;
									break;
						case 2:ol.setOptPrice(str111);
									k = 0;
									optionArray.add(ol);
									ol = new GoodsOption();
									break;
						}					
					}
				}
				if(!optionList.equals("")){
					go.put("ol", optionArray);
					gaService.insertGoodsOption(go);
				}
			}catch(Exception e){
				return "Gooverlap";
			}			
		}
		return "";
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
}
