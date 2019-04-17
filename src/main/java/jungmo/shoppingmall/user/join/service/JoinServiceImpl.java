package jungmo.shoppingmall.user.join.service;

import java.util.List;

import jungmo.shoppingmall.user.join.dao.JoinDao;
import jungmo.shoppingmall.user.join.domain.Clause;
import jungmo.shoppingmall.user.join.domain.ClauseCategory;
import jungmo.shoppingmall.user.join.domain.Overlap;
import jungmo.shoppingmall.user.login.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService{
	@Autowired private JoinDao joinDao;
	
	public void addUser(User user){
		joinDao.addUser(user);
	}
	
	public void addClsc(ClauseCategory clsc){
		joinDao.addClsc(clsc);
	}
	
	public List<Clause> getClauses(){
		return joinDao.getClauses();
	}
	
	public boolean overlapInjection(String userId){
		Overlap ov = joinDao.overlapInjection(userId);
		if(ov != null){
			return true;
		}else{
			return false;
		}
	}
}
