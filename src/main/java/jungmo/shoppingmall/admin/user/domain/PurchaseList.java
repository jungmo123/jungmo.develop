package jungmo.shoppingmall.admin.user.domain;

import java.util.*;

public class PurchaseList {
	private Date ordDate;
	private String godName;
	private int totalPrice;
	
	public Date getOrdDate() {
		return ordDate;
	}
	public String getGodName() {
		return godName;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}