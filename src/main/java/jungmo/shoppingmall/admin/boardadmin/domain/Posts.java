package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class Posts {
	private int borNum;
	private int poscNum;
	private int posNum;
	private String posImportance;
	private String posTitle;
	private String posContent;
	private Date posWritingDate;
	private int posViewCnt;
	private String userId;
	
	public Posts(){}
	
	public Posts(int borNum, int poscNum, String posImportance,
			String posTitle, String posContent,String userId) {
		this.borNum = borNum;
		this.poscNum = poscNum;
		this.posImportance = posImportance;
		this.posTitle = posTitle;
		this.posContent = posContent;
		this.posViewCnt = 0;
		this.userId = userId;
	}

	public int getBorNum() {
		return borNum;
	}
	public int getPoscNum() {
		return poscNum;
	}
	public int getPosNum() {
		return posNum;
	}
	public String getPosTitle() {
		return posTitle;
	}
	public String getPosContent() {
		return posContent;
	}
	public int getPosViewCnt() {
		return posViewCnt;
	}
	public String getUserId() {
		return userId;
	}
	public void setBorNum(int borNum) {
		this.borNum = borNum;
	}
	public void setPoscNum(int poscNum) {
		this.poscNum = poscNum;
	}
	public void setPosNum(int posNum) {
		this.posNum = posNum;
	}
	public void setPosTitle(String posTitle) {
		this.posTitle = posTitle;
	}
	public void setPosContent(String posContent) {
		this.posContent = posContent;
	}
	public void setPosViewCnt(int posViewCnt) {
		this.posViewCnt = posViewCnt;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getPosWritingDate() {
		return posWritingDate;
	}
	public void setPosWritingDate(Date posWritingDate) {
		this.posWritingDate = posWritingDate;
	}
	public String getPosImportance() {
		return posImportance;
	}
	public void setPosImportance(String posImportance) {
		this.posImportance = posImportance;
	}	
}
