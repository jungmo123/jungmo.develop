package jungmo.shoppingmall.user.main.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.main.dao.mapper.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class MainDaoImpl implements MainDao{
	@Autowired private MainMapper mainMapper;
	
	public List<Goods> getCategoryGoods(String godcNum){
		return mainMapper.getCategoryGoods(godcNum);
	}
	
	public List<Goods> getCategory(){
		return mainMapper.getCategory();
	}
	
	public List<Goods> getLatelyGoods(){
		return mainMapper.getLatelyGoods();
	}
}
