package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.order.domain.Page;

public interface PageDao {
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
	int getCancelTotRowCnt(String type);
	int getCancelDateTotRowCnt(Page page);
	int getRefundTotRowCnt(String type);
	int getRefundDateTotRowCnt(Page page);
}
