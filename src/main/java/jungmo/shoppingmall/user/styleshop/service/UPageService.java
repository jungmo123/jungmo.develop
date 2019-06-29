package jungmo.shoppingmall.user.styleshop.service;

import jungmo.shoppingmall.user.styleshop.domain.*;

public interface UPageService {
	int getTotRowCnt(String godcNum);
	int getGodrTotRowCnt(String godNum);
	int getQnATotRowCnt(String godNum);
	int getPlTotRowCnt(String userId);
	int getSearchPlTotRowCnt(Page page);
	int getOtoqTotRowCnt(String userId);
	int getSearchOtoqTotRowCnt(String otoqContent,String userId);
	int getMGodrTotRowCnt(String userId);
}
