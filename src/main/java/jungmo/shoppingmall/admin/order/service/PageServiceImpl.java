package jungmo.shoppingmall.admin.order.service;

import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.dao.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

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
	
	public int getTotRowCnt(String type){
		return pageDao.getTotRowCnt(type);
	}
	
	public int getMyTotRowCnt(String userId){
		return pageDao.getMyTotRowCnt(userId);
	}
	
	public int getDateTotRowCnt(Page page){
		return pageDao.getDateTotRowCnt(page);
	}
	
	public int getMyDateTotRowCnt(Page page){
		return pageDao.getMyDateTotRowCnt(page);
	}
	
	public int getCancelTotRowCnt(String type){
		return pageDao.getCancelTotRowCnt(type);
	}
	
	public int getCancelDateTotRowCnt(Page page){
		return pageDao.getCancelDateTotRowCnt(page);
	}
	
	public int getRefundTotRowCnt(String type){
		return pageDao.getRefundTotRowCnt(type);
	}
	
	public int getRefundDateTotRowCnt(Page page){
		return pageDao.getRefundDateTotRowCnt(page);
	}
	
	public int getExchangeTotRowCnt(String type){
		return pageDao.getExchangeTotRowCnt(type);
	}
	
	public int getExchangeDateTotRowCnt(Page page){
		return pageDao.getExchangeDateTotRowCnt(page);
	}
	
	public int getBoardTotRowCnt(@Param("borNum") int borNum,@Param("poscNum") int poscNum){
		return pageDao.getBoardTotRowCnt(borNum, poscNum);
	}
	
	public int getBoardSearchTotRowCnt(@Param("borNum") int borNum,
			@Param("poscNum") int poscNum,@Param("searchType") int searchType,@Param("searchContent") String searchContent){
		return pageDao.getBoardSearchTotRowCnt(borNum, poscNum, searchType, searchContent);
	}
	
	public int getGodqTotRowCnt(){
		return pageDao.getGodqTotRowCnt();
	}
	
	public int getGodqSearchTotRowCnt(@Param("godqType") String godqType,@Param("godqContent") String godqContent){
		return pageDao.getGodqSearchTotRowCnt(godqType, godqContent);
	}
	
	public int getOtoqTotRowCnt(){
		return pageDao.getOtoqTotRowCnt();
	}
	
	public int getOtoqSearchTotRowCnt(@Param("otoqType") String otoqType,@Param("otoqContent") String otoqContent){
		return pageDao.getOtoqSearchTotRowCnt(otoqType, otoqContent);
	}
	
	public int getGodrTotRowCnt(){
		return pageDao.getGodrTotRowCnt();
	}
	
	public int selectGodrTotRowCnt(String godcNum){
		return pageDao.selectGodrTotRowCnt(godcNum);
	}
	
	public int getGodrSearchTotRowCnt(@Param("godcNum") int godcNum,@Param("godrContent") String godrContent){
		return pageDao.getGodrSearchTotRowCnt(godcNum, godrContent);
	}
	
	public int getEventTotRowCnt(){
		return pageDao.getEventTotRowCnt();
	}
	
	public int getEventSearchTotRowCnt(String eventContent){
		return pageDao.getEventSearchTotRowCnt(eventContent);
	}
	
	public int getBorcTotRowCnt(int borNum){
		return pageDao.getBorcTotRowCnt(borNum);
	}
	
	public int getUserTotRowCnt(String userState){
		return pageDao.getUserTotRowCnt(userState);
	}
	
	public int getUserSearchTotRowCnt(UserSearch us){
		return pageDao.getUserSearchTotRowCnt(us);
	}
	
	public int getLeaveUserSearchTotRowCnt(UserSearch us){
		return pageDao.getLeaveUserSearchTotRowCnt(us);
	}
	
	public int getGoodsTotRowCnt(){
		return pageDao.getGoodsTotRowCnt();
	}
	
	public int getGoodsSearchTotRowCnt(GoodsSearch gs){
		return pageDao.getGoodsSearchTotRowCnt(gs);
	}
	
	private void init(){
		endPage = (int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
		startPage = (endPage-pageNumCnt)+1;
		int lastEndPage = (int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
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
