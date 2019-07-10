package jungmo.shoppingmall.admin.goodsadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface GoodsAdminDao {
	int insertGoods(Goods god);
	int insertGoodsSub(HashMap<String,List<String>> map);
	int insertGoodsOption(HashMap<String,List<GoodsOption>> map);
	int insertGoodsIntroduce(HashMap<String,List<GoodsIntroduce>> map);
	int deleteGoods(int godNum);
	List<Goods> getGoods(Page page);
	List<Goods> getGoodsSearch(Page page);
	Goods selectGoods(int godNum);
	List<GoodsOption> selectGodcList(int godNum);
	List<GoodsOption> selectGodc(@Param("godNum") String godNum,@Param("optName") String optName);
	List<GoodsOption> selectGodo(String godNum);
	List<GoodsIntroduce> selectGodI(int godNum);
	List<GoodsSubImage>selectSubImg(int godNum);
	int deleteGoodsSub(int godNum);
	int removeGoodsSub(@Param("godNum") String godNum,@Param("imgNum") String imgNum);
	int deleteGoodsOption(int godNum);
	int deleteGoodsIntroduce(int godNum);
	int updateGoods(Goods god);
	int removeGoods(HashMap<String,List<String>> map);
	int insertGml(@Param("godNum") String godNum,@Param("gmlContent") String gmlContent,@Param("userId") String userId);
	List<GoodsManageLog> selectGml(String godNum);
	Goods getGodDetail(String godNum);
	Goods getGodName(String godName);
}
