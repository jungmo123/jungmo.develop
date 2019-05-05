package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsQuestionDaoImpl implements GoodsQuestionDao{
	@Autowired private GoodsQuestionMapper godqMapper;
	
	public List<GoodsQuestion> getGodq(Page page){
		return godqMapper.getGodq(page);
	}
	
	public List<GoodsQuestion> getGodqSearch(Page page){
		return godqMapper.getGodqSearch(page);
	}
	
	public int updateGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent){
		return godqMapper.updateGoda(godqNum,godaContent);
	}
	
	public int updateGodq(@Param("godqNum") int godqNum,@Param("godqContent") String godqContent){
		return godqMapper.updateGodq(godqNum, godqContent);
	}
	
	public int deleteGoda(int godqNum){
		return godqMapper.deleteGoda(godqNum);
	}
	
	public int deleteGodq(int godqNum){
		return godqMapper.deleteGodq(godqNum);
	}
	
	public void addGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent,@Param("userId") String userId){
		godqMapper.addGoda(godqNum, godaContent, userId);
	}
}
