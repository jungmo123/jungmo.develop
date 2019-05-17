package jungmo.shoppingmall.user.join.dao;

import java.util.*;

import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface JoinDao {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	Overlap overlapInjection(String userId); 
	List<Clause> getClauses();
	void addJoinPoint(String userId);
}
