package jungmo.shoppingmall.admin.banner.dao;

import java.util.*;

import jungmo.shoppingmall.admin.banner.dao.mapper.*;
import jungmo.shoppingmall.admin.banner.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class BannerDaoImpl implements BannerDao{
	@Autowired private BannerMapper bannerMapper;
	
	public List<Banner> getBanners(String bnnLocation){
		return bannerMapper.getBanners(bnnLocation);
	}
}
