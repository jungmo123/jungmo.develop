package jungmo.shoppingmall.user.styleshop.domain;

import jungmo.shoppingmall.user.styleshop.service.*;

public class PageMaker {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private int currentPage;
	
	public PageMaker(){}
		
	public PageMaker(UPageServiceImpl ps){
		this.startPage = ps.getStartPage();
		this.endPage = ps.getEndPage();
		this.prev = ps.isPrev();
		this.next = ps.isNext();
		this.totRowCnt = ps.getTotRowCnt();
		this.pageNumCnt = ps.getPageNumCnt();
		this.currentPage = ps.getPage().getCurrentPage();
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
	public int getCurrentPage() {
		return currentPage;
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
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}
