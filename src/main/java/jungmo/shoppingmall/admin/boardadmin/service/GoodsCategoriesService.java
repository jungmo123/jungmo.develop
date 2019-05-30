package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

import org.apache.ibatis.annotations.*;

public interface GoodsCategoriesService {
	List<GoodsCategories> getCategories();
	int newCategory(@Param("content") String content,@Param("godcNum") String godcNum);
	GoodsCategories getCategory(String godcNum);
	List<GoodsCategories> selectCategories();
	int addCategory(GoodsCategories gc);
	int modifyCategory(GoodsCategories gc);
	int deleteCategory(int godcNum);
}
