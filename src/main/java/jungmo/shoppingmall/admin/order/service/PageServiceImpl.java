package jungmo.shoppingmall.admin.order.service;

import jungmo.shoppingmall.admin.order.dao.PageDao;
import jungmo.shoppingmall.admin.order.domain.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageServiceImpl implements PageService{
	@Autowired private PageDao pageDao;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private Page page;
	
	public PageServiceImpl(){}
	
	public PageServiceImpl(int pageNumCnt, Page page,int totRowCnt) {
		this.totRowCnt = totRowCnt;
		this.pageNumCnt = pageNumCnt;
		this.page = page;
		init();
	}	
	
	public int getTotRowCnt(){
		return pageDao.getTotRowCnt();
	}
	
	private void init(){
		endPage = (int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
		
		startPage = (endPage-pageNumCnt)+1;
		
		int lastEndPage = (int)(Math.ceil(totRowCnt)/(double)page.getRowCnt());
		
		if(endPage > lastEndPage) endPage = lastEndPage;
		
		prev = startPage ==1?false:true;
		next = endPage*page.getRowCnt() >= totRowCnt?false:true;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public Page getPage() {
		return page;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
