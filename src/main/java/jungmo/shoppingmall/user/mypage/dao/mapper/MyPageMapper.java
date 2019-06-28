package jungmo.shoppingmall.user.mypage.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.mypage.domain.*;

import org.apache.ibatis.annotations.*;

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
	int deleteCart(HashMap<String,List<String>> map);
	List<PointLogs> getPl(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<PointLogs> getSearchPl(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<OtoQuestion> getMOtoq(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<OtoQuestion> getMOtoqSearch(jungmo.shoppingmall.user.styleshop.domain.Page page);
}
