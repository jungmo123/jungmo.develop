package jungmo.shoppingmall.admin.order.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class PostServiceImpl implements PostService{
	@Autowired private PostDao postDao;
	
	public List<PurchaseList> getPosts(Page page){
		return postDao.getPosts(page);
	}
	
	public List<PurchaseList> getOrders(Page page){
		return postDao.getOrders(page);
	}
	
	public 	List<GoodsOption> getGodo(String ordNum,String godNum,String purNum){
		return postDao.getGodo(ordNum, godNum, purNum);
	}
	
	public List<PurchaseList> getDatePosts(Page page){
		return postDao.getDatePosts(page);
	}
	
	public List<PurchaseList> getMyDatePosts(Page page){
		return postDao.getMyDatePosts(page);
	}
	
	public List<OrderCancel> getCancelPosts(Page page){
		return postDao.getCancelPosts(page);
	}
	
	public List<OrderCancel> getCancelDatePosts(Page page){
		return postDao.getCancelDatePosts(page);
	}
	
	public List<Refund> getRefundPosts(Page page){
		return postDao.getRefundPosts(page);
	}
	
	public List<Refund> getRefundDatePosts(Page page){
		return postDao.getRefundDatePosts(page);
	}
	
	public List<Exchange> getExchangePosts(Page page){
		return postDao.getExchangePosts(page);
	}
	
	public List<Exchange> getExchangeDatePosts(Page page){
		return postDao.getExchangeDatePosts(page);
	}
}
