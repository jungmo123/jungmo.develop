package jungmo.shoppingmall.user.mypage.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.boardadmin.domain.GoodsReview;
import jungmo.shoppingmall.admin.order.domain.Page;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.login.domain.*;
import jungmo.shoppingmall.user.mypage.dao.mapper.*;
import jungmo.shoppingmall.user.mypage.domain.*;
import jungmo.shoppingmall.user.styleshop.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class MyPageDaoImpl implements MyPageDao{
	@Autowired private MyPageMapper mypageMapper;
	
	public List<Reason> getReason(){
		return mypageMapper.getReason();
	}
	
	public int addRefund(RefundAndExchange re){
		return mypageMapper.addRefund(re);
	}
	
	public int addExchange(RefundAndExchange re){
		return mypageMapper.addExchange(re);
	}
	
	public int addRefundImage(RefundAndExchangeImage reai){
		return mypageMapper.addRefundImage(reai);
	}
	
	public int addExchangeImage(RefundAndExchangeImage reai){
		return mypageMapper.addExchangeImage(reai);
	}
	
	public int deleteRefund(String ordNum){
		return mypageMapper.deleteRefund(ordNum);
	}
	
	public int deleteExchange(String ordNum){
		return mypageMapper.deleteExchange(ordNum);
	}
	
	public RefundAndExchange getRefund(String ordNum){
		return mypageMapper.getRefund(ordNum);
	}
	
	public RefundAndExchange getExchange(String ordNum){
		return mypageMapper.getExchange(ordNum);
	}
	
	public List<ImageList> getRefundImage(String ordNum){
		return mypageMapper.getRefundImage(ordNum);
	}
		
	public List<ImageList> getExchangeImage(String ordNum){
		return mypageMapper.getExchangeImage(ordNum);
	}
	
	public List<Cart> getCart(String userId){
		return mypageMapper.getCart(userId);
	}
	
	public int modifyCartAmountString(String cartNum,String cartAmount){
		return mypageMapper.modifyCartAmount(cartNum, cartAmount);
	}
	
	public int deleteCart(HashMap<String,List<String>> map){
		return mypageMapper.deleteCart(map);
	}
	
	public List<PointLogs> getPl(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getPl(page);
	}
	
	public List<PointLogs> getSearchPl(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getSearchPl(page);
	}
	
	public List<OtoQuestion> getMOtoq(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMOtoq(page);
	}
	
	public List<OtoQuestion> getMOtoqSearch(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMOtoqSearch(page);
	}
		
	public List<OneTwoOneCategory> getOtoc(){
		return mypageMapper.getOtoc();
	}
	
	public int modifyOtoq(OtoQuestion otoq){
		return mypageMapper.modifyOtoq(otoq);
	}
	
	public int addOtoq(OtoQuestion otoq){
		return mypageMapper.addOtoq(otoq);
	}
	
	public List<GoodsReview> getMGodr(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMGodr(page);
	}
	
	public List<GoodsReview> getMGodrSearch(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMGodrSearch(page);
	}
	
	public List<GoodsQuestion> getMGodq(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMGodq(page);
	}
	
	public List<GoodsQuestion> getMGodqSearch(jungmo.shoppingmall.user.styleshop.domain.Page page){
		return mypageMapper.getMGodqSearch(page);
	}
	
	public User getUser(String userId){
		return mypageMapper.getUser(userId);
	}
	
	public int modifyUser(User user){
		return mypageMapper.modifyUser(user);
	}
	
	public int updatePassword(String userId,String userPwd){
		return mypageMapper.updatePassword(userId, userPwd);
	}
	
	public List<secedeCategory> getScd(){
		return mypageMapper.getScd();
	}
	
	public int updateUserState(String userId){
		return mypageMapper.updateUserState(userId);
	}
	
	public int addSecedeUser(String userId,String scdCode,String scdContent){
		return mypageMapper.addSecedeUser(userId, scdCode, scdContent);
	}
	
	public List<PurchaseStock> getPurs(String ordNum){
		return mypageMapper.getPurs(ordNum);
	}
	
	public int pluseStock(String godNum,String godStock){
		return mypageMapper.pluseStock(godNum, godStock);
	}
}
