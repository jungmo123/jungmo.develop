package jungmo.shoppingmall.user.styleshop.dao.mapper;

import org.apache.ibatis.annotations.*;

import jungmo.shoppingmall.user.styleshop.domain.*;

public interface UPageMapper {
	int getTotRowCnt(String godcNum);
	int getGodrTotRowCnt(String godNum);
	int getQnATotRowCnt(String godNum);
	int getPlTotRowCnt(String userId);
	int getSearchPlTotRowCnt(Page page);
	int getOtoqTotRowCnt(String userId);
	int getSearchOtoqTotRowCnt(@Param("otoqContent") String otoqContent,@Param("userId") String userId);
	int getMGodrTotRowCnt(String userId);
}
