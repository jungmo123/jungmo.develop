package jungmo.shoppingmall.user.search.dao;

import java.util.*;

import jungmo.shoppingmall.user.search.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.domain.Page;
import jungmo.shoppingmall.user.styleshop.domain.GoodsReview;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class SearchDaoImpl implements SearchDao{
	@Autowired private SearchMapper searchMapper;
	 
	public List<Goods> getGoods(Page page){
		return searchMapper.getGoods(page);
	}
	
	public 	List<GoodsReview> getGoodsReviews(Page page){
		return searchMapper.getGoodsReviews(page);
	}
	
	public List<Posts> getPosts(Page page){
		return searchMapper.getPosts(page);
	}
}
