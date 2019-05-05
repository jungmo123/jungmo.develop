package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface GoodsQuestionService {
	List<GoodsQuestion> getGodq(Page page);
	List<GoodsQuestion> getGodqSearch(Page page);
	int updateGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent);
	int updateGodq(@Param("godqNum") int godqNum,@Param("godqContent") String godqContent);
	int deleteGoda(int godqNum);
	int deleteGodq(int godqNum);
	void addGoda(@Param("godqNum") int godqNum,@Param("godaContent") String godaContent,@Param("userId") String userId);
}
