package jungmo.shoppingmall.user.review.service;

import java.util.*;

import jungmo.shoppingmall.user.review.domain.*;

public interface ReviewService {
	List<ReviewGoods> getRg(String userId);
	void addReview(ReviewGoods rg);
}
