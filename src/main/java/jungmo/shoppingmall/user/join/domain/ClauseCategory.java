package jungmo.shoppingmall.user.join.domain;

public class ClauseCategory {
	int clsNum;
	String userId;
	String clscAgreement;
	
	public ClauseCategory(){}
	
	public ClauseCategory(int clsNum, String userId, String clscAgreement) {
		this.clsNum = clsNum;
		this.userId = userId;
		this.clscAgreement = clscAgreement;
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
}
