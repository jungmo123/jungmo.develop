package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.order.domain.Page;

public interface PostsDao {
	public List<Posts> getPosts(Page page);
	void addNotice(Posts pos);
}
