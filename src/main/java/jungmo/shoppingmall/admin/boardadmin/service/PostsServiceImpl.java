package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired private PostsDao posDao;
	
	public List<Posts> getPosts(Page page){
		return posDao.getPosts(page);
	}
	
	public void addNotice(Posts pos){
		posDao.addNotice(pos);
	}
	
	public 	Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category,@Param("searchType") int searchType,@Param("searchContent") String searchContent){
		return posDao.getPost(posNum,borNum,poscNum,category,searchType,searchContent);
	}
	
	public List<Posts> getSearchPost(Page page){
		return posDao.getSearchPost(page);
	}
	
	public void deletePosts(int posNum){
		posDao.deletePosts(posNum);
	}
	
	public void updatePosts(@Param("posNum") int posNum,@Param("posImportance") String posImportance,@Param("posTitle") String posTitle,@Param("posContent") String posContent){
		posDao.updatePosts(posNum, posImportance, posTitle, posContent);
	}
	
	public Posts getPos(int posNum){
		return posDao.getPos(posNum);
	}
	
	public void plusViewCnt(int posNum){
		posDao.plusViewCnt(posNum);
	}
}
