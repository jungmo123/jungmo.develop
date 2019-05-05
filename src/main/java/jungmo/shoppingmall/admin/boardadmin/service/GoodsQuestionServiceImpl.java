package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsQuestionServiceImpl implements GoodsQuestionService{
	@Autowired private GoodsQuestionDao godqDao;
	
	public List<GoodsQuestion> getGodq(Page page){
		return godqDao.getGodq(page);
	}
	
	public List<GoodsQuestion> getGodqSearch(Page page){
		return godqDao.getGodqSearch(page);
	}
	
	public int updateGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent){
		return godqDao.updateGoda(godqNum, godaContent);
	}
	
	public int updateGodq(@Param("godqNum") int godqNum,@Param("godqContent") String godqContent){
		return godqDao.updateGodq(godqNum, godqContent);
	}
	
	public int deleteGoda(int godqNum){
		return godqDao.deleteGoda(godqNum);
	}
	
	public int deleteGodq(int godqNum){
		return godqDao.deleteGodq(godqNum);
	}
	
	public void addGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent,@Param("userId") String userId){
		godqDao.addGoda(godqNum, godaContent, userId);
	}
}
