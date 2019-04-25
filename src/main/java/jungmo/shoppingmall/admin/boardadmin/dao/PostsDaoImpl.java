package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.PostsMapper;
import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.order.domain.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostsDaoImpl implements PostsDao{
	@Autowired private PostsMapper posMapper;
	
	public List<Posts> getPosts(Page page){
		return posMapper.getPosts(page);
	}
}
