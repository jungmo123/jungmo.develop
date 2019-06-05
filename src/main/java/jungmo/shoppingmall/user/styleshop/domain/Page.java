package jungmo.shoppingmall.user.styleshop.domain;

public class Page {
	private int currentPage;
	private int rowCnt;
	private String godcNum;
	private String type;
	
	public Page(){
		this(1,5);
	}

	public Page(int currentPage){
		this(currentPage,5);
	}
	
	public Page(int currentPage,int rowCnt){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
	}
	
	public Page(int currentPage,int rowCnt,String godcNum,String type){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.godcNum = godcNum;
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

	public String getGodcNum() {
		return godcNum;
	}

	public void setGodcNum(String godcNum) {
		this.godcNum = godcNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
