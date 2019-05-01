package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;

public interface CommentDao {
	List<Comment> getComments(int posNum);
	void updateComment(@Param("cmtNum") int cmtNum,@Param("cmtContent") String cmtContent);
}
