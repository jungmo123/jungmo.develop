package jungmo.shoppingmall.user.register.dao.mapper;

import java.util.List;

import jungmo.shoppingmall.user.login.domain.User;
import jungmo.shoppingmall.user.register.domain.Clause;
import jungmo.shoppingmall.user.register.domain.ClauseCategory;
import jungmo.shoppingmall.user.register.domain.Overlap;

public interface RegisterMapper {
	void addUser(User user);
	void addClsc(ClauseCategory clsc);
	Overlap overlapInjection(String userId); 
	List<Clause> getClauses();
}
