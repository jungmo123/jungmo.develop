package jungmo.shoppingmall.admin.goodsadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
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
	
	public int insertGoodsOption(HashMap<String,List<GoodsOption>> map){
		return gaMapper.insertGoodsOption(map);
	}
	
	public int insertGoodsIntroduce(HashMap<String,List<GoodsIntroduce>> map){
		return gaMapper.insertGoodsIntroduce(map);
	}
	
	public int deleteGoods(int godNum){
		return gaMapper.deleteGoods(godNum);
	}
	
	public List<Goods> getGoods(Page page){
		return gaMapper.getGoods(page);
	}
	
	public List<Goods> getGoodsSearch(Page page){
		return gaMapper.getGoodsSearch(page);
	}
}
