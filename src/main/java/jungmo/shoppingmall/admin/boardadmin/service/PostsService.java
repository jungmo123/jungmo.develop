package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface PostsService {
	List<Posts> getPosts(Page page);
	void addNotice(Posts pos);
	Posts getPost(@Param("posNum") int posNum,@Param("borNum") int borNum,@Param("poscNum") int poscNum,@Param("category") int category,@Param("searchType") int searchType,@Param("searchContent") String searchContent);
	List<Posts> getSearchPost(Page page);
	void deletePosts(int posNum);
	void updatePosts(@Param("posNum") int posNum,@Param("posImportance") String posImportance,@Param("posTitle") String posTitle,@Param("posContent") String posContent);
	Posts getPos(int posNum);
	void plusViewCnt(int posNum);
}
