package jungmo.shoppingmall.user.main.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.user.main.dao.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class MainServiceImpl implements MainService{
	@Autowired private MainDao mainDao;
	
	public List<Goods> getCategoryGoods(String godcNum){
		return mainDao.getCategoryGoods(godcNum);
	}
	
	public List<Goods> getCategory(){
		return mainDao.getCategory();
	}
	
	public List<Goods> getLatelyGoods(){
		return mainDao.getLatelyGoods();
	}
}
