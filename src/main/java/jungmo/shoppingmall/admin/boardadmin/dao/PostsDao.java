package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface PostsDao {
	public List<Posts> getPosts(Page page);
	void addNotice(Posts pos);
	Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("searchContent") int category,@Param("searchType") int searchType,@Param("content") String searchContent);
	List<Posts> getSearchPost(Page page);
	Posts getPos(int posNum);
	void deletePosts(int posNum);
	void updatePosts(@Param("posNum") int posNum,@Param("posImportance") String posImportance,@Param("posTitle") String posTitle,@Param("posContent") String posContent);
	void plusViewCnt(int posNum);
}
