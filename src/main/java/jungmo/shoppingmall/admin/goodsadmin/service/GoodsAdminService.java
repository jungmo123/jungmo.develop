package jungmo.shoppingmall.admin.goodsadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface GoodsAdminService {
	int insertGoods(Goods god);
	int insertGoodsSub(HashMap<String,List<String>> map);
}
