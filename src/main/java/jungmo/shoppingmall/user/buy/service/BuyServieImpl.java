package jungmo.shoppingmall.user.buy.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.admin.policy.service.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.buy.dao.*;
import jungmo.shoppingmall.user.buy.domain.*;
import jungmo.shoppingmall.user.mypage.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

@Service
public class BuyServieImpl implements BuyService{
	@Autowired private MyPageService mypageService;
	@Autowired private BuyDao buyDao;
	
	public int getOrderNum(){
		return buyDao.getOrderNum();
	}
	
	public void createOrder(Order order){
		buyDao.createOrder(order);
	}
	
	public void createPurchase(Purchase purchase){
		buyDao.createPurchase(purchase);
	}
	
	public void createPurchaseOption(HashMap<String,List<GoodsOption>> hashmap){
		buyDao.createPurchaseOption(hashmap);
	}
	
	public void insertPointLogs(PointLogs pl){
		buyDao.insertPointLogs(pl);
	}
	
	@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
	public String insertOrder(MultipartHttpServletRequest request,BuyService buyService,List<BuyList> buyList){
		String ordNum = request.getParameter("ordNum");
		String userName = request.getParameter("name");
		String userPostCode = request.getParameter("userPostcode");
		String userStreet = request.getParameter("userStreet");
		String userDetailArea = request.getParameter("userDetailArea");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		String userRequest = request.getParameter("request");
		String usingPoint = request.getParameter("usingPoint");
		int point = 0;
		if(!usingPoint.equals("")){
			point = Integer.parseInt(usingPoint);
		}
		String payment = request.getParameter("payment");
		if(payment.equals("card")){
			payment = "신용카드";
		}else if(payment.equals("trans")){
			payment = "계좌이체";
		}
		if(buyList.get(0) != null){
			HashMap<String,List<Purchase>> map = new HashMap<>();
			List<Purchase> purchaseList = new ArrayList<>();
			BuyList bl = buyList.get(0);
			String userId = bl.getUserId();
			Order order = new Order(ordNum,userPostCode,userStreet,userDetailArea,userName,phone,userRequest,point,payment,userId);
			buyService.createOrder(order);
			for(int i = 0 ; i < buyList.size() ; i++){
				BuyList buy = buyList.get(i);
				String godNum = buy.getGodNum();
				String godAmount = buy.getGodAmount();
				Purchase p = new Purchase(ordNum,godNum,String.valueOf(i+1),godAmount);
				buyService.createPurchase(p);
				List<GoodsOption> godo = buy.getGodoList();
				List<GoodsOption> godoList = new ArrayList<>();
				if(godo.get(0).getOptName() != null){
					for(int j = 0 ; j < godo.size() ; j++){
						GoodsOption g = godo.get(j);
						String optName = g.getOptName();
						String optContent = g.getOptContent();
						String optPrice = g.getOptPrice();
						GoodsOption go = new GoodsOption(ordNum,String.valueOf(i+1),Integer.parseInt(godNum),optName,optContent,optPrice);
						godoList.add(go);
					}
					HashMap<String,List<GoodsOption>> hashmap = new HashMap<>();
					hashmap.put("godo", godoList);
					buyService.createPurchaseOption(hashmap);					
				}
				if(!usingPoint.equals("0")){
					PointLogs pl = new PointLogs(userId,ordNum,-Integer.valueOf(usingPoint));
					buyService.insertPointLogs(pl);
				}
			}
		}
		return ordNum;
	}
	
	@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
	public String insertMOrder(MultipartHttpServletRequest request,BuyService buyService,List<BuyList> buyList,List<String> cartNums){
		String ordNum = request.getParameter("ordNum");
		String userName = request.getParameter("name");
		String userPostCode = request.getParameter("userPostcode");
		String userStreet = request.getParameter("userStreet");
		String userDetailArea = request.getParameter("userDetailArea");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		String userRequest = request.getParameter("request");
		String usingPoint = request.getParameter("usingPoint");
		int point = 0;
		if(!usingPoint.equals("")){
			point = Integer.parseInt(usingPoint);
		}
		String payment = request.getParameter("payment");
		if(payment.equals("card")){
			payment = "신용카드";
		}else if(payment.equals("trans")){
			payment = "계좌이체";
		}
		if(buyList.get(0) != null){
			HashMap<String,List<Purchase>> map = new HashMap<>();
			List<Purchase> purchaseList = new ArrayList<>();
			BuyList bl = buyList.get(0);
			String userId = bl.getUserId();
			Order order = new Order(ordNum,userPostCode,userStreet,userDetailArea,userName,phone,userRequest,point,payment,userId);
			buyService.createOrder(order);
			for(int i = 0 ; i < buyList.size() ; i++){
				BuyList buy = buyList.get(i);
				String godNum = buy.getGodNum();
				String godAmount = buy.getGodAmount();
				Purchase p = new Purchase(ordNum,godNum,String.valueOf(i+1),godAmount);
				buyService.createPurchase(p);
				List<GoodsOption> godo = buy.getGodoList();
				List<GoodsOption> godoList = new ArrayList<>();
				if(godo.get(0).getOptName() != null){
					for(int j = 0 ; j < godo.size() ; j++){
						GoodsOption g = godo.get(j);
						String optName = g.getOptName();
						String optContent = g.getOptContent();
						String optPrice = g.getOptPrice();
						GoodsOption go = new GoodsOption(ordNum,String.valueOf(i+1),Integer.parseInt(godNum),optName,optContent,optPrice);
						godoList.add(go);
					}
					HashMap<String,List<GoodsOption>> hashmap = new HashMap<>();
					hashmap.put("godo", godoList);
					buyService.createPurchaseOption(hashmap);					
				}
				if(!usingPoint.equals("0")){
					PointLogs pl = new PointLogs(userId,ordNum + " 주문 적립금 사용",-Integer.valueOf(usingPoint));
					buyService.insertPointLogs(pl);
				}
			}
		}
		HashMap<String,List<String>> go = new HashMap<>(); 
		go.put("list", cartNums);
		mypageService.deleteCart(go);
		return ordNum;
	}
}
