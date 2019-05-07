package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class OtoQuestionServiceImpl implements OtoQuestionService{
	@Autowired private OtoQuestionDao otoDao;
	
	public List<OtoQuestion> getOtoq(Page page){
		return otoDao.getOtoq(page);
	}
	
	public List<OtoQuestion> getOtoqSearch(Page page){
		return otoDao.getOtoqSearch(page);
	}
	
	public OtoQuestion getOto(int otoqNum){
		return otoDao.getOto(otoqNum);
	}
	
	public int addOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent,@Param("userId") String userId){
		return otoDao.addOtoa(otoqNum, otoaContent, userId);
	}
	
	public int updateOtoq(@Param("otoqNum") int otoqNum,@Param("otoqContent") String otoqContent){
		return otoDao.updateOtoq(otoqNum, otoqContent);
	}
	
	public int updateOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent){
		return otoDao.updateOtoa(otoqNum, otoaContent);
	}
}
