package jungmo.shoppingmall.admin.goodsadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsAdminDaoImpl implements GoodsAdminDao{
	@Autowired private GoodsAdminMapper gaMapper;
	
	public int insertGoods(Goods god){
		return gaMapper.insertGoods(god);
	}
	
	public int insertGoodsSub(HashMap<String,List<String>> map){
		return gaMapper.insertGoodsSub(map);
	}
}
