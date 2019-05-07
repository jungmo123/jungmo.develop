package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface GoodsReviewDao {
	List<GoodsReview> getGodr(Page page);
	List<GoodsReview> getGodrSearch(Page page);
	int updateGodr(@Param("godrNum") int godrNum,@Param("godrContent") String godrContent);
	int deleteGodr(int godrNum);
}
