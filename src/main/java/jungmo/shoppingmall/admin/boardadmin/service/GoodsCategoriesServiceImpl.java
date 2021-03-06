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
	
	public List<GoodsCategories> selectCategories(){
		return godcDao.selectCategories();
	}
	
	public int addCategory(GoodsCategories gc){
		return godcDao.addCategory(gc);
	}
	
	public int modifyCategory(GoodsCategories gc){
		return godcDao.modifyCategory(gc);
	}
	
	public int deleteCategory(int godcNum){
		return godcDao.deleteCategory(godcNum);
	}
}
