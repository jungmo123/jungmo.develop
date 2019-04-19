package jungmo.shoppingmall.admin.order.service;

import jungmo.shoppingmall.admin.order.domain.Page;

public interface PageService {
	Page getPage();
	boolean isPrev();
	boolean isNext();
	int getStartPage();
	int getEndPage();
	int getTotRowCnt(String type);
	int getDateTotRowCnt(Page page);
}
