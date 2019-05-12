package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;

public interface BoardCategoriesDao {
	List<BoardCategories> getBC(int borNum);
	List<Board> getBoard();
	List<BoardCategories> getBorc(int borNum);
	BoardCategories getExistBorc(@Param("borNum") int borNum,@Param("borcNum") int borcNum);
	int updatePosc(@Param("borNum") int borNum,@Param("borcNum") int borcNum);
	int updateBorc(BoardCategories borc);
	int addBorc(BoardCategories borc);
	int deleteBorc(HashMap<String,List<Integer>> map);
}
