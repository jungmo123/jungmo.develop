package jungmo.shoppingmall.user.mypage.domain;

public class Cart {
	private String userId;
	private String cartNum;
	private String godNum;
	private String godName;
	private String godSellingPrice;
	private String godAmount;
	private String godPrice;
	private String cartAmount;
	private String optName;
	private String optContent;
	private String optPrice;
	private String optNum;
	
	public String getCartNum() {
		return cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public String getGodNum() {
		return godNum;
	}
	public String getCartAmount() {
		return cartAmount;
	}
	public String getOptName() {
		return optName;
	}
	public String getOptContent() {
		return optContent;
	}
	public String getOptPrice() {
		return optPrice;
	}
	public String getOptNum() {
		return optNum;
	}
	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
	public void setCartAmount(String cartAmount) {
		this.cartAmount = cartAmount;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public void setOptContent(String optContent) {
		this.optContent = optContent;
	}
	public void setOptPrice(String optPrice) {
		this.optPrice = optPrice;
	}
	public void setOptNum(String optNum) {
		this.optNum = optNum;
	}
	public String getGodName() {
		return godName;
	}
	public String getGodSellingPrice() {
		return godSellingPrice;
	}
	public String getGodAmount() {
		return godAmount;
	}
	public String getGodPrice() {
		return godPrice;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public void setGodSellingPrice(String godSellingPrice) {
		this.godSellingPrice = godSellingPrice;
	}
	public void setGodAmount(String godAmount) {
		this.godAmount = godAmount;
	}
	public void setGodPrice(String godPrice) {
		this.godPrice = godPrice;
	}
}
