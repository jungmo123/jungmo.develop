package jungmo.shoppingmall.admin.goodsadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface GoodsAdminMapper {
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
	List<GoodsIntroduce> selectGodI(int godNum);
	List<GoodsSubImage>selectSubImg(int godNum);
}
