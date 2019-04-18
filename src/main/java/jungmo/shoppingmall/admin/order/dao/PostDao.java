package jungmo.shoppingmall.admin.order.dao;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Post;

public interface PostDao {
	List<Post> getPosts(Page page);
}
