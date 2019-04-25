package jungmo.shoppingmall.admin.boardadmin.domain;

public class BoardCategories {
	private int poscNum;
	private int borNum;
	private String poscName;
	
	public BoardCategories(){}
	
	public BoardCategories(int borNum){
		this.borNum = borNum;
	}
	
	public BoardCategories(int poscNum, int borNum) {
		this.poscNum = poscNum;
		this.borNum = borNum;
	}

	public int getPoscNum() {
		return poscNum;
	}
	public int getBorNum() {
		return borNum;
	}
	public String getPoscName() {
		return poscName;
	}
	public void setPoscNum(int poscNum) {
		this.poscNum = poscNum;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public void setPoscName(String poscName) {
		this.poscName = poscName;
	}
}
