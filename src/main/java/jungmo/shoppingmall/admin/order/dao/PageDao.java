package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface PageDao {
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
	int getCancelTotRowCnt(String type);
	int getCancelDateTotRowCnt(Page page);
	int getRefundTotRowCnt(String type);
	int getRefundDateTotRowCnt(Page page);
	int getExchangeTotRowCnt(String type);
	int getExchangeDateTotRowCnt(Page page);
	int getBoardTotRowCnt(@Param("borNum") int borNum,@Param("poscNum") int poscNum);
	int getBoardSearchTotRowCnt(@Param("borNum") int borNum,
			@Param("poscNum") int poscNum,@Param("searchType") int searchType,@Param("searchContent") String searchContent);
	int getGodqTotRowCnt();
	int getGodqSearchTotRowCnt(@Param("godqType") String godqType,@Param("godqContent") String godqContent);
	int getOtoqTotRowCnt();
	int getOtoqSearchTotRowCnt(@Param("otoqType") String otoqType,@Param("otoqContent") String otoqContent);
	int getGodrTotRowCnt();
	int getGodrSearchTotRowCnt(@Param("godcNum") int godcNum,@Param("godrContent") String godrContent);
	int getEventTotRowCnt();
	int getEventSearchTotRowCnt(String eventContent);
	int getBorcTotRowCnt(int borNum);
	int getUserTotRowCnt();
}
