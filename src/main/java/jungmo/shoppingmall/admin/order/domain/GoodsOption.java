package jungmo.shoppingmall.admin.order.domain;


public class GoodsOption {
	private String ordNum;
	private String purNum;
	private int godNum;
	private String optName;
	private String optContent;
	private String optPrice;
	
	public GoodsOption(){}
	
	public GoodsOption(int godNum, String optName,
			String optContent, String optPrice) {
		this.godNum = godNum;
		this.optName = optName;
		this.optContent = optContent;
		this.optPrice = optPrice;
	}

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
	public String getPurNum() {
		return purNum;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
}
