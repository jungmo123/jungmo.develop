package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PageDaoImpl implements PageDao{
	@Autowired PageMapper pageMapper;
	
	public int getTotRowCnt(String type){
		return pageMapper.getTotRowCnt(type);
	}
	
	public int getDateTotRowCnt(Page page){
		return pageMapper.getDateTotRowCnt(page);
	}
	
	public int getCancelTotRowCnt(String type){
		return pageMapper.getCancelTotRowCnt(type);
	}
	
	public int getCancelDateTotRowCnt(Page page){
		return pageMapper.getCancelDateTotRowCnt(page);
	}
	
	public int getRefundTotRowCnt(String type){
		return pageMapper.getRefundTotRowCnt(type);
	}
	
	public int getRefundDateTotRowCnt(Page page){
		return pageMapper.getRefundDateTotRowCnt(page);
	}
	
	public int getExchangeTotRowCnt(String type){
		return pageMapper.getExchangeTotRowCnt(type);
	}
	
	public int getExchangeDateTotRowCnt(Page page){
		return pageMapper.getExchangeDateTotRowCnt(page);
	}
	
	public int getBoardTotRowCnt(@Param("borNum") int borNum,@Param("poscNum") int poscNum){
		return pageMapper.getBoardTotRowCnt(borNum, poscNum);
	}
	
	public int getBoardSearchTotRowCnt(@Param("borNum") int borNum,
			@Param("poscNum") int poscNum,@Param("searchType") int searchType,@Param("searchContent") String searchContent){
		return pageMapper.getBoardSearchTotRowCnt(borNum, poscNum, searchType, searchContent);
	}
	
	public int getGodqTotRowCnt(){
		return pageMapper.getGodqTotRowCnt();
	}
	
	public int getGodqSearchTotRowCnt(@Param("godqType") String godqType,@Param("godqContent") String godqContent){
		return pageMapper.getGodqSearchTotRowCnt(godqType, godqContent);
	}
	
	public int getOtoqTotRowCnt(){
		return pageMapper.getOtoqTotRowCnt();
	}
	
	public int getOtoqSearchTotRowCnt(@Param("otoqType") String otoqType,@Param("otoqContent") String otoqContent){
		return pageMapper.getOtoqSearchTotRowCnt(otoqType, otoqContent);
	}
	
	public int getGodrTotRowCnt(){
		return pageMapper.getGodrTotRowCnt();
	}
	
	public int getGodrSearchTotRowCnt(@Param("godcNum") int godcNum,@Param("godrContent") String godrContent){
		return pageMapper.getGodrSearchTotRowCnt(godcNum, godrContent);
	}
	
	public int getEventTotRowCnt(){
		return pageMapper.getEventTotRowCnt();
	}
	
	public int getEventSearchTotRowCnt(String eventContent){
		return pageMapper.getEventSearchTotRowCnt(eventContent);
	}
	
	public int getBorcTotRowCnt(int borNum){
		return pageMapper.getBorcTotRowCnt(borNum);
	}
	
	public int getUserTotRowCnt(String userState){
		return pageMapper.getUserTotRowCnt(userState);
	}
	
	public int getUserSearchTotRowCnt(UserSearch us){
		return pageMapper.getUserSearchTotRowCnt(us);
	}
	
	public int getLeaveUserSearchTotRowCnt(UserSearch us){
		return pageMapper.getLeaveUserSearchTotRowCnt(us);
	}
	
	public int getGoodsTotRowCnt(){
		return pageMapper.getGoodsTotRowCnt();
	}
	
	public int getGoodsSearchTotRowCnt(GoodsSearch gs){
		return pageMapper.getGoodsSearchTotRowCnt(gs);
	}
}