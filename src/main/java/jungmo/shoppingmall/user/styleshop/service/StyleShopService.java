package jungmo.shoppingmall.user.styleshop.service;

import java.util.*;

import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopService {
	List<Goods> getGoods(Page page);
	List<GoodsReview> getGoodsReviews(Page page);
}
