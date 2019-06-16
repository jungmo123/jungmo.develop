package jungmo.shoppingmall.user.review.domain;

public class ReviewGoods {
	private String godNum;
	private String userId;
	private String godName;
	private String godcNum;
	private String satisLevel;
	private String godrContent;
	
	public ReviewGoods(){}
	
	public ReviewGoods(String godNum, String userId, String satisLevel,
			String godrContent) {
		this.godNum = godNum;
		this.userId = userId;
		this.satisLevel = satisLevel;
		this.godrContent = godrContent;
	}

	public String getGodNum() {
		return godNum;
	}
	public String getUserId() {
		return userId;
	}
	public String getGodName() {
		return godName;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public String getGodcNum() {
		return godcNum;
	}
	public void setGodcNum(String godcNum) {
		this.godcNum = godcNum;
	}
	public String getSatisLevel() {
		return satisLevel;
	}
	public String getGodrContent() {
		return godrContent;
	}
	public void setSatisLevel(String satisLevel) {
		this.satisLevel = satisLevel;
	}
	public void setGodrContent(String godrContent) {
		this.godrContent = godrContent;
	}
}
