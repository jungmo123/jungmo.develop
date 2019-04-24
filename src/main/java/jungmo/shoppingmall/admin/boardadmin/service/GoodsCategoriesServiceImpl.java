package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.GoodsCategoriesDao;
import jungmo.shoppingmall.admin.boardadmin.domain.GoodsCategories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsCategoriesServiceImpl implements GoodsCategoriesService{
	@Autowired private GoodsCategoriesDao godcDao;
	
	public List<GoodsCategories> getCategories(){
		return godcDao.getCategories();
	}
}
