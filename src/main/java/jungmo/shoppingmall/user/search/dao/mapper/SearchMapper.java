package jungmo.shoppingmall.user.search.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.Page;
import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;

public interface SearchMapper {
	List<Goods> getGoods(Page page);
	List<GoodsReview> getGoodsReviews(Page page);
	List<Posts> getPosts(Page page);
}
