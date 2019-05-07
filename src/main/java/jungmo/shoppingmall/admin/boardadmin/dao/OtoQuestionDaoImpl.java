package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class OtoQuestionDaoImpl implements OtoQuestionDao{
	@Autowired private OneTwoOneMapper otoMapper;
	
	
	public List<OtoQuestion> getOtoq(Page page){
		return otoMapper.getOtoq(page);
	}
	
	public List<OtoQuestion> getOtoqSearch(Page page){
		return otoMapper.getOtoqSearch(page);
	}
	
	public OtoQuestion getOto(int otoqNum){
		return otoMapper.getOto(otoqNum);
	}
	
	public int addOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent,@Param("userId") String userId){
		return otoMapper.addOtoa(otoqNum, otoaContent, userId);
	}
	
	public int updateOtoq(@Param("otoqNum") int otoqNum,@Param("otoqContent") String otoqContent){
		return otoMapper.updateOtoq(otoqNum, otoqContent);
	}
	
	public int updateOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent){
		return otoMapper.updateOtoa(otoqNum, otoaContent);
	}
}
