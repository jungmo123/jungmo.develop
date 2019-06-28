package jungmo.shoppingmall.user.mypage.domain;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class CartList {
	private String cartNum;
	private String godNum;
	private String godName;
	private String godcName;
	private String godListImageUrl;
	private String godSellingPrice;
	private String godAmount;
	private List<GoodsOption> godoList;
	
	public CartList(){}

	public CartList(String cartNum, String godNum, String godName,
			String godcName, String godListImageUrl, String godSellingPrice,
			String godAmount) {
		this.cartNum = cartNum;
		this.godNum = godNum;
		this.godName = godName;
		this.godcName = godcName;
		this.godListImageUrl = godListImageUrl;
		this.godSellingPrice = godSellingPrice;
		this.godAmount = godAmount;
		this.godoList = new ArrayList<>();
	}

	public String getCartNum() {
		return cartNum;
	}
	public List<GoodsOption> getGodoList() {
		return godoList;
	}
	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}
	public void setGodoList(List<GoodsOption> godoList) {
		this.godoList = godoList;
	}

	public String getGodNum() {
		return godNum;
	}

	public String getGodName() {
		return godName;
	}

	public String getGodSellingPrice() {
		return godSellingPrice;
	}

	public String getGodAmount() {
		return godAmount;
	}
	
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}

	public void setGodName(String godName) {
		this.godName = godName;
	}

	public void setGodSellingPrice(String godSellingPrice) {
		this.godSellingPrice = godSellingPrice;
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

	public String getGodcName() {
		return godcName;
	}

	public void setGodcName(String godcName) {
		this.godcName = godcName;
	}
}
