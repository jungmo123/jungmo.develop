package jungmo.shoppingmall.admin.goodsadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public interface GoodsAdminMapper {
	int insertGoods(Goods god);
	int insertGoodsSub(HashMap<String,List<String>> map);
}
