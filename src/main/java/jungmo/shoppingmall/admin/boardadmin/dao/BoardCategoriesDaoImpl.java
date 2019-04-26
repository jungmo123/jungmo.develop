package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.BoardCategoriesMapper;
import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardCategoriesDaoImpl implements BoardCategoriesDao{
	@Autowired private BoardCategoriesMapper bm;
	
	public List<BoardCategories> getBC(int borNum){
		return bm.getBC(borNum);
	}
}
