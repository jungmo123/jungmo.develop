package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;

import jungmo.shoppingmall.user.login.domain.*;

public class OrderCancel {
	private String ordNum;
	private Date ordDate;
	private Date odcDate;
	private String paymentMethod;
	private String odcType;
	private List<Goods> goods;
	private User user;
	
	public Date getOrdDate() {
		return ordDate;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public User getUser() {
		return user;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getOdcDate() {
		return odcDate;
	}
	public void setOdcDate(Date odcDate) {
		this.odcDate = odcDate;
	}
	public String getOdcType() {
		return odcType;
	}
	public void setOdcType(String odcType) {
		this.odcType = odcType;
	}
}
