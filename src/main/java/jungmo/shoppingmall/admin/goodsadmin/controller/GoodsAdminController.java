package jungmo.shoppingmall.admin.goodsadmin.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.goodsadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class GoodsAdminController {
	@Autowired private GoodsCategoriesService godcService;
	@Autowired private GoodsAdminService gaService;
	
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
		List<OptionList> optionArray = new ArrayList<>();
		int k = 0;
		OptionList ol = new OptionList();
		StringTokenizer st = new StringTokenizer(optionList[0],",");
		while(st.hasMoreTokens()){
			String str = st.nextToken();
			switch(k){
			case 0:ol.setOptionName(str);
						k++;
						break;
			case 1:ol.setOptionIntroduce(str);
						k++;
						break;
			case 2:ol.setOptionPrice(Integer.valueOf(str));
						k = 0;
						optionArray.add(ol);
						ol = new OptionList();
						break;
			}
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
}
