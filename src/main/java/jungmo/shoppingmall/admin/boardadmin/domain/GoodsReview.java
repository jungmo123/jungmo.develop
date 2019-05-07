package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class GoodsReview {
	private int godrNum;
	private int godNum;
	private String godName;
	private String godcName;
	private String godListImageUrl;
	private String userId;
	private Date godrWritingDate;
	private int satisLevel;
	private String godrContent;
	private Goods god;
	public int getGodrNum() {
		return godrNum;
	}
	public int getGodNum() {
		return godNum;
	}
	public String getUserId() {
		return userId;
	}
	public Date getGodrWritingDate() {
		return godrWritingDate;
	}
	public int getSatisLevel() {
		return satisLevel;
	}
	public String getGodrContent() {
		return godrContent;
	}
	public Goods getGod() {
		return god;
	}
	public void setGodrNum(int godrNum) {
		this.godrNum = godrNum;
	}
	public void setGodNum(int godNum) {
		this.godNum = godNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGodrWritingDate(Date godrWritingDate) {
		this.godrWritingDate = godrWritingDate;
	}
	public void setSatisLevel(int satisLevel) {
		this.satisLevel = satisLevel;
	}
	public void setGodrContent(String godrContent) {
		this.godrContent = godrContent;
	}
	public void setGod(Goods god) {
		this.god = god;
	}
	public String getGodListImageUrl() {
		return godListImageUrl;
	}
	public void setGodListImageUrl(String godListImageUrl) {
		this.godListImageUrl = godListImageUrl;
	}
	public String getGodName() {
		return godName;
	}
	public String getGodcName() {
		return godcName;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public void setGodcName(String godcName) {
		this.godcName = godcName;
	}
}
