package jungmo.shoppingmall.user.styleshop.domain;

import java.util.*;

public class GoodsQnA {
	private String godNum;
	private String godqNum;
	private String godqContent;
	private Date godqWritingDate;
	private String godqUserId;
	private String godaContent;
	private Date godaWritingDate;
	private String godaUserId;
	
	public GoodsQnA(){}
	
	public GoodsQnA(String godqNum, String godqContent, Date godqWritingDate,
			String godqUserId) {
		this.godqNum = godqNum;
		this.godqContent = godqContent;
		this.godqWritingDate = godqWritingDate;
		this.godqUserId = godqUserId;
	}

	public String getGodNum() {
		return godNum;
	}
	public String getGodqNum() {
		return godqNum;
	}
	public String getGodqContent() {
		return godqContent;
	}
	public Date getGodqWritingDate() {
		return godqWritingDate;
	}
	public String getGodqUserId() {
		return godqUserId;
	}
	public String getGodaContent() {
		return godaContent;
	}
	public Date getGodaWritingDate() {
		return godaWritingDate;
	}
	public String getGodaUserId() {
		return godaUserId;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
	public void setGodqNum(String godqNum) {
		this.godqNum = godqNum;
	}
	public void setGodqContent(String godqContent) {
		this.godqContent = godqContent;
	}
	public void setGodqWritingDate(Date godqWritingDate) {
		this.godqWritingDate = godqWritingDate;
	}
	public void setGodqUserId(String godqUserId) {
		this.godqUserId = godqUserId;
	}
	public void setGodaContent(String godaContent) {
		this.godaContent = godaContent;
	}
	public void setGodaWritingDate(Date godaWritingDate) {
		this.godaWritingDate = godaWritingDate;
	}
	public void setGodaUserId(String godaUserId) {
		this.godaUserId = godaUserId;
	}
}
