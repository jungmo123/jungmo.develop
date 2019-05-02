package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;
	
	public List<Comment> getComments(int posNum){
		return commentDao.getComments(posNum);
	}
	
	public void updateComment(@Param("cmtNum") int cmtNum,@Param("cmtContent") String cmtContent){
		commentDao.updateComment(cmtNum, cmtContent);
	}
	
	public void deleteComment(int cmtNum){
		commentDao.deleteComment(cmtNum);
	}
	
	public void addComment(@Param("posNum") int posNum,@Param("content") String content,@Param("userId") String userId){
		commentDao.addComment(posNum, content, userId);
	}
}
