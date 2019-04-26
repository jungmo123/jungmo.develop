package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;

public interface BoardCategoriesMapper {
	List<BoardCategories> getBC(int borNum);
}
