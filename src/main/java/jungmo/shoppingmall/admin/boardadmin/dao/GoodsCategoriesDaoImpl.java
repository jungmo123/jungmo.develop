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
	
	public List<GoodsCategories> selectCategories(){
		return godcMapper.selectCategories();
	}
	
	public int addCategory(GoodsCategories gc){
		return godcMapper.addCategory(gc);
	}
	
	public int modifyCategory(GoodsCategories gc){
		return godcMapper.modifyCategory(gc);
	}
	
	public int deleteCategory(int godcNum){
		return godcMapper.deleteCategory(godcNum);
	}
}
