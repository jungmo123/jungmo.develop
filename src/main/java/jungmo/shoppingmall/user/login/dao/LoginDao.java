package jungmo.shoppingmall.user.login.dao;

import java.util.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface LoginDao {
	User loginTest(User user);
	int updateUser(User user);
	int addVisit(String userId);
	int updateLatestDate(String userId);
	int getTodayJoin();
	int getTodaySecede();
	int getTodayGoods();
	int getTodayOrders();
	int getRE();
	int getOto();
	int getGodQnA();
	List<Posts> selectBoard();
	Expiration getDday();
	void updateExpiration(int exdNum,String exdDate);
	List<Banner> getBanner();
}
