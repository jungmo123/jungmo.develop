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
	
	public Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category){
		return posDao.getPost(posNum,borNum,poscNum,category);
	}
}
