package jungmo.shoppingmall.user.main.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface MainMapper {
	List<Goods> getCategoryGoods(String godcNum);
	List<Goods> getCategory();
	List<Goods> getLatelyGoods();
}
