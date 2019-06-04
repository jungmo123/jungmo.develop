package jungmo.shoppingmall.user.login.service;

import java.util.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.user.login.dao.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired private LoginDao loginDao;
	
	public boolean loginTest(User user){
		User u = loginDao.loginTest(user);
		boolean bl;
		if(u != null && u.getUserLevel() == 1){
			bl = true;
		}else{
			bl = false;
		}
		return bl;
	}
	
	public boolean adminTest(User user){
		User u = loginDao.loginTest(user);
		boolean bl;
		if(u != null && u.getUserLevel() == 3){
			bl = true;
		}else{
			bl = false;
		}
		return bl;
	}
	
	public int updateUser(User user){
		return loginDao.updateUser(user);
	}
	
	public int addVisit(String userId){
		return loginDao.addVisit(userId);
	}
	
	public int updateLatestDate(String userId){
		return loginDao.updateLatestDate(userId);
	}
	
	public int getTodayJoin(){
		return loginDao.getTodayJoin();
	}
	
	public int getTodaySecede(){
		return loginDao.getTodaySecede();
	}
	
	public int getTodayGoods(){
		return loginDao.getTodayGoods();
	}
	
	public int getTodayOrders(){
		return loginDao.getTodayOrders();
	}
	
	public int getRE(){
		return loginDao.getRE();
	}
	
	public int getOto(){
		return loginDao.getOto();
	}
	
	public int getGodQnA(){
		return loginDao.getGodQnA();
	}
	
	public List<Posts> selectBoard(){
		return loginDao.selectBoard();
	}
	
	public Expiration getDday(){
		return loginDao.getDday();
	}
	
	public void updateExpiration(int exdNum,String exdDate){
		loginDao.updateExpiration(exdNum, exdDate);
	}
	
	public List<Banner> getBanner(){
		return loginDao.getBanner();
	}
}
