package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class BoardCategories {
	private int poscNum;
	private int borNum;
	private int borcNum;
	private String poscName;
	private String userId;
	private Date borcDate;
	
	public BoardCategories(){}
	
	public BoardCategories(int borNum){
		this.borNum = borNum;
	}
	
	public BoardCategories(int poscNum, int borNum) {
		this.poscNum = poscNum;
		this.borNum = borNum;
	}

	public BoardCategories(int poscNum, int borNum, int borcNum, String poscName) {
		this.poscNum = poscNum;
		this.borNum = borNum;
		this.borcNum = borcNum;
		this.poscName = poscName;
	}

	public BoardCategories(int borNum, int borcNum,
			String poscName, String userId) {
		this.borNum = borNum;
		this.borcNum = borcNum;
		this.poscName = poscName;
		this.userId = userId;
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

	public String getUserId() {
		return userId;
	}

	public Date getBorcDate() {
		return borcDate;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setBorcDate(Date borcDate) {
		this.borcDate = borcDate;
	}

	public int getBorcNum() {
		return borcNum;
	}

	public void setBorcNum(int borcNum) {
		this.borcNum = borcNum;
	}
}
