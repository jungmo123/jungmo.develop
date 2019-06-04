package jungmo.shoppingmall.user.login.dao;

import java.util.*;

import jungmo.shoppingmall.admin.banner.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.user.login.dao.mapper.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired private LoginMapper loginMapper;
	
	public User loginTest(User user){
		return loginMapper.loginTest(user);
	}
	
	public int updateUser(User user){
		return loginMapper.updateUser(user);
	}
	
	public int addVisit(String userId){
		return loginMapper.addVisit(userId);
	}
	
	public int updateLatestDate(String userId){
		return loginMapper.updateLatestDate(userId);
	}
	
	public int getTodayJoin(){
		return loginMapper.getTodayJoin();
	}
	
	public int getTodaySecede(){
		return loginMapper.getTodaySecede();
	}
	
	public int getTodayGoods(){
		return loginMapper.getTodayGoods();
	}
	
	public int getTodayOrders(){
		return loginMapper.getTodayOrders();
	}
	
	public int getRE(){
		return loginMapper.getRE();
	}
	
	public int getOto(){
		return loginMapper.getOto();
	}
	
	public int getGodQnA(){
		return loginMapper.getGodQnA();
	}
	
	public List<Posts> selectBoard(){
		return loginMapper.selectBoard();
	}
	
	public Expiration getDday(){
		return loginMapper.getDday();
	}
	
	public void updateExpiration(int exdNum,String exdDate){
		loginMapper.updateExpiration(exdNum, exdDate);
	}
	
	public List<Banner> getBanner(){
		return loginMapper.getBanner();
	}
}
