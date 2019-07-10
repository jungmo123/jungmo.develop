package jungmo.shoppingmall.admin.goodsadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.apache.ibatis.annotations.*;
import org.springframework.web.multipart.*;

public interface GoodsAdminService {
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
	String addGoods(MultipartHttpServletRequest request,GoodsAdminService gaService);
	String modifyGoods(MultipartHttpServletRequest request,GoodsAdminService gaService,OrderService orderService,String ListImageUrl,String MainImageUrl,String repreImageUrl1,String repreImageUrl2,String repreImageUrl3,String repreImageUrl4);
	Goods getGodName(String godName);
}
