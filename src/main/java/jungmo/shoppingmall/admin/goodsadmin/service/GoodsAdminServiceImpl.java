package jungmo.shoppingmall.admin.goodsadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsAdminServiceImpl implements GoodsAdminService{
	@Autowired private GoodsAdminDao gaDao;
	
	public int insertGoods(Goods god){
		return gaDao.insertGoods(god);
	}
	
	public int insertGoodsSub(HashMap<String,List<String>> map){
		return gaDao.insertGoodsSub(map);
	}
}
