package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.BoardCategoriesDao;
import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardCategoriesServiceImpl implements BoardCategoriesService{
	@Autowired private BoardCategoriesDao bd;
	
	public List<BoardCategories> getBC(int borNum){
		return bd.getBC(borNum);
	}
}
