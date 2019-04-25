package jungmo.shoppingmall.admin.order.dao.mapper;

import jungmo.shoppingmall.admin.order.domain.Page;

import org.apache.ibatis.annotations.Param;

public interface PageMapper {
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
	int getCancelTotRowCnt(String type);
	int getCancelDateTotRowCnt(Page page);
	int getRefundTotRowCnt(String type);
	int getRefundDateTotRowCnt(Page page);
	int getExchangeTotRowCnt(String type);
	int getExchangeDateTotRowCnt(Page page);
	int getBoardTotRowCnt(@Param("borNum") int borNum,@Param("poscNum") int poscNum);
}
