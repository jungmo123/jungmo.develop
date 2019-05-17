package jungmo.shoppingmall.user.join.service;

import java.util.*;

import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface JoinService {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	boolean overlapInjection(String userId); 
	List<Clause> getClauses();
	void addJoinPoint(String userId);
}
