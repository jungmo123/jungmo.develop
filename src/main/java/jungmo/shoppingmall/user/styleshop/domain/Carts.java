package jungmo.shoppingmall.user.styleshop.domain;

public class Carts {
	private String userId;
	private String godNum;
	private String godAmount;
	private String optionName;
	private String optionContent;
	private String optionPrice;
	
	public Carts(){}
	
	public Carts(String userId, String godNum, String godAmount,
			String optionName, String optionContent, String optionPrice) {
		this.userId = userId;
		this.godNum = godNum;
		this.godAmount = godAmount;
		this.optionName = optionName;
		this.optionContent = optionContent;
		this.optionPrice = optionPrice;
	}

	public String getUserId() {
		return userId;
	}
	public String getGodNum() {
		return godNum;
	}
	public String getGodAmount() {
		return godAmount;
	}
	public String getOptionName() {
		return optionName;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public String getOptionPrice() {
		return optionPrice;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
	public void setGodAmount(String godAmount) {
		this.godAmount = godAmount;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	public void setOptionPrice(String optionPrice) {
		this.optionPrice = optionPrice;
	}
}
