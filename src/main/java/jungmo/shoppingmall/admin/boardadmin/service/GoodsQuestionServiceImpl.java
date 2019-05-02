package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsQuestionServiceImpl implements GoodsQuestionService{
	@Autowired private GoodsQuestionDao godqDao;
	
	public List<GoodsQuestion> getGodq(){
		return godqDao.getGodq();
	}
}
