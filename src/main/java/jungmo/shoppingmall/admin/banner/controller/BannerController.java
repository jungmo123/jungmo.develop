package jungmo.shoppingmall.admin.banner.controller;

import java.util.*;

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
	
	@RequestMapping("/admin/uploadBanner")
	@ResponseBody
	public String uploadBanner(MultipartHttpServletRequest request){
		System.out.println(request.getParameter("bannerAddress"));
		Iterator<String> itr = request.getFileNames();
		System.out.println(itr);
		System.out.println();
		if(itr.hasNext()){
			MultipartFile mpf = request.getFile(itr.next());
			System.out.println(mpf.getOriginalFilename());
			System.out.println();
		}
		return "";
	}
}
