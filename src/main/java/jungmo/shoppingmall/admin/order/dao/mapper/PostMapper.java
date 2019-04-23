package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Post;

public interface PostMapper {
	List<Post> getPosts(Page page);
	List<Post> getDatePosts(Page page);
	List<Post> getCancelPosts(Page page);
	List<Post> getCancelDatePosts(Page page);
	List<Post> getRefundPosts(Page page);
	List<Post> getRefundDatePosts(Page page);
}
