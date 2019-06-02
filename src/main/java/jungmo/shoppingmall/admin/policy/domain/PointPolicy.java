package jungmo.shoppingmall.admin.policy.domain;

public class PointPolicy {
	private int pnpNum;
	private int joinPoint;
	private int savePointPercent;
	
	public PointPolicy(){}
	
	public PointPolicy(int joinPoint, int savePointPercent) {
		this.joinPoint = joinPoint;
		this.savePointPercent = savePointPercent;
	}

	public int getPnpNum() {
		return pnpNum;
	}
	public int getJoinPoint() {
		return joinPoint;
	}
	public int getSavePointPercent() {
		return savePointPercent;
	}
	public void setPnpNum(int pnpNum) {
		this.pnpNum = pnpNum;
	}
	public void setJoinPoint(int joinPoint) {
		this.joinPoint = joinPoint;
	}
	public void setSavePointPercent(int savePointPercent) {
		this.savePointPercent = savePointPercent;
	}
}
