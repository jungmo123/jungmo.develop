package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

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
}
