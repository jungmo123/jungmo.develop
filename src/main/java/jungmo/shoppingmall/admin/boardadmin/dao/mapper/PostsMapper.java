package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.order.domain.Page;

public interface PostsMapper {
	List<Posts> getPosts(Page page);
}
