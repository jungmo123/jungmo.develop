package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class BoardCategoriesDaoImpl implements BoardCategoriesDao{
	@Autowired private BoardCategoriesMapper bm;
	
	public List<BoardCategories> getBC(int borNum){
		return bm.getBC(borNum);
	}
	
	public List<Board> getBoard(){
		return bm.getBoard();
	}
	
	public List<BoardCategories> getBorc(int borNum){
		return bm.getBorc(borNum);
	}
	
	public BoardCategories getExistBorc(@Param("borNum") int borNum,@Param("borcNum") int borcNum){
		return bm.getExistBorc(borNum, borcNum);
	}
	
	public int updatePosc(@Param("borNum") int borNum,@Param("borcNum") int borcNum){
		return bm.updatePosc(borNum, borcNum);
	}
	
	public int downPosc(@Param("borNum") int borNum,@Param("borcNum") int borcNum,@Param("currentBorcNum") int currentBorcNum){
		return bm.downPosc(borNum, borcNum,currentBorcNum);
	}
	
	public int updateBorc(BoardCategories borc){
		return bm.updateBorc(borc);
	}
	
	public int addBorc(BoardCategories borc){
		return bm.addBorc(borc);
	}
	
	public int deleteBorc(HashMap<String,List<Integer>> map){
		return bm.deleteBorc(map);
	}
}
