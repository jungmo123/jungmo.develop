package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class OtoQuestion {
	private int otoqNum;
	private int otocNum;
	private String otocName;
	private String otoqTitle;
	private String otoqContent;
	private String userId;
	private Date otoqWritingDate;
	private OtoAnser otoa;
	
	public OtoQuestion(){}
	
	public OtoQuestion(int otoqNum, int otocNum, String otoqTitle,
			String otoqContent) {
		this.otoqNum = otoqNum;
		this.otocNum = otocNum;
		this.otoqTitle = otoqTitle;
		this.otoqContent = otoqContent;
	}

	public OtoQuestion(int otocNum, String otoqTitle, String otoqContent,
			String userId) {
		this.otocNum = otocNum;
		this.otoqTitle = otoqTitle;
		this.otoqContent = otoqContent;
		this.userId = userId;
	}

	public int getOtoqNum() {
		return otoqNum;
	}
	public int getOtocNum() {
		return otocNum;
	}
	public String getOtoqTitle() {
		return otoqTitle;
	}
	public String getOtoqContent() {
		return otoqContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setOtoqNum(int otoqNum) {
		this.otoqNum = otoqNum;
	}
	public void setOtocNum(int otocNum) {
		this.otocNum = otocNum;
	}
	public void setOtoqTitle(String otoqTitle) {
		this.otoqTitle = otoqTitle;
	}
	public void setOtoqContent(String otoqContent) {
		this.otoqContent = otoqContent;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOtocName() {
		return otocName;
	}
	public void setOtocName(String otocName) {
		this.otocName = otocName;
	}
	public OtoAnser getOtoa() {
		return otoa;
	}
	public void setOtoa(OtoAnser otoa) {
		this.otoa = otoa;
	}
	public Date getOtoqWritingDate() {
		return otoqWritingDate;
	}
	public void setOtoqWritingDate(Date otoqWritingDate) {
		this.otoqWritingDate = otoqWritingDate;
	}
}