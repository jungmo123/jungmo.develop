package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;

public interface OtoQuestionDao {
	List<OtoQuestion> getOtoq(Page page);
	List<OtoQuestion> getOtoqSearch(Page page);
	OtoQuestion getOto(int otoqNum);
	int addOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent,@Param("userId") String userId);
	int updateOtoq(@Param("otoqNum") int otoqNum,@Param("otoqContent") String otoqContent);
	int updateOtoa(@Param("otoqNum") int otoqNum,@Param("otoaContent") String otoaContent);
}
