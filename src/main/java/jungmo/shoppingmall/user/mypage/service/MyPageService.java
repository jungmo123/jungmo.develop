package jungmo.shoppingmall.user.mypage.service;

import java.util.*;

import jungmo.shoppingmall.user.mypage.domain.*;

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
}
