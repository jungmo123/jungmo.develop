package jungmo.shoppingmall.user.styleshop.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.styleshop.dao.*;
import jungmo.shoppingmall.user.styleshop.domain.Page;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class StyleShopServiceImpl implements StyleShopService{
	@Autowired private StyleShopDao ssDao;
	
	public List<Goods> getGoods(Page page){
		return ssDao.getGoods(page);
	}
}
