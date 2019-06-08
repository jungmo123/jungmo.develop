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
	
	public Goods selectGoods(int godNum){
		return gaDao.selectGoods(godNum);
	}
	
	public List<GoodsOption> selectGodcList(int godNum){
		return gaDao.selectGodcList(godNum);
	}
	
	public List<GoodsOption> selectGodc(String godNum,String optName){
		return gaDao.selectGodc(godNum, optName);
	}
	
	public List<GoodsOption> selectGodo(String godNum){
		return gaDao.selectGodo(godNum);
	}
	
	public List<GoodsIntroduce> selectGodI(int godNum){
		return gaDao.selectGodI(godNum);
	}
	
	public List<GoodsSubImage>selectSubImg(int godNum){
		return gaDao.selectSubImg(godNum);
	}
	
	public int deleteGoodsSub(int godNum){
		return gaDao.deleteGoodsSub(godNum);
	}
	
	public int removeGoodsSub(String godNum,String imgNum){
		return gaDao.removeGoodsSub(godNum, imgNum);
	}
	
	public int deleteGoodsOption(int godNum){
		return gaDao.deleteGoodsOption(godNum);
	}
	
	public int deleteGoodsIntroduce(int godNum){
		return gaDao.deleteGoodsIntroduce(godNum);
	}
	
	public int updateGoods(Goods god){
		return gaDao.updateGoods(god);
	}
	
	public int removeGoods(HashMap<String,List<String>> map){
		return gaDao.removeGoods(map);
	}
	
	public int insertGml(String godNum,String gmlContent,String userId){
		return gaDao.insertGml(godNum, gmlContent, userId);
	}
	
	public List<GoodsManageLog> selectGml(String godNum){
		return gaDao.selectGml(godNum);
	}
}
