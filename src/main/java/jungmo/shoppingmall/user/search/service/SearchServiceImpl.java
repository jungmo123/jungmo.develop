package jungmo.shoppingmall.user.search.service;

import java.util.*;

import jungmo.shoppingmall.user.search.dao.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired private SearchDao searchDao;
	
	public List<Goods> getGoods(Page page){
		return searchDao.getGoods(page);
	}
	
	public 	List<GoodsReview> getGoodsReviews(Page page){
		return searchDao.getGoodsReviews(page);
	}
	
	public List<Posts> getPosts(Page page){
		return searchDao.getPosts(page);
	}
}
