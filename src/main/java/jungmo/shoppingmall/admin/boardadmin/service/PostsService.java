package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.List;

import jungmo.shoppingmall.admin.boardadmin.domain.Posts;
import jungmo.shoppingmall.admin.order.domain.Page;

public interface PostsService {
	List<Posts> getPosts(Page page);
	void addNotice(Posts pos);
}
