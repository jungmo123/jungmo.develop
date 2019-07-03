package jungmo.shoppingmall.user.main.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface MainService {
	List<Goods> getCategoryGoods(String godcNum);
	List<Goods> getCategory();
	List<Goods> getLatelyGoods();
}
