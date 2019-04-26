package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.BoardCategories;

public interface BoardCategoriesService {
	List<BoardCategories> getBC(int borNum);
}
