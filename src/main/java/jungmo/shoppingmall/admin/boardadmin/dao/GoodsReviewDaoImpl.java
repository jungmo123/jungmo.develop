package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsReviewDaoImpl implements GoodsReviewDao{
	@Autowired private GoodsReviewMapper godrMapper;
	
	public List<GoodsReview> getGodr(Page page){
		return godrMapper.getGodr(page);
	}
	
	public List<GoodsReview> getGodrSearch(Page page){
		return godrMapper.getGodrSearch(page);
	}
	
	public int updateGodr(@Param("godrNum") int godrNum,@Param("godrContent") String godrContent){
		return godrMapper.updateGodr(godrNum, godrContent);
	}
	
	public int deleteGodr(int godrNum){
		return godrMapper.deleteGodr(godrNum);
	}
}
