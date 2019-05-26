package jungmo.shoppingmall.admin.goodsadmin.domain;

public class OptionList {
	private String optionName;
	private String optionIntroduce;
	private int optionPrice;

	public String getOptionName() {
		return optionName;
	}

	public String getOptionIntroduce() {
		return optionIntroduce;
	}

	public int getOptionPrice() {
		return optionPrice;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public void setOptionIntroduce(String optionIntroduce) {
		this.optionIntroduce = optionIntroduce;
	}

	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}
}
