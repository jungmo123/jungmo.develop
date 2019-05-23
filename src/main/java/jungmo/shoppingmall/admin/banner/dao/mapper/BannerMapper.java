package jungmo.shoppingmall.admin.banner.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.banner.domain.*;

public interface BannerMapper {
	List<Banner> getBanners(String bnnLocation);
	int updateBanner(Banner banner);
	int addBanner(Banner banner);
	Banner getBanner(int bnnNum);
	int deleteBanner(int bnnNum);
}
