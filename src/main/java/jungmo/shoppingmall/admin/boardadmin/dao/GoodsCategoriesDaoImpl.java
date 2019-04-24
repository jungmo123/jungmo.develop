package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.GoodsCategoriesMapper;
import jungmo.shoppingmall.admin.boardadmin.domain.GoodsCategories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsCategoriesDaoImpl implements GoodsCategoriesDao{
	@Autowired private GoodsCategoriesMapper godcMapper;
	
	public List<GoodsCategories> getCategories(){
		return godcMapper.getCategories();
	}
}
