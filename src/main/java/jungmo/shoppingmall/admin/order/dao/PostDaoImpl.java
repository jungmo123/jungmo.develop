package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired private PostMapper postMapper;
	
	public List<Post> getPosts(Page page){
		return postMapper.getPosts(page);
	}
	
	public List<Post> getDatePosts(Page page){
		return postMapper.getDatePosts(page);
	}
	
	public List<Post> getCancelPosts(Page page){
		return postMapper.getCancelPosts(page);
	}
	
	public List<Post> getCancelDatePosts(Page page){
		return postMapper.getCancelDatePosts(page);
	}
	
	public List<Post> getRefundPosts(Page page){
		return postMapper.getRefundPosts(page);
	}
	
	public List<Post> getRefundDatePosts(Page page){
		return postMapper.getRefundDatePosts(page);
	}
	
	public List<Post> getExchangePosts(Page page){
		return postMapper.getExchangePosts(page);
	}
	
	public List<Post> getExchangeDatePosts(Page page){
		return postMapper.getExchangeDatePosts(page);
	}
}
