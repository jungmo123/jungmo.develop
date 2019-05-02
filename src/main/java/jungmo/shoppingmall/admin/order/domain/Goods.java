package jungmo.shoppingmall.admin.order.domain;

import java.sql.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

public class Goods {
	private int godNum;
	private int ordNum;
	private int godNormalPrice;
	private int godSellingPrice;
	private String godMainImageUrl;
	private String godListImageUrl;
	private int godStock;
	private int godSellingLimit;
	private String godName;
	private String godDisplayType;
	private Date godRegDate;
	private int godViewPoint;
	private int godcNum;
	private int godAmount;
	private GoodsCategories godc;
	
	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public int getGodAmount() {
		return godAmount;
	}
	public void setGodAmount(int godAmount) {
		this.godAmount = godAmount;
	}
	public int getGodNum() {
		return godNum;
	}
	public int getGodNormalPrice() {
		return godNormalPrice;
	}
	public int getGodSellingPrice() {
		return godSellingPrice;
	}
	public String getGodMainImageUrl() {
		return godMainImageUrl;
	}
	public String getGodListImageUrl() {
		return godListImageUrl;
	}
	public int getGodStock() {
		return godStock;
	}
	public int getGodSellingLimit() {
		return godSellingLimit;
	}
	public String getGodName() {
		return godName;
	}
	public String getGodDisplayType() {
		return godDisplayType;
	}
	public Date getGodRegDate() {
		return godRegDate;
	}
	public int getGodViewPoint() {
		return godViewPoint;
	}
	public int getGodcNum() {
		return godcNum;
	}
	public void setGodNum(int godNum) {
		this.godNum = godNum;
	}
	public void setGodNormalPrice(int godNormalPrice) {
		this.godNormalPrice = godNormalPrice;
	}
	public void setGodSellingPrice(int godSellingPrice) {
		this.godSellingPrice = godSellingPrice;
	}
	public void setGodMainImageUrl(String godMainImageUrl) {
		this.godMainImageUrl = godMainImageUrl;
	}
	public void setGodListImageUrl(String godListImageUrl) {
		this.godListImageUrl = godListImageUrl;
	}
	public void setGodStock(int godStock) {
		this.godStock = godStock;
	}
	public void setGodSellingLimit(int godSellingLimit) {
		this.godSellingLimit = godSellingLimit;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public void setGodDisplayType(String godDisplayType) {
		this.godDisplayType = godDisplayType;
	}
	public void setGodRegDate(Date godRegDate) {
		this.godRegDate = godRegDate;
	}
	public void setGodViewPoint(int godViewPoint) {
		this.godViewPoint = godViewPoint;
	}
	public void setGodcNum(int godcNum) {
		this.godcNum = godcNum;
	}
	public GoodsCategories getGodc() {
		return godc;
	}
	public void setGodc(GoodsCategories godc) {
		this.godc = godc;
	}
}
