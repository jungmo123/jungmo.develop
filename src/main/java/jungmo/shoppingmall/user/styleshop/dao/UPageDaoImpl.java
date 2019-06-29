package jungmo.shoppingmall.user.styleshop.dao;

import jungmo.shoppingmall.user.styleshop.dao.mapper.*;
import jungmo.shoppingmall.user.styleshop.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class UPageDaoImpl implements UPageDao{
	@Autowired private UPageMapper pageMapper;
	
	public int getTotRowCnt(String godcNum){
		return pageMapper.getTotRowCnt(godcNum);
	}
	
	public int getGodrTotRowCnt(String godNum){
		return pageMapper.getGodrTotRowCnt(godNum);
	}
	
	public int getQnATotRowCnt(String godNum){
		return pageMapper.getQnATotRowCnt(godNum);
	}
	
	public int getPlTotRowCnt(String userId){
		return pageMapper.getPlTotRowCnt(userId);
	}
	
	public int getSearchPlTotRowCnt(Page page){
		return pageMapper.getSearchPlTotRowCnt(page);
	}
	
	public int getOtoqTotRowCnt(String userId){
		return pageMapper.getOtoqTotRowCnt(userId);
	}
	
	public int getSearchOtoqTotRowCnt(String otoqContent,String userId){
		return pageMapper.getSearchOtoqTotRowCnt(otoqContent, userId);
	}
	
	public int getMGodrTotRowCnt(String userId){
		return pageMapper.getMGodrTotRowCnt(userId);
	}
}
