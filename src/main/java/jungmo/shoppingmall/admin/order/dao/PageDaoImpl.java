package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PageDaoImpl implements PageDao{
	@Autowired PageMapper pageMapper;
	
	public int getTotRowCnt(String type){
		return pageMapper.getTotRowCnt(type);
	}
	
	public int getDateTotRowCnt(Page page){
		return pageMapper.getDateTotRowCnt(page);
	}
	
	public int getCancelTotRowCnt(String type){
		return pageMapper.getCancelTotRowCnt(type);
	}
	
	public int getCancelDateTotRowCnt(Page page){
		return pageMapper.getCancelDateTotRowCnt(page);
	}
	
	public int getRefundTotRowCnt(String type){
		return pageMapper.getRefundTotRowCnt(type);
	}
	
	public int getRefundDateTotRowCnt(Page page){
		return pageMapper.getRefundDateTotRowCnt(page);
	}
	
	public int getExchangeTotRowCnt(String type){
		return pageMapper.getExchangeTotRowCnt(type);
	}
	
	public int getExchangeDateTotRowCnt(Page page){
		return pageMapper.getExchangeDateTotRowCnt(page);
	}
}