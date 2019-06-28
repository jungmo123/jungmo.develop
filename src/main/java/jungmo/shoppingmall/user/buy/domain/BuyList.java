package jungmo.shoppingmall.user.buy.domain;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class BuyList {
	private String userId;
	private String godNum;
	private String godAmount;
	private String godName;
	private String godcName;
	private String godSellingPrice;
	private String godListImageUrl;
	private List<GoodsOption> godoList;
	
	public BuyList(){}
	
	public BuyList(String userId,String godNum, String godAmount,String godName, String godcName,
			String godSellingPrice,String godListImageUrl) {
		this.userId = userId;
		this.godNum = godNum;
		this.godAmount = godAmount;
		this.godName = godName;
		this.godcName = godcName;
		this.godSellingPrice = godSellingPrice;
		this.godListImageUrl = godListImageUrl;
		this.godoList = new ArrayList<>();
	}
	
	public BuyList(String userId, String godNum, String godAmount,
			String godName, String godcName, String godSellingPrice,
			String godListImageUrl, List<GoodsOption> godoList) {
		this.userId = userId;
		this.godNum = godNum;
		this.godAmount = godAmount;
		this.godName = godName;
		this.godcName = godcName;
		this.godSellingPrice = godSellingPrice;
		this.godListImageUrl = godListImageUrl;
		this.godoList = godoList;
	}

	public String getGodNum() {
		return godNum;
	}
	public String getGodcName() {
		return godcName;
	}
	public String getGodSellingPrice() {
		return godSellingPrice;
	}
	public List<GoodsOption> getGodoList() {
		return godoList;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
	public void setGodcName(String godcName) {
		this.godcName = godcName;
	}
	public void setGodSellingPrice(String godSellingPrice) {
		this.godSellingPrice = godSellingPrice;
	}
	public void setGodoList(List<GoodsOption> godoList) {
		this.godoList = godoList;
	}
	public String getGodAmount() {
		return godAmount;
	}
	public void setGodAmount(String godAmount) {
		this.godAmount = godAmount;
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
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}