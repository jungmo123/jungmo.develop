package jungmo.shoppingmall.user.mypage.dao.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.user.mypage.domain.*;

public interface MyPageMapper {
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
	int modifyCartAmount(@Param("cartNum") String cartNum,@Param("cartAmount") String cartAmount);
}
