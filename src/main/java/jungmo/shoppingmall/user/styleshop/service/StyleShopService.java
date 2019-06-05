package jungmo.shoppingmall.user.styleshop.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

public interface StyleShopService {
	List<Goods> getGoods(Page page);
}
