package jungmo.shoppingmall.admin.order.service;

import java.util.List;

import jungmo.shoppingmall.admin.order.dao.PostDao;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService{
	@Autowired private PostDao postDao;
	
	public List<Post> getPosts(Page page){
		return postDao.getPosts(page);
	}
	
	public List<Post> getDatePosts(Page page){
		return postDao.getDatePosts(page);
	}
}
