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
	private List<GoodsList> goods;
	private String usingPoint;
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
	public String getUsingPoint() {
		return usingPoint;
	}
	public void setUsingPoint(String usingPoint) {
		this.usingPoint = usingPoint;
	}
	public List<GoodsList> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsList> goods) {
		this.goods = goods;
	}
}
