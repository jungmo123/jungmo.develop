package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;

public interface CommentService {
	List<Comment> getComments(int posNum);
	void updateComment(@Param("cmtNum") int cmtNum,@Param("cmtContent") String cmtContent);
	void deleteComment(int cmtNum);
	void addComment(@Param("posNum") int posNum,@Param("content") String content,@Param("userId") String userId);
}
