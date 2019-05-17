package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class BoardCategoriesServiceImpl implements BoardCategoriesService{
	@Autowired private BoardCategoriesDao bd;
	
	public List<BoardCategories> getBC(int borNum){
		return bd.getBC(borNum);
	}
	
	public List<Board> getBoard(){
		return bd.getBoard();
	}
	
	public List<BoardCategories> getBorc(int borNum){
		return bd.getBorc(borNum);
	}
	
	public BoardCategories getExistBorc(@Param("borNum") int borNum,@Param("borcNum") int borcNum){
		return bd.getExistBorc(borNum, borcNum);
	}
	
	public int updatePosc(@Param("borNum") int borNum,@Param("borcNum") int borcNum){
		return bd.updatePosc(borNum, borcNum);
	}
	
	public int downPosc(@Param("borNum") int borNum,@Param("borcNum") int borcNum,@Param("currentBorcNum") int currentBorcNum){
		return bd.downPosc(borNum, borcNum,currentBorcNum);
	}
	
	public int updateBorc(BoardCategories borc){
		return bd.updateBorc(borc);
	}
	
	public int addBorc(BoardCategories borc){
		return bd.addBorc(borc);
	}
	
	public int deleteBorc(HashMap<String,List<Integer>> map){
		return bd.deleteBorc(map);
	}
}
