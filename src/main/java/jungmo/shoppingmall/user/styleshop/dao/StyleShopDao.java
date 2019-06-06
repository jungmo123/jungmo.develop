package jungmo.shoppingmall.user.styleshop.dao;

import java.util.*;

import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopDao {
	List<Goods> getGoods(Page page);
	List<GoodsReview> getGoodsReviews(Page page);
}
