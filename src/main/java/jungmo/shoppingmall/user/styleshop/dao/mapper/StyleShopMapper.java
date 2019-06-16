package jungmo.shoppingmall.user.styleshop.dao.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopMapper {
	List<Goods> getGoods(Page page);
	List<GoodsReview> getGoodsReviews(Page page);
	List<GoodsQnA> getGoodsQnA(Page page);
	void modifyGoodsReview(
			@Param("godrNum") String godrNum,
			@Param("godrContent") String godrContent,
			@Param("satisLevel") String satisLevel);
	void modifyGoodsQuestion(
			@Param("godqNum") String godqNum,
			@Param("godqContent") String godqContent);
	void deleteGoodsQuestion(String godqNum);
	void insertGoodsQuestion(
			@Param("godNum") String godNum,
			@Param("godqContent") String godqContent,
			@Param("userId") String userId);
	void deleteGoodsReview(String godrNum);
	void insertCarts(HashMap<String,List<Carts>> map);
	int addGoodsViewCnt(String godNum);
}
