package jungmo.shoppingmall.user.styleshop.controller;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.service.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.goodsadmin.service.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;
import jungmo.shoppingmall.user.styleshop.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import com.google.gson.*;

@Controller
public class StyleShopController {
	@Autowired private GoodsCategoriesService gcService;
	@Autowired private StyleShopService ssService;
	@Autowired private UPageService pageService;
	@Autowired private GoodsAdminService godaService;
	@Autowired private ClauseService clauseService;
	private String godrIndex = "1";
	private String godqIndex = "1";
	
	public void common(HttpServletRequest request,Model model,String idx,String godcNum,String type){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx),20,godcNum,type);
		UPageService ps = new UPageServiceImpl(5,myPage,pageService.getTotRowCnt(godcNum));
		model.addAttribute("pageMaker",ps);
		model.addAttribute("goods",ssService.getGoods(myPage));
		model.addAttribute("godcNum",godcNum);
		model.addAttribute("type",type);
	}
	
	public void godr(String idx,String godNum,String userId,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodNum(godNum);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getGodrTotRowCnt(godNum));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("godr", ssService.getGoodsReviews(myPage));
		map.put("userId", userId);
	}
	
	public void godq(String idx,String godNum,String userId,Map<String,Object> map){
		Page myPage = null;
		myPage = new Page(Integer.parseInt(idx));
		myPage.setGodNum(godNum);
		UPageServiceImpl p = new UPageServiceImpl(5,myPage,pageService.getQnATotRowCnt(godNum));
		PageMaker ps = new PageMaker(p);
		map.put("pageMaker",ps);
		map.put("godq", ssService.getGoodsQnA(myPage));
		map.put("userId", userId);
	}
	
	@RequestMapping("/styleshop{godcNum}I{idx}I{type}")
	public String styleShop(@PathVariable String godcNum,@PathVariable String idx,@PathVariable String type,HttpServletRequest request,Model model){
		model.addAttribute("godc", gcService.getCategory(godcNum));
		common(request,model,idx,godcNum,type);
		return "user/goods/styleshop";
	}
	
	@RequestMapping("/goodsDetail{godNum}")
	public String styleShop(@PathVariable String godNum,HttpServletRequest request,Model model){
		model.addAttribute("godNum", godNum);
		model.addAttribute("godi", godaService.selectGodI(Integer.valueOf(godNum)));
		List<GoodsOption> godo = godaService.selectGodo(godNum);
		List<GoodsOptionList> godoList = new ArrayList<>();
		boolean t = true;
		GoodsOptionList list = new GoodsOptionList(t);
		list.setOptName("");
		for(int i = 0 ; i < godo.size() ; i++){
			GoodsOption g = godo.get(i);
			String optionName = g.getOptName();
			String optionContent = g.getOptContent();
			String optionPrice = g.getOptPrice();
			if(!list.getOptName().equals(optionName)){
				if(!list.getOptName().equals("")){
					godoList.add(list);
					list = new GoodsOptionList(t);
					list.setOptName(optionName);
					GoodsOption go = new GoodsOption();
					go.setOptContent(optionContent);
					go.setOptPrice(optionPrice);
					List<GoodsOption> gl = list.getGodoList();
					gl.add(go);
				}else{
					list.setOptName(optionName);
					GoodsOption go = new GoodsOption();
					go.setOptContent(optionContent);
					go.setOptPrice(optionPrice);
					List<GoodsOption> gl = list.getGodoList();
					gl.add(go);
				}
			}else{
				GoodsOption go = new GoodsOption();
				go.setOptContent(optionContent);
				go.setOptPrice(optionPrice);
				List<GoodsOption> gl = list.getGodoList();
				gl.add(go);
			}
		}
		godoList.add(list);
		model.addAttribute("godoList",godoList);
		model.addAttribute("pointPolicy", clauseService.getPointPolicy());
		model.addAttribute("deliveryPolicy", clauseService.getDeliveryPolicy());
		model.addAttribute("commonPolicy", clauseService.getCommonPolicy());
		model.addAttribute("goods", godaService.selectGoods(Integer.valueOf(godNum)));
		model.addAttribute("subimages",godaService.selectSubImg(Integer.valueOf(godNum)));
		return "user/goods/goodsDetail";
	}
	
	@RequestMapping("/getGoodsReviews")
	@ResponseBody
	public Map<String,Object> getGoodsReviews(String godNum,String idx,HttpServletRequest request){
		if(!idx.equals("0")){
			godrIndex = idx;
		}
		String userId = (String)request.getSession().getAttribute("user");
		Map<String,Object> map = new HashMap<>();
		godr(godrIndex,godNum,userId,map);
		return map;
	}
	
	@RequestMapping("/getGoodsQuestion")
	@ResponseBody
	public Map<String,Object> getGoodsQuestion(String godNum,String idx,HttpServletRequest request){
		if(!idx.equals("0")){
			godqIndex = idx;
		}
		String userId = (String)request.getSession().getAttribute("user");
		Map<String,Object> map = new HashMap<>();
		godq(godqIndex,godNum,userId,map);
		return map;
	}

	@RequestMapping("/modifyGoodsReview")
	@ResponseBody
	public String modifyGoodsReview(String godrNum,String godrContent,String grade,HttpServletRequest request){
		ssService.modifyGoodsReview(godrNum, godrContent, grade);
		return "";
	}
	
	@RequestMapping("/modifyGoodsQuestion")
	@ResponseBody
	public String modifyGoodsQuestion(String godqNum,String godqContent,HttpServletRequest request){
		ssService.modifyGoodsQuestion(godqNum, godqContent);
		return "";
	}
	
	@RequestMapping("/deleteGoodsQuestion")
	@ResponseBody
	public Map<String,Object> deleteGoodsQuestion(String godqNum,String godNum,String idx,HttpServletRequest request){
		ssService.deleteGoodsQuestion(godqNum);
		if(!idx.equals("0")){
			godqIndex = idx;
		}
		String userId = (String)request.getSession().getAttribute("user");
		Map<String,Object> map = new HashMap<>();
		godq(godqIndex,godNum,userId,map);
		return map;
	}
	
	@RequestMapping("/createGoodsQuestion")
	@ResponseBody
	public Map<String,Object> createGoodsQuestion(String godqContent,String godNum,HttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("user");
		ssService.insertGoodsQuestion(godNum, godqContent, userId);
		Map<String,Object> map = new HashMap<>();
		godq("1",godNum,userId,map);
		return map;
	}
	
	@RequestMapping("/deleteGoodsReview")
	@ResponseBody
	public Map<String,Object> deleteGoodsReview(String godrNum,String godNum,String idx,HttpServletRequest request){
		ssService.deleteGoodsReview(godrNum);
		if(!idx.equals("0")){
			godrIndex = idx;
		}
		String userId = (String)request.getSession().getAttribute("user");
		Map<String,Object> map = new HashMap<>();
		godr(godrIndex,godNum,userId,map);
		return map;
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
						System.out.println(fileName);
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/upload");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
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
}
