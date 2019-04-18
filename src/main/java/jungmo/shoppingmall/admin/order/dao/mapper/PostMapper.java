package jungmo.shoppingmall.admin.order.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.order.domain.Post;

public interface PostMapper {
	List<Post> getPosts(Page page);
}
