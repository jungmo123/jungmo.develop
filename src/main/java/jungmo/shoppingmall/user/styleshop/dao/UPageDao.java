package jungmo.shoppingmall.user.styleshop.dao;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.user.styleshop.domain.*;

public interface UPageDao {
	int getTotRowCnt(String godcNum);
	int getGodrTotRowCnt(String godNum);
	int getQnATotRowCnt(String godNum);
	int getPlTotRowCnt(String userId);
	int getSearchPlTotRowCnt(Page page);
	int getOtoqTotRowCnt(String userId);
	int getSearchOtoqTotRowCnt(String otoqContent,String userId);
	int getMGodrTotRowCnt(String userId);
	int getMGodrSearchTotRowCnt(String userId,String godcNum,String godrContent);
	int getMGodqTotRowCnt(String userId);
	int getMGodqSearchTotRowCnt(String userId,String godqType,String godqContent);
	int getGodTotRowCnt(String Search);
	int getSGodrTotRowCnt(String Search);
	int getSPostsTotRowCnt(String Search);
}
