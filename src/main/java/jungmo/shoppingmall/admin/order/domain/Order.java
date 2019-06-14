package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;

import jungmo.shoppingmall.user.login.domain.*;

public class Order {
	private int ordNum;
	private String orderNum;
	private String ordType;
	private Date ordDate;
	private String shaPostCode;
	private String shaStreet;
	private String shaDetailArea;
	private String recipientName;
	private String recipientPhone;
	private String deliveryRequest;
	private int ordResultCode;
	private String ordResultContent;
	private int usingPoint;
	private String paymentMethod;
	private String memoContent;
	private String userId;
	private User user;
	private List<ManageLogCategories> mlc;
	
	public Order(){}

	public Order(String orderNum, String shaPostCode, String shaStreet,
			String shaDetailArea, String recipientName, String recipientPhone,
			String deliveryRequest, int usingPoint, String paymentMethod,String userId) {
		this.orderNum = orderNum;
		this.shaPostCode = shaPostCode;
		this.shaStreet = shaStreet;
		this.shaDetailArea = shaDetailArea;
		this.recipientName = recipientName;
		this.recipientPhone = recipientPhone;
		this.deliveryRequest = deliveryRequest;
		this.usingPoint = usingPoint;
		this.paymentMethod = paymentMethod;
		this.userId = userId;
	}
	
	public int getOrdNum() {
		return ordNum;
	}
	public List<ManageLogCategories> getMlc() {
		return mlc;
	}
	public void setMlc(List<ManageLogCategories> mlc) {
		this.mlc = mlc;
	}
	public String getOrdType() {
		return ordType;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public String getShaPostCode() {
		return shaPostCode;
	}
	public String getShaStreet() {
		return shaStreet;
	}
	public String getShaDetailArea() {
		return shaDetailArea;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public String getDeliveryRequest() {
		return deliveryRequest;
	}
	public int getOrdResultCode() {
		return ordResultCode;
	}
	public String getOrdResultContent() {
		return ordResultContent;
	}
	public int getUsingPoint() {
		return usingPoint;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public User getUser() {
		return user;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public void setOrdType(String ordType) {
		this.ordType = ordType;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public void setShaPostCode(String shaPostCode) {
		this.shaPostCode = shaPostCode;
	}
	public void setShaStreet(String shaStreet) {
		this.shaStreet = shaStreet;
	}
	public void setShaDetailArea(String shaDetailArea) {
		this.shaDetailArea = shaDetailArea;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}
	public void setOrdResultCode(int ordResultCode) {
		this.ordResultCode = ordResultCode;
	}
	public void setOrdResultContent(String ordResultContent) {
		this.ordResultContent = ordResultContent;
	}
	public void setUsingPoint(int usingPoint) {
		this.usingPoint = usingPoint;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
}
