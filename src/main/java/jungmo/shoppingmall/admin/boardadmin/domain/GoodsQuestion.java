package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class GoodsQuestion {
	private int godqNum;
	private String godqContent;
	private Date godqWritingDate;
	private String userId;
	private Goods goods;
	private GoodsAnser goda;
	
	public int getGodqNum() {
		return godqNum;
	}
	public String getGodqContent() {
		return godqContent;
	}
	public Date getGodqWritingDate() {
		return godqWritingDate;
	}
	public String getUserId() {
		return userId;
	}
	public GoodsAnser getGoda() {
		return goda;
	}
	public void setGodqNum(int godqNum) {
		this.godqNum = godqNum;
	}
	public void setGodqContent(String godqContent) {
		this.godqContent = godqContent;
	}
	public void setGodqWritingDate(Date godqWritingDate) {
		this.godqWritingDate = godqWritingDate;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGoda(GoodsAnser goda) {
		this.goda = goda;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
