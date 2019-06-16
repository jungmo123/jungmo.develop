package jungmo.shoppingmall.user.review.dao;

import java.util.*;

import jungmo.shoppingmall.user.review.domain.*;

public interface ReviewDao {
	List<ReviewGoods> getRg(String userId);
	void addReview(ReviewGoods rg);
}
