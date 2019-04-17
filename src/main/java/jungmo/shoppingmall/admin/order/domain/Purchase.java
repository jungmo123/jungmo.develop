package jungmo.shoppingmall.admin.order.domain;

import java.util.*;



public class Purchase {
	private double ordNum;
	private int godAmount;
	private List<Goods> goods;
	
	public double getOrdNum() {
		return ordNum;
	}
	public int getGodAmount() {
		return godAmount;
	}
	public void setOrdNum(double ordNum) {
		this.ordNum = ordNum;
	}
	public void setGodAmount(int godAmount) {
		this.godAmount = godAmount;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
}
