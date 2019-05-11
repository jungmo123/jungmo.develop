package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

public interface BoardCategoriesMapper {
	List<BoardCategories> getBC(int borNum);
	List<Board> getBoard();
	List<BoardCategories> getBorc(int borNum);
}
