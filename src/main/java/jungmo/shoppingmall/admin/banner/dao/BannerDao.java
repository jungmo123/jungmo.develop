package jungmo.shoppingmall.admin.banner.dao;

import java.util.*;

import jungmo.shoppingmall.admin.banner.domain.*;

public interface BannerDao {
	List<Banner> getBanners(String bnnLocation);
}
