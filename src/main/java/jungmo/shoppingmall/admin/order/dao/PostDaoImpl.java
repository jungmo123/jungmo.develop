package jungmo.shoppingmall.admin.order.dao;

import java.util.*;

import jungmo.shoppingmall.admin.order.dao.mapper.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired private PostMapper postMapper;
	
	public List<PurchaseList> getPosts(Page page){
		return postMapper.getPosts(page);
	}
	
	public List<PurchaseList> getOrders(Page page){
		return postMapper.getOrders(page);
	}
	
	public 	List<GoodsOption> getGodo(String ordNum,String godNum,String purNum){
		return postMapper.getGodo(ordNum, godNum, purNum);
	}
	
	public List<PurchaseList> getDatePosts(Page page){
		return postMapper.getDatePosts(page);
	}
	
	public List<OrderCancel> getCancelPosts(Page page){
		return postMapper.getCancelPosts(page);
	}
	
	public List<OrderCancel> getCancelDatePosts(Page page){
		return postMapper.getCancelDatePosts(page);
	}
	
	public List<Refund> getRefundPosts(Page page){
		return postMapper.getRefundPosts(page);
	}
	
	public List<Refund> getRefundDatePosts(Page page){
		return postMapper.getRefundDatePosts(page);
	}
	
	public List<Exchange> getExchangePosts(Page page){
		return postMapper.getExchangePosts(page);
	}
	
	public List<Exchange> getExchangeDatePosts(Page page){
		return postMapper.getExchangeDatePosts(page);
	}
}
