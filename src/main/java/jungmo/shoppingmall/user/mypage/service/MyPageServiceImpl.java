package jungmo.shoppingmall.user.mypage.service;

import java.text.*;
import java.util.*;

import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired private OrderService orderService;
	
	public String sdate(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(from);
		to += " 00:00:00";
		return to;
	}
	
	public String edate(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(from);
		to += " 23:59:59";
		return to;
	}
	
	public String week1(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(from);
		cal.add(Calendar.DATE, -7);
		Date calculatedDate = cal.getTime();
		String to = transFormat.format(calculatedDate);
		to += " 00:00:00";
		return to;
	}
	
	public String week3(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(from);
		cal.add(Calendar.DATE, -21);
		Date calculatedDate = cal.getTime();
		String to = transFormat.format(calculatedDate);
		to += " 00:00:00";
		return to;
	}
	
	public String month1(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(from);
		cal.add(Calendar.MONTH, -1);
		Date calculatedDate = cal.getTime();
		String to = transFormat.format(calculatedDate);
		to += " 00:00:00";
		return to;
	}
	
	public String month3(){
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(from);
		cal.add(Calendar.MONTH, -3);
		Date calculatedDate = cal.getTime();
		String to = transFormat.format(calculatedDate);
		to += " 00:00:00";
		return to;
	}
	
	@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
	public String updateOrderCancel(String ordNum){
		orderService.modifyOrdType(ordNum, "주문취소");
		List<String> ls = new ArrayList<>();
		List<String> tp = new ArrayList<>();
		HashMap<String,List<String>> option = new HashMap<>();
		ls.add(ordNum);
		tp.add("주문취소");
		option.put("list",ls);
		option.put("type", tp);
		orderService.addMlc(option);
		orderService.addOrdercancel(ordNum);	
		return "";
	}
}
