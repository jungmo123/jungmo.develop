package jungmo.shoppingmall.user.styleshop.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopDao {
	List<Goods> getGoods(Page page);
	List<GoodsReview> getGoodsReviews(Page page);
	List<GoodsQnA> getGoodsQnA(Page page);
	void modifyGoodsReview(
			@Param("godrNum") String godrNum,
			@Param("godrContent") String godrContent,
			@Param("satisLevel") String satisLevel);
}
