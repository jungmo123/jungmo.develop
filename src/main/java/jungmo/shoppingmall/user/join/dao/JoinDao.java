package jungmo.shoppingmall.user.join.dao;

import java.util.List;

import jungmo.shoppingmall.user.join.domain.Clause;
import jungmo.shoppingmall.user.join.domain.ClauseCategory;
import jungmo.shoppingmall.user.join.domain.Overlap;
import jungmo.shoppingmall.user.login.domain.User;

public interface JoinDao {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	Overlap overlapInjection(String userId); 
	List<Clause> getClauses();
}
