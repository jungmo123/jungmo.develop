package jungmo.shoppingmall.user.main.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface MainDao {
	List<Goods> getCategoryGoods(String godcNum);
	List<Goods> getCategory();
	List<Goods> getLatelyGoods();
}
