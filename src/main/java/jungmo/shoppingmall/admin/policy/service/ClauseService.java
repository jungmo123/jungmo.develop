package jungmo.shoppingmall.admin.policy.service;

import java.util.*;

import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.user.join.domain.*;

import org.springframework.web.multipart.*;

public interface ClauseService{
	void insertClause(Clause cls);
	void updateClause(Clause cls);
	void deleteClause(HashMap<String,List<Integer>> map);
	DeliveryPolicy getDeliveryPolicy();
	List<NoDeliveryArea> getNoDeliveryArea();
	PointPolicy getPointPolicy();
	CommonPolicy getCommonPolicy();
	void insertNda(HashMap<String,List<NoDeliveryArea>> map);
	void deleteNda();
	String modifyPolicy(MultipartHttpServletRequest request,ClauseService clsService);
	void updateDp(DeliveryPolicy dp);
	void updatePp(PointPolicy pp);
	public void updateCp(CommonPolicy cp);
}
