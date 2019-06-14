package jungmo.shoppingmall.admin.order.domain;

import java.util.*;

public class Purchase {
	private String ordNum;
	private String godNum;
	private String purNum;
	private String godAmount;
	private Order order;
	private List<GoodsList> goods;
	
	public Purchase(){}

	public Purchase(String ordNum, String godNum, String purNum,
			String godAmount) {
		this.ordNum = ordNum;
		this.godNum = godNum;
		this.purNum = purNum;
		this.godAmount = godAmount;
	}

	public String getOrdNum() {
		return ordNum;
	}

	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getPurNum() {
		return purNum;
	}

	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}

	public List<GoodsList> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodsList> goods) {
		this.goods = goods;
	}

	public String getGodNum() {
		return godNum;
	}

	public String getGodAmount() {
		return godAmount;
	}

	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}

	public void setGodAmount(String godAmount) {
		this.godAmount = godAmount;
	}
}
