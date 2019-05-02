package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;

public interface CommentMapper {
	List<Comment> getComments(int posNum);
	void updateComment(@Param("cmtNum") int cmtNum,@Param("cmtContent") String cmtContent);
	void deleteComment(int cmtNum);
	void addComment(@Param("posNum") int posNum,@Param("content") String content,@Param("userId") String userId);
}
