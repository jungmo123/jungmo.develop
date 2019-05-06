package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

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
}
