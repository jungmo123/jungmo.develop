package jungmo.shoppingmall.admin.goodsadmin.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

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
		String goodsIntroduce = request.getParameter("ProductIntroduce");
		String productInfo = request.getParameter("WriteContent");
		String memo = request.getParameter("memo");
		String productState = request.getParameter("productstate");
		String [] optionList = request.getParameterValues("optionList");
		String [] infoList = request.getParameterValues("infoList");
		String indexFile = "";
		String mainFile ="";
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
			if(fileName != ""){
				fullName = fileName + userId+ today + idx + ".jpg";
				files.add(fullName);
				save(dir + "/" + fullName,file);
				idx++;
			}
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
		Goods god = new Goods(Integer.valueOf(normalPrice),Integer.valueOf(sellingPrice),mainFile,indexFile,Integer.valueOf(godStock),Integer.valueOf(godSellingLimit),godName,productState,Integer.valueOf(category),productInfo,memo);
		gaService.insertGoods(god);
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
		StringTokenizer st1 = new StringTokenizer(optionList[0],",");
		StringTokenizer st2 = new StringTokenizer(infoList[0],",");
		try{
			while(st2.hasMoreTokens()){
				String str2 = st2.nextToken();
				switch(k){
				case 0:	gi.setGodNum(god.getGodNum());
							gi.setItrName(str2);
							k++;
							break;
				case 1:gi.setItrContent(str2);
							k = 0;
							giArray.add(gi);
							gi = new GoodsIntroduce();
							break;
				}
			}
			if(!infoList[0].equals("")){
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
				switch(k){
				case 0:	ol.setGodNum(god.getGodNum());
							ol.setOptName(str1);
							k++;
							break;
				case 1:ol.setOptContent(str1);
							k++;
							break;
				case 2:ol.setOptPrice(str1);
							k = 0;
							optionArray.add(ol);
							ol = new GoodsOption();
							break;
				}
			}
			if(!optionList[0].equals("")){
				go.put("ol", optionArray);
				gaService.insertGoodsOption(go);
			}
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
}
