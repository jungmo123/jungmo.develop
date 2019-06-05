package jungmo.shoppingmall.user.styleshop.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopDao {
	List<Goods> getGoods(Page page);
}
