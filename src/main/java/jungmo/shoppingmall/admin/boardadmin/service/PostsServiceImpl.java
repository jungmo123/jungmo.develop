package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.PostsDao;
import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.order.domain.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired private PostsDao posDao;
	
	public List<Posts> getPosts(Page page){
		return posDao.getPosts(page);
	}
	
	public void addNotice(Posts pos){
		posDao.addNotice(pos);
	}
}
