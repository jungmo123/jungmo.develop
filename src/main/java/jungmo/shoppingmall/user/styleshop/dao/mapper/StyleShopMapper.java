package jungmo.shoppingmall.user.styleshop.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopMapper {
	List<Goods> getGoods(Page page);
}
