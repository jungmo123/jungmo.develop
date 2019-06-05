package jungmo.shoppingmall.user.styleshop.dao;

import jungmo.shoppingmall.user.styleshop.dao.mapper.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class UPageDaoImpl implements UPageDao{
	@Autowired private UPageMapper pageMapper;
	
	public int getTotRowCnt(String godcNum){
		return pageMapper.getTotRowCnt(godcNum);
	}
}
