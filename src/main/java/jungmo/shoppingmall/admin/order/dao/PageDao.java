package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.order.domain.Page;

public interface PageDao {
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
}
