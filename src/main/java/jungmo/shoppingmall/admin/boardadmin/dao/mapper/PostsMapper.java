package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface PostsMapper {
	List<Posts> getPosts(Page page);
	void addNotice(Posts pos);
	Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category);
}
