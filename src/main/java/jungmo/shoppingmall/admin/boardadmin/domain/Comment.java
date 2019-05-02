package jungmo.shoppingmall.admin.boardadmin.domain;

import java.util.*;

public class Comment {
	private int cmtNum;
	private int posNum;
	private Date cmtWritingDate;
	private String cmtContent;
	private String userId;

	public Comment(){}
	
	public Comment(int cmtNum, int posNum, String cmtContent, String userId) {
		super();
		this.cmtNum = cmtNum;
		this.posNum = posNum;
		this.cmtContent = cmtContent;
		this.userId = userId;
	}
	
	public Comment(int cmtNum, String cmtContent, String userId) {
		super();
		this.cmtNum = cmtNum;
		this.cmtContent = cmtContent;
		this.userId = userId;
	}

	public int getCmtNum() {
		return cmtNum;
	}
	public int getPosNum() {
		return posNum;
	}
	public Date getCmtWritingDate() {
		return cmtWritingDate;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	public void setPosNum(int posNum) {
		this.posNum = posNum;
	}
	public void setCmtWritingDate(Date cmtWritingDate) {
		this.cmtWritingDate = cmtWritingDate;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

}
