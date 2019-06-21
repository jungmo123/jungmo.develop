package jungmo.shoppingmall.user.mypage.service;

import jungmo.shoppingmall.admin.order.service.*;

public interface MyPageService {
	String sdate();
	String edate();
	String week1();
	String week3();
	String month1();
	String month3();
	String updateOrderCancel(String ordNum);
}
