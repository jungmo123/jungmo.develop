package jungmo.shoppingmall.user.styleshop.dao;

import java.util.*;

import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.dao.mapper.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class StyleShopDaoImpl implements StyleShopDao{
	@Autowired StyleShopMapper ssMapper;
	
	public List<Goods> getGoods(Page page){
		return ssMapper.getGoods(page);
	}
	
	public List<GoodsReview> getGoodsReviews(Page page){
		return ssMapper.getGoodsReviews(page);
	}
}
