package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsCategoriesServiceImpl implements GoodsCategoriesService{
	@Autowired private GoodsCategoriesDao godcDao;
	
	public List<GoodsCategories> getCategories(){
		return godcDao.getCategories();
	}
	
	public int newCategory(@Param("content") String content,@Param("godcNum") String godcNum){
		return godcDao.newCategory(content, godcNum);
	}
	
	public GoodsCategories getCategory(String godcNum){
		return godcDao.getCategory(godcNum);
	}
}
