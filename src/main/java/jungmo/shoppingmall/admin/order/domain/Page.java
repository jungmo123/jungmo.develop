package jungmo.shoppingmall.admin.order.domain;

public class Page {
	private int currentPage;
	private int rowCnt;
	private String type;
	
	public Page(){
		this(1,5);
	}
	
	public Page(int currentPage,String type){
		this(currentPage,5,type);
	}
	
	public Page(int currentPage,int rowCnt){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
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
}
