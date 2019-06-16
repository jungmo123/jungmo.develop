package jungmo.shoppingmall.user.review.dao;

import java.util.*;

import jungmo.shoppingmall.user.review.dao.mapper.*;
import jungmo.shoppingmall.user.review.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMapper rvMapper;
	
	public List<ReviewGoods> getRg(String userId){
		return rvMapper.getRg(userId);
	}
	
	public void addReview(ReviewGoods rg){
		rvMapper.addReview(rg);
	}
}
