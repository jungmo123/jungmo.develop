package jungmo.shoppingmall.admin.order.dao;

import java.util.List;

import jungmo.shoppingmall.admin.order.dao.mapper.PostMapper;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired private PostMapper postMapper;
	
	public List<Post> getPosts(Page page){
		return postMapper.getPosts(page);
	}
	
	public List<Post> getDatePosts(Page page){
		return postMapper.getDatePosts(page);
	}
}
