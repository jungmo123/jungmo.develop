package jungmo.shoppingmall.admin.order.dao;

import jungmo.shoppingmall.admin.order.dao.mapper.PageMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PageDaoImpl implements PageDao{
	@Autowired PageMapper pageMapper;
	
	public int getTotRowCnt(){
		return pageMapper.getTotRowCnt();
	}
}
