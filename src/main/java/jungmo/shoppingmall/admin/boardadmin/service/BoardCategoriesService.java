package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

public interface BoardCategoriesService {
	List<BoardCategories> getBC(int borNum);
	List<Board> getBoard();
	List<BoardCategories> getBorc(int borNum);
}
