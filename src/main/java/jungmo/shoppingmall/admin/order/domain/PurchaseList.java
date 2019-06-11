package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;


public class PurchaseList {
	private String ordNum;
	private String usingPoint;
	private String purNum;
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
	private String paymentMethod;
	private String memoContent;
	private String userId;
	private String userName;
	private String userPhone;
	private List<ManageLogCategories> mlc;
	private List<GoodsList> goods;
	
	public String getOrdNum() {
		return ordNum;
	}
	public String getPurNum() {
		return purNum;
	}
	public List<GoodsList> getGoods() {
		return goods;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
	public void setGoods(List<GoodsList> goods) {
		this.goods = goods;
	}
	public String getOrdType() {
		return ordType;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setOrdType(String ordType) {
		this.ordType = ordType;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Date ordDate) {
		this.ordDate = ordDate;
	}
	public String getUsingPoint() {
		return usingPoint;
	}
	public void setUsingPoint(String usingPoint) {
		this.usingPoint = usingPoint;
	}
	public List<ManageLogCategories> getMlc() {
		return mlc;
	}
	public void setMlc(List<ManageLogCategories> mlc) {
		this.mlc = mlc;
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
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public String getMemoContent() {
		return memoContent;
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
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
}
