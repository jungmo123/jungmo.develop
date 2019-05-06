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
	
	public Page(){
		this(1,5);
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
}
