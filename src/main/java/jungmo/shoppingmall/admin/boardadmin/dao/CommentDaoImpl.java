package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired private CommentMapper commentMapper;
	
	public List<Comment> getComments(int posNum){
		return commentMapper.getComments(posNum);
	}
	
	public void updateComment(@Param("cmtNum") int cmtNum,@Param("cmtContent") String cmtContent){
		commentMapper.updateComment(cmtNum, cmtContent);
	}
}
