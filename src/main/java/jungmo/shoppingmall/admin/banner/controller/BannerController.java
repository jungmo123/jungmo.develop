package jungmo.shoppingmall.admin.banner.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.banner.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

@Controller
public class BannerController {
	@Autowired private BannerService bannerService;

	@RequestMapping("/admin/banner")
	public String banner(){
		return "manager/banner/banner";
	}
	
	@RequestMapping("/admin/getBanner")
	@ResponseBody
	public List<Banner> getBanner(String bnnLocation){
		return bannerService.getBanners(bnnLocation);
	}
	
	@RequestMapping("/admin/modifyBanner")
	@ResponseBody
	public String uploadBanner(MultipartHttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("admin");
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String origin = request.getParameter("original");
		String filePath = dir + "/" + origin;
		String fullName = "";
		String linkAddress = request.getParameter("linkAddress");
		String bannerExplainment = request.getParameter("bannerExplainment");
		String eventType = request.getParameter("eventType");
		String bnnNum = request.getParameter("bnnNum");
		String bnnType = request.getParameter("bannerLink");
		File f = new File(filePath);
		Iterator<String> itr = request.getFileNames();
		if(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			if(file.getOriginalFilename() == ""){
				fullName = origin;
				bannerService.updateBanner(new Banner(Integer.parseInt(bnnNum),eventType,bannerExplainment,fullName,linkAddress,bnnType));
			}else{
				if(f.exists()){
					f.delete();
				}
				fullName = "banner" + userId+ today;
				save(dir + "/" + fullName,file);
				bannerService.updateBanner(new Banner(Integer.parseInt(bnnNum),eventType,bannerExplainment,fullName,linkAddress,bnnType));
			}
		}
		return "";
	}
	
	@RequestMapping("/admin/addBanner")
	@ResponseBody
	public Banner addBanner(MultipartHttpServletRequest request){
		String userId = (String)request.getSession().getAttribute("admin");
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		String linkAddress = request.getParameter("linkAddress");
		String bannerExplainment = request.getParameter("bannerExplainment");
		String eventType = request.getParameter("eventType");
		String bnnType = request.getParameter("bannerLink");
		String bnnLocation = request.getParameter("bnnLocation");
		Banner bn = null;
		Iterator<String> itr = request.getFileNames();
		if(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			fullName = "banner" + userId+ today;
			System.out.println(file.getOriginalFilename());
			save(dir + "/" + fullName,file);
			bn = new Banner(bnnLocation,eventType,bannerExplainment,fullName,linkAddress,bnnType);
			bannerService.addBanner(bn);
		}
		return bannerService.getBanner(bn.getBnnNum());
	}
	
	@RequestMapping("/admin/deleteBanner")
	@ResponseBody
	public String deleteBanner(int bnnNum,String bnnImageUrl,HttpServletRequest request){
		bannerService.deleteBanner(bnnNum);
		String dir = request.getServletContext().getRealPath("/upload");
		String filePath = dir + "/" + bnnImageUrl;
		File f = new File(filePath);
		if(f.exists()){
			f.delete();
		}
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
