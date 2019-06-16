package jungmo.shoppingmall.user.styleshop.dao;

import java.util.*;

import jungmo.shoppingmall.user.styleshop.domain.*;
import jungmo.shoppingmall.admin.order.domain.Goods;
import jungmo.shoppingmall.user.styleshop.dao.mapper.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

import org.apache.ibatis.annotations.*;
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
	
	public List<GoodsQnA> getGoodsQnA(Page page){
		return ssMapper.getGoodsQnA(page);
	}
	
	public void modifyGoodsReview(String godrNum,String godrContent,String satisLevel){
		ssMapper.modifyGoodsReview(godrNum, godrContent, satisLevel);
	}
	
	public void modifyGoodsQuestion(String godqNum,String godqContent){
		ssMapper.modifyGoodsQuestion(godqNum, godqContent);
	}
	
	public void deleteGoodsQuestion(String godqNum){
		ssMapper.deleteGoodsQuestion(godqNum);
	}
	
	public 	void insertGoodsQuestion(String godNum,String godqContent,String userId){
		ssMapper.insertGoodsQuestion(godNum, godqContent, userId);
	}
	
	public void deleteGoodsReview(String godrNum){
		ssMapper.deleteGoodsReview(godrNum);
	}
	
	public void insertCarts(HashMap<String,List<Carts>> map){
		ssMapper.insertCarts(map);
	}
	
	public int addGoodsViewCnt(String godNum){
		return ssMapper.addGoodsViewCnt(godNum);
	}
}
