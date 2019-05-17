package jungmo.shoppingmall.user.join.domain;

public class ClauseCategory {
	private int clsNum;
	private String userId;
	private String clscAgreement;
	private String clsTitle;
	
	public ClauseCategory(){}
	
	public ClauseCategory(int clsNum, String userId, String clscAgreement) {
		this.clsNum = clsNum;
		this.userId = userId;
		this.clscAgreement = clscAgreement;
	}
	
	public ClauseCategory(int clsNum, String userId, String clscAgreement,
			String clsTitle) {
		this.clsNum = clsNum;
		this.userId = userId;
		this.clscAgreement = clscAgreement;
		this.clsTitle = clsTitle;
	}

	public int getClsNum() {
		return clsNum;
	}

	public String getUserId() {
		return userId;
	}

	public String getClscAgreement() {
		return clscAgreement;
	}

	public void setClsNum(int clsNum) {
		this.clsNum = clsNum;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setClscAgreement(String clscAgreement) {
		this.clscAgreement = clscAgreement;
	}

	public String getClsTitle() {
		return clsTitle;
	}

	public void setClsTitle(String clsTitle) {
		this.clsTitle = clsTitle;
	}
}
