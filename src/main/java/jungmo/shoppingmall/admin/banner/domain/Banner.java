package jungmo.shoppingmall.admin.banner.domain;

public class Banner {
	private int bnnNum;
	private String bnnLocation;
	private String bnnDisplayType;
	private String bnnExplainment;
	private String bnnImageUrl;
	private String bnnLink;
	private String bnnType;
	private String bnnAltText;
	
	public Banner(){}
	
	public Banner(int bnnNum, String bnnLocation, String bnnDisplayType,
			String bnnExplainment, String bnnImageUrl,String bnnLink,String bnnType,String bnnAltText) {
		this.bnnNum = bnnNum;
		this.bnnLocation = bnnLocation;
		this.bnnDisplayType = bnnDisplayType;
		this.bnnExplainment = bnnExplainment;
		this.bnnImageUrl = bnnImageUrl;
		this.bnnLink = bnnLink;
		this.bnnType = bnnType;
		this.bnnAltText = bnnAltText;
	}

	public int getBnnNum() {
		return bnnNum;
	}
	public String getBnnLocation() {
		return bnnLocation;
	}
	public String getBnnDisplayType() {
		return bnnDisplayType;
	}
	public String getBnnExplainment() {
		return bnnExplainment;
	}
	public String getBnnImageUrl() {
		return bnnImageUrl;
	}
	public void setBnnNum(int bnnNum) {
		this.bnnNum = bnnNum;
	}
	public void setBnnLocation(String bnnLocation) {
		this.bnnLocation = bnnLocation;
	}
	public void setBnnDisplayType(String bnnDisplayType) {
		this.bnnDisplayType = bnnDisplayType;
	}
	public void setBnnExplainment(String bnnExplainment) {
		this.bnnExplainment = bnnExplainment;
	}
	public void setBnnImageUrl(String bnnImageUrl) {
		this.bnnImageUrl = bnnImageUrl;
	}
	public String getBnnLink() {
		return bnnLink;
	}
	public void setBnnLink(String bnnLink) {
		this.bnnLink = bnnLink;
	}
	public String getBnnType() {
		return bnnType;
	}
	public void setBnnType(String bnnType) {
		this.bnnType = bnnType;
	}
	public String getBnnAltText() {
		return bnnAltText;
	}
	public void setBnnAltText(String bnnAltText) {
		this.bnnAltText = bnnAltText;
	}
}
