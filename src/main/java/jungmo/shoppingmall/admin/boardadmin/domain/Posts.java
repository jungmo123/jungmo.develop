package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class Posts {
	private int borNum;
	private int poscNum;
	private int posNum;
	private String posImporance;
	private String posTitle;
	private String posContent;
	private Date pos_writingDate;
	private int posViewCnt;
	private String userId;
	
	public int getBorNum() {
		return borNum;
	}
	public int getPoscNum() {
		return poscNum;
	}
	public int getPosNum() {
		return posNum;
	}
	public String getPosImporance() {
		return posImporance;
	}
	public String getPosTitle() {
		return posTitle;
	}
	public String getPosContent() {
		return posContent;
	}
	public Date getPos_writingDate() {
		return pos_writingDate;
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
	public void setPosImporance(String posImporance) {
		this.posImporance = posImporance;
	}
	public void setPosTitle(String posTitle) {
		this.posTitle = posTitle;
	}
	public void setPosContent(String posContent) {
		this.posContent = posContent;
	}
	public void setPos_writingDate(Date pos_writingDate) {
		this.pos_writingDate = pos_writingDate;
	}
	public void setPosViewCnt(int posViewCnt) {
		this.posViewCnt = posViewCnt;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
