package jungmo.shoppingmall.user.mypage.service;

import java.io.*;
import java.text.*;
import java.util.*;

import jungmo.shoppingmall.admin.order.service.*;
import jungmo.shoppingmall.user.mypage.dao.*;
import jungmo.shoppingmall.user.mypage.domain.*;

import org.apache.commons.io.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired private OrderService orderService;
	@Autowired private MyPageDao mypageDao;
	
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
	
	@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
	public String addRea(MultipartHttpServletRequest request,MyPageService mypageService,List<String> fileList){
		String re = request.getParameter("sArSelect");
		String reason = request.getParameter("reason");
		String content = request.getParameter("content");
		String ordNum = request.getParameter("ordNum");
		String paynum = request.getParameter("rePayNum");
		RefundAndExchange rae = new RefundAndExchange(ordNum,reason,content,paynum);
		if(re.equals("refund")){
			mypageService.addRefund(rae);
			orderService.modifyOrdType(ordNum, "환불");
		}else{
			mypageService.addExchange(rae);
			orderService.modifyOrdType(ordNum, "교환");
		}
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		Iterator<String> itr = request.getFileNames();
		int idx = 1;
		String userId = (String)request.getSession().getAttribute("user");
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		List<ImageList> files = new ArrayList<>();
		while(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			String fileName = file.getOriginalFilename();
			String fileExtension  = FilenameUtils.getExtension(fileName);
			if(!fileName.equals("")){
				fullName = fileName + userId+ today + idx + "." + fileExtension;		
				files.add(new ImageList(fullName));
				fileList.add(fullName);
				save(dir + "/" + fullName,file);
			}
			idx++;
		}
		if(files.size() != 0){
			RefundAndExchangeImage reai = new RefundAndExchangeImage(ordNum,files);
			if(re.equals("refund")){
				mypageService.addRefundImage(reai);
			}else{
				mypageService.addExchangeImage(reai);
			}				
		}	
		return "";
	}
	
	private void save(String fileFullName,MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public List<Reason> getReason(){
		return mypageDao.getReason();
	}
	
	public int addRefund(RefundAndExchange re){
		return mypageDao.addRefund(re);
	}
	
	public int addExchange(RefundAndExchange re){
		return mypageDao.addExchange(re);
	}
	
	public int addRefundImage(RefundAndExchangeImage reai){
		return mypageDao.addRefundImage(reai);
	}
	
	public int addExchangeImage(RefundAndExchangeImage reai){
		return mypageDao.addExchangeImage(reai);
	}
	
	public int deleteRefund(String ordNum){
		return mypageDao.deleteRefund(ordNum);
	}
	
	public int deleteExchange(String ordNum){
		return mypageDao.deleteExchange(ordNum);
	}
	
	public RefundAndExchange getRefund(String ordNum){
		return mypageDao.getRefund(ordNum);
	}
	
	public RefundAndExchange getExchange(String ordNum){
		return mypageDao.getExchange(ordNum);
	}
	
	public List<ImageList> getRefundImage(String ordNum){
		return mypageDao.getRefundImage(ordNum);
	}
		
	public List<ImageList> getExchangeImage(String ordNum){
		return mypageDao.getExchangeImage(ordNum);
	}
}
