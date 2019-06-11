package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface PostService {
	List<PurchaseList> getPosts(Page page);
	List<GoodsOption> getGodo(
			@Param("ordNum") String ordNum,
			@Param("godNum") String godNum,
			@Param("purNum") String purNum);
	List<PurchaseList> getDatePosts(Page page);
	List<OrderCancel> getCancelPosts(Page page);
	List<Post> getCancelDatePosts(Page page);
	List<Post> getRefundPosts(Page page);
	List<Post> getRefundDatePosts(Page page);
	List<Post> getExchangePosts(Page page);
	List<Post> getExchangeDatePosts(Page page);
}
