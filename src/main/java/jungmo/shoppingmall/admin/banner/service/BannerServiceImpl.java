package jungmo.shoppingmall.admin.banner.service;

import java.util.*;

import jungmo.shoppingmall.admin.banner.dao.*;
import jungmo.shoppingmall.admin.banner.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class BannerServiceImpl implements BannerService{
	@Autowired private BannerDao bannerDao;
	
	public List<Banner> getBanners(String bnnLocation){
		return bannerDao.getBanners(bnnLocation);
	}
}
