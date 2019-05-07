package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsReviewServiceImpl implements GoodsReviewService{
	@Autowired private GoodsReviewDao godrDao;
	
	public List<GoodsReview> getGodr(Page page){
		return godrDao.getGodr(page);
	}
	
	public List<GoodsReview> getGodrSearch(Page page){
		return godrDao.getGodrSearch(page);
	}
	
	public int updateGodr(@Param("godrNum") int godrNum,@Param("godrContent") String godrContent){
		return godrDao.updateGodr(godrNum, godrContent);
	}
	
	public int deleteGodr(int godrNum){
		return godrDao.deleteGodr(godrNum);
	}
}
