package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class GoodsAnser {
	private int godqNum;
	private String godaContent;
	private Date godaWritingDate;
	private String userId;
	
	public int getGodqNum() {
		return godqNum;
	}
	public String getGodaContent() {
		return godaContent;
	}
	public Date getGodaWritingDate() {
		return godaWritingDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setGodqNum(int godqNum) {
		this.godqNum = godqNum;
	}
	public void setGodaContent(String godaContent) {
		this.godaContent = godaContent;
	}
	public void setGodaWritingDate(Date godaWritingDate) {
		this.godaWritingDate = godaWritingDate;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
