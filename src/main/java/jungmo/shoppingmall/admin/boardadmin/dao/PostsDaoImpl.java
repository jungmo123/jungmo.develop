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
	
	public Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category){
		return posMapper.getPost(posNum,borNum,poscNum,category);
	}
}
