package jungmo.shoppingmall.user.review.service;

import java.util.*;

import jungmo.shoppingmall.user.review.dao.*;
import jungmo.shoppingmall.user.review.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired private ReviewDao rvDao;
	
	public List<ReviewGoods> getRg(String userId){
		return rvDao.getRg(userId);
	}
	
	public void addReview(ReviewGoods rg){
		rvDao.addReview(rg);
	}
}
