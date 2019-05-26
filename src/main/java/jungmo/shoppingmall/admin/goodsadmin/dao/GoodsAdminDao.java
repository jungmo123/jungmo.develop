package jungmo.shoppingmall.admin.goodsadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface GoodsAdminDao {
	int insertGoods(Goods god);
	int insertGoodsSub(HashMap<String,List<String>> map);
}
