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
	List<OrderCancel> getCancelDatePosts(Page page);
	List<Refund> getRefundPosts(Page page);
	List<Refund> getRefundDatePosts(Page page);
	List<Exchange> getExchangePosts(Page page);
	List<Exchange> getExchangeDatePosts(Page page);
}
