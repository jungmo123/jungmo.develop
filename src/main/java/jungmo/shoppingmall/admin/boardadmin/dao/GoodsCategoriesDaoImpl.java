package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsCategoriesDaoImpl implements GoodsCategoriesDao{
	@Autowired private GoodsCategoriesMapper godcMapper;
	
	public List<GoodsCategories> getCategories(){
		return godcMapper.getCategories();
	}
	
	public int newCategory(@Param("content") String content,@Param("godcNum") String godcNum){
		return godcMapper.newCategory(content, godcNum);
	}
	
	public GoodsCategories getCategory(String godcNum){
		return godcMapper.getCategory(godcNum);
	}
}
