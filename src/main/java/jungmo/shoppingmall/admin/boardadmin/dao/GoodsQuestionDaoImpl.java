package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsQuestionDaoImpl implements GoodsQuestionDao{
	@Autowired private GoodsQuestionMapper godqMapper;
	
	public List<GoodsQuestion> getGodq(){
		return godqMapper.getGodq();
	}
}
