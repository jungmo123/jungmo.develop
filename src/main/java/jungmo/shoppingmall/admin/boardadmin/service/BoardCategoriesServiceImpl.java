package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

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
}
