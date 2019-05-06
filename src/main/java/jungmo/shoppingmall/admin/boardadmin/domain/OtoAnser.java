package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;


public class OtoAnser {
	private int otoqNum;
	private String otoaContent;
	private String userId;
	private Date otoaWritingDate;
	
	public int getOtoqNum() {
		return otoqNum;
	}
	public String getOtoaContent() {
		return otoaContent;
	}
	public String getUserId() {
		return userId;
	}
	public Date getOtoaWritingDate() {
		return otoaWritingDate;
	}
	public void setOtoqNum(int otoqNum) {
		this.otoqNum = otoqNum;
	}
	public void setOtoaContent(String otoaContent) {
		this.otoaContent = otoaContent;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setOtoaWritingDate(Date otoaWritingDate) {
		this.otoaWritingDate = otoaWritingDate;
	}
}
