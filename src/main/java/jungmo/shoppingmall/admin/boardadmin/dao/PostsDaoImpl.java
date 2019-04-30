package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PostsDaoImpl implements PostsDao{
	@Autowired private PostsMapper posMapper;
	
	public List<Posts> getPosts(Page page){
		return posMapper.getPosts(page);
	}
	
	public void addNotice(Posts pos){
		posMapper.addNotice(pos);
	}
	
	public Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category,@Param("searchType") int searchType,@Param("searchContent") String searchContent){
		return posMapper.getPost(posNum,borNum,poscNum,category,searchType,searchContent);
	}
	
	public List<Posts> getSearchPost(Page page){
		return posMapper.getSearchPost(page);
	}
	
	public void deletePosts(int posNum){
		posMapper.deletePosts(posNum);
	}
	
	public void updatePosts(@Param("posNum") int posNum,@Param("posImportance") String posImportance,@Param("posTitle") String posTitle,@Param("posContent") String posContent){
		posMapper.updatePosts(posNum, posImportance, posTitle, posContent);
	}
	
	public Posts getPos(int posNum){
		return posMapper.getPos(posNum);
	}
	
	public void plusViewCnt(int posNum){
		posMapper.plusViewCnt(posNum);
	}
}
