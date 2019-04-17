package jungmo.shoppingmall.admin.order.domain;

public class Order {
	private int orderNum;
	private String orderCode;
	private String deliveryState;
	private String orderGoods;
	private String orderer;
	private String orderPrice;
	
	public int getOrderNum() {
		return orderNum;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public String getDeliveryState() {
		return deliveryState;
	}
	public String getOrderGoods() {
		return orderGoods;
	}
	public String getOrderer() {
		return orderer;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}
	public void setOrderGoods(String orderGoods) {
		this.orderGoods = orderGoods;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
}
