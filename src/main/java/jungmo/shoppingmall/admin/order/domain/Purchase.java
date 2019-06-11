package jungmo.shoppingmall.admin.order.domain;

import java.util.*;

public class Purchase {
	private String ordNum;
	private String purNum;
	private Order order;
	private List<GoodsList> goods;

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

}
