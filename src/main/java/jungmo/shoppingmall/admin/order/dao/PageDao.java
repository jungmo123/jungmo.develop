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
}
