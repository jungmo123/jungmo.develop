package jungmo.shoppingmall.admin.goodsadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.dao.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
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
	
	public int insertGoodsOption(HashMap<String,List<GoodsOption>> map){
		return gaDao.insertGoodsOption(map);
	}
	
	public int insertGoodsIntroduce(HashMap<String,List<GoodsIntroduce>> map){
		return gaDao.insertGoodsIntroduce(map);
	}
	
	public int deleteGoods(int godNum){
		return gaDao.deleteGoods(godNum);
	}
	
	public List<Goods> getGoods(Page page){
		return gaDao.getGoods(page);
	}
	
	public List<Goods> getGoodsSearch(Page page){
		return gaDao.getGoodsSearch(page);
	}
}
