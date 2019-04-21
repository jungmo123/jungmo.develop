package jungmo.shoppingmall.admin.order.domain;

import java.util.*;

public class Purchase {
	private String ordNum;
	private Order order;
	private List<Goods> goods;
	private List<GoodsOption> goodsOption;

	public List<GoodsOption> getGoodsOption() {
		return goodsOption;
	}

	public void setGoodsOption(List<GoodsOption> goodsOption) {
		this.goodsOption = goodsOption;
	}

	public String getOrdNum() {
		return ordNum;
	}

	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}

	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
