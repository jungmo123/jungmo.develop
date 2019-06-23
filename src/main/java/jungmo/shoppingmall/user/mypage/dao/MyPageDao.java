package jungmo.shoppingmall.user.mypage.dao;

import java.util.*;

import jungmo.shoppingmall.user.mypage.domain.*;

public interface MyPageDao {
	List<Reason> getReason();
	int addRefund(RefundAndExchange re);
	int addExchange(RefundAndExchange re);
	int addRefundImage(RefundAndExchangeImage reai);
	int addExchangeImage(RefundAndExchangeImage reai);
	int deleteRefund(String ordNum);
	int deleteExchange(String ordNum);
	RefundAndExchange getRefund(String ordNum);
	RefundAndExchange getExchange(String ordNum);
	List<ImageList> getRefundImage(String ordNum);
	List<ImageList> getExchangeImage(String ordNum);
	List<Cart> getCart(String userId);
}
