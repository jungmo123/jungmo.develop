package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;

public interface BoardCategoriesDao {
	List<BoardCategories> getBC(int borNum);
}
