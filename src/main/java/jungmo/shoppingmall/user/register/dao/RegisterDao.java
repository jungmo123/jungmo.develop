package jungmo.shoppingmall.user.register.dao;

import java.util.List;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.Overlap;

public interface RegisterDao {
	void addUser(User user);
	Overlap overlapInjection(String userId); 
	List<Clause> getClauses();
}
