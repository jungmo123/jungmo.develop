package jungmo.shoppingmall.user.mypage.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.GoodsReview;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.mypage.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.*;

import org.springframework.web.multipart.*;

public interface MyPageService {
	String sdate();
	String edate();
	String week1();
	String week3();
	String month1();
	String month3();
	String updateOrderCancel(String ordNum);
	List<Reason> getReason();
	String addRea(MultipartHttpServletRequest request,MyPageService mypageService,List<String> fileList);
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
	int modifyCartAmountString(String cartNum,String cartAmount);
	int deleteCart(HashMap<String,List<String>> map);
	List<PointLogs> getPl(Page page);
	List<PointLogs> getSearchPl(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<OtoQuestion> getMOtoq(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<OtoQuestion> getMOtoqSearch(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<OneTwoOneCategory> getOtoc();
	int modifyOtoq(OtoQuestion otoq);
	int addOtoq(OtoQuestion otoq);
	List<GoodsReview> getMGodr(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<GoodsReview> getMGodrSearch(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<GoodsQuestion> getMGodq(jungmo.shoppingmall.user.styleshop.domain.Page page);
	List<GoodsQuestion> getMGodqSearch(jungmo.shoppingmall.user.styleshop.domain.Page page);
	User getUser(String userId);
	int modifyUser(User user);
	int updatePassword(String userId,String userPwd);
	List<secedeCategory> getScd();
	int updateUserState(String userId);
	int addSecedeUser(String userId,String scdCode,String scdContent);
	String addSecede(String userId,String scdCode,String scdContent,String password,MyPageService mypageService);
}
