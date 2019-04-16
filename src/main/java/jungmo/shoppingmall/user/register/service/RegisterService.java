package jungmo.shoppingmall.user.register.service;

import java.util.List;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.ClauseCategory;

public interface RegisterService {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	boolean overlapInjection(String userId); 
	List<Clause> getClauses();
}
