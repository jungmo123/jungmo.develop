package jungmo.shoppingmall.user.styleshop.service;

import java.util.*;

import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.dao.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class StyleShopServiceImpl implements StyleShopService{
	@Autowired private StyleShopDao ssDao;
	
	public List<Goods> getGoods(Page page){
		return ssDao.getGoods(page);
	}
	
	public List<GoodsReview> getGoodsReviews(Page page){
		return ssDao.getGoodsReviews(page);
	}
	
	public List<GoodsQnA> getGoodsQnA(Page page){
		return ssDao.getGoodsQnA(page);
	}
	
	public 	void modifyGoodsReview(String godrNum,String godrContent,String satisLevel){
		ssDao.modifyGoodsReview(godrNum, godrContent, satisLevel);
	}
}
