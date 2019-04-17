package jungmo.shoppingmall.user.join.service;

import java.util.List;

import jungmo.shoppingmall.user.join.domain.Clause;
import jungmo.shoppingmall.user.join.domain.ClauseCategory;
import jungmo.shoppingmall.user.login.domain.User;

public interface JoinService {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	boolean overlapInjection(String userId); 
	List<Clause> getClauses();
}
