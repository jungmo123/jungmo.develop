package jungmo.shoppingmall.admin.order.domain;

import java.sql.*;

public class Page {
	private int currentPage;
	private int rowCnt;
	private String type;
	private Date date1;
	private Date date2;
	private String ordNum;
	private int borNum;
	private int poscNum;
	private int searchType;
	private String searchContent;
	private int godqNum;
	private String godqContent;
	private String godqType;
	private String otoqContent;
	private String otoqType;
	private int godcNum;
	private String godrContent;
	private String eventContent;
	private String title;
	private String SearchBar;
	private String sdate;
	private String edate;
	private String userLevel;
	private String minPrice;
	private String maxPrice;
	private String minSaved;
	private String maxSaved;
	private String email;
	private String polgContent;
	private int polgChange;
	
	public Page(){
		this(1,5);
	}
	
	public Page(int currentPage,int rowCnt,int godcNum,String godrContent){
		this.currentPage = currentPage;
		this.godcNum = godcNum;
		this.godrContent = godrContent;
		this.rowCnt = rowCnt;
	}
	
	public Page(int currentPage,String title, String searchBar, String sdate, String edate,
			String userLevel, String minPrice, String maxPrice,
			String minSaved, String maxSaved, String email) {
		this.currentPage = currentPage;
		this.rowCnt = 5;
		this.title = title;
		SearchBar = searchBar;
		this.sdate = sdate;
		this.edate = edate;
		this.userLevel = userLevel;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.minSaved = minSaved;
		this.maxSaved = maxSaved;
		this.email = email;
	}

	public Page(String type, String title, String searchBar, String sdate,
			String edate, String userLevel, String minPrice, String maxPrice,
			String minSaved, String maxSaved, String email) {
		this.type = type;
		this.title = title;
		SearchBar = searchBar;
		this.sdate = sdate;
		this.edate = edate;
		this.userLevel = userLevel;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.minSaved = minSaved;
		this.maxSaved = maxSaved;
		this.email = email;
	}

	public Page(int currentPage){
		this(currentPage,5);
	}
	
	public Page(int currentPage,boolean bl){
		this(currentPage,10);
	}
	
	public Page(int currentPage,int borNum,int poscNum){
		this.currentPage = currentPage;
		this.borNum = borNum;
		this.poscNum = poscNum;
		this.rowCnt = 10;
	}
	
	public Page(int currentPage,int rowCnt,Date date1,Date date2,String ordNum){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.date1 = date1;
		this.date2 = date2;
		this.ordNum = ordNum;
	}
	
	public Page(int currentPage,int borNum,int poscNum,int searchType,String searchContent){
		this.currentPage = currentPage;
		this.borNum = borNum;
		this.poscNum = poscNum;
		this.rowCnt = 10;
		this.searchType = searchType;
		this.searchContent = searchContent;
	}
	
	public Page(int currentPage,String type){
		this(currentPage,5,type);
	}
	
	public Page(int currentPage,int rowCnt){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
	}
	
	public String getOrdNum() {
		return ordNum;
	}

	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}

	public Date getDate1() {
		return date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public Page(int currentPage, int rowCnt, String type) {
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getRowCnt() {
		return rowCnt;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}

	public int getBorNum() {
		return borNum;
	}

	public int getPoscNum() {
		return poscNum;
	}

	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}

	public void setPoscNum(int poscNum) {
		this.poscNum = poscNum;
	}

	public int getSearchType() {
		return searchType;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getGodqNum() {
		return godqNum;
	}

	public void setGodqNum(int godqNum) {
		this.godqNum = godqNum;
	}

	public String getGodqType() {
		return godqType;
	}

	public void setGodqType(String godqType) {
		this.godqType = godqType;
	}

	public String getGodqContent() {
		return godqContent;
	}

	public void setGodqContent(String godqContent) {
		this.godqContent = godqContent;
	}

	public String getOtoqContent() {
		return otoqContent;
	}

	public String getOtoqType() {
		return otoqType;
	}

	public void setOtoqContent(String otoqContent) {
		this.otoqContent = otoqContent;
	}

	public void setOtoqType(String otoqType) {
		this.otoqType = otoqType;
	}

	public int getGodcNum() {
		return godcNum;
	}

	public String getGodrContent() {
		return godrContent;
	}

	public void setGodcNum(int godcNum) {
		this.godcNum = godcNum;
	}

	public void setGodrContent(String godrContent) {
		this.godrContent = godrContent;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getTitle() {
		return title;
	}

	public String getSearchBar() {
		return SearchBar;
	}

	public String getSdate() {
		return sdate;
	}

	public String getEdate() {
		return edate;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public String getMinPrice() {
		return minPrice;
	}

	public String getMaxPrice() {
		return maxPrice;
	}

	public String getMinSaved() {
		return minSaved;
	}

	public String getMaxSaved() {
		return maxSaved;
	}

	public String getEmail() {
		return email;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setSearchBar(String searchBar) {
		SearchBar = searchBar;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}

	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}

	public void setMinSaved(String minSaved) {
		this.minSaved = minSaved;
	}

	public void setMaxSaved(String maxSaved) {
		this.maxSaved = maxSaved;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPolgContent() {
		return polgContent;
	}

	public int getPolgChange() {
		return polgChange;
	}

	public void setPolgContent(String polgContent) {
		this.polgContent = polgContent;
	}

	public void setPolgChange(int polgChange) {
		this.polgChange = polgChange;
	}
}
