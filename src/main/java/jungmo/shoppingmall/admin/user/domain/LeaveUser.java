package jungmo.shoppingmall.admin.user.domain;

import java.sql.*;

public class LeaveUser {
	private String userId;
	private Date scdDate;
	private int scdcCode;
	private String scdContent;
	
	public LeaveUser(){}	
	
	public LeaveUser(String userId, int scdcCode, String scdContent) {
		super();
		this.userId = userId;
		this.scdcCode = scdcCode;
		this.scdContent = scdContent;
	}

	public String getUserId() {
		return userId;
	}
	public Date getScdDate() {
		return scdDate;
	}
	public int getScdcCode() {
		return scdcCode;
	}
	public String getScdContent() {
		return scdContent;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setScdDate(Date scdDate) {
		this.scdDate = scdDate;
	}
	public void setScdcCode(int scdcCode) {
		this.scdcCode = scdcCode;
	}
	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}
}
