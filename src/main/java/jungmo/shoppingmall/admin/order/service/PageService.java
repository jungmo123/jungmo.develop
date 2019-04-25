package jungmo.shoppingmall.admin.order.service;

import org.apache.ibatis.annotations.Param;

import jungmo.shoppingmall.admin.order.domain.*;

public interface PageService {
	Page getPage();
	boolean isPrev();
	boolean isNext();
	int getStartPage();
	int getEndPage();
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
