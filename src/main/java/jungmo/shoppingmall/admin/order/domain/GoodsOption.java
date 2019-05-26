package jungmo.shoppingmall.admin.order.domain;


public class GoodsOption {
	private String ordNum;
	private int godNum;
	private String optName;
	private String optContent;
	private String optPrice;

	public String getOrdNum() {
		return ordNum;
	}
	public int getGodNum() {
		return godNum;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setGodNum(int godNum) {
		this.godNum = godNum;
	}
	public String getOptName() {
		return optName;
	}
	public String getOptContent() {
		return optContent;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public void setOptContent(String optContent) {
		this.optContent = optContent;
	}
	public String getOptPrice() {
		return optPrice;
	}
	public void setOptPrice(String optPrice) {
		this.optPrice = optPrice;
	}
}
