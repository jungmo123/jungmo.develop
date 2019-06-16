package jungmo.shoppingmall.user.review.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.user.review.domain.*;

public interface ReviewMapper {
	List<ReviewGoods> getRg(String userId);
	void addReview(ReviewGoods rg);
}
