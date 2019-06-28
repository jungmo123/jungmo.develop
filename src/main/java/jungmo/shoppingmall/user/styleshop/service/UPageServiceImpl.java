package jungmo.shoppingmall.user.styleshop.service;

import jungmo.shoppingmall.user.styleshop.dao.*;
import jungmo.shoppingmall.user.styleshop.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class UPageServiceImpl implements UPageService{
	@Autowired private UPageDao pageDao;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private Page page;
	
	public UPageServiceImpl(){}
	
	public UPageServiceImpl(int pageNumCnt, Page page,int totRowCnt) {
		this.totRowCnt = totRowCnt;
		this.pageNumCnt = pageNumCnt;
		this.page = page;
		init();
	}
	
	private void init(){
		endPage = (int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
		startPage = (endPage-pageNumCnt)+1;
		int lastEndPage = (int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
		if(endPage > lastEndPage) endPage = lastEndPage;
		prev = startPage ==1?false:true;
		next = endPage*page.getRowCnt() >= totRowCnt?false:true;
	}
	
	public UPageDao getPageDao() {
		return pageDao;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotRowCnt() {
		return totRowCnt;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public Page getPage() {
		return page;
	}

	public void setPageDao(UPageDao pageDao) {
		this.pageDao = pageDao;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setTotRowCnt(int totRowCnt) {
		this.totRowCnt = totRowCnt;
	}

	public void setPageNumCnt(int pageNumCnt) {
		this.pageNumCnt = pageNumCnt;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getTotRowCnt(String godcNum){
		return pageDao.getTotRowCnt(godcNum);
	}
	
	public int getGodrTotRowCnt(String godNum){
		return pageDao.getGodrTotRowCnt(godNum);
	}
	
	public int getQnATotRowCnt(String godNum){
		return pageDao.getQnATotRowCnt(godNum);
	}
	
	public int getPlTotRowCnt(String userId){
		return pageDao.getPlTotRowCnt(userId);
	}
	
	public int getSearchPlTotRowCnt(Page page){
		return pageDao.getSearchPlTotRowCnt(page);
	}
	
	public int getOtoqTotRowCnt(String userId){
		return pageDao.getOtoqTotRowCnt(userId);
	}
	
	public int getSearchOtoqTotRowCnt(String otoqContent,String userId){
		return pageDao.getSearchOtoqTotRowCnt(otoqContent, userId);
	}
}
