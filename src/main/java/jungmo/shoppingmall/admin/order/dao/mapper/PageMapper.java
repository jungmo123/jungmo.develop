package jungmo.shoppingmall.admin.order.dao.mapper;

import jungmo.shoppingmall.admin.order.domain.Page;

public interface PageMapper {
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
}
