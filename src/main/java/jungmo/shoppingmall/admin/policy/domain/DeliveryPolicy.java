package jungmo.shoppingmall.admin.policy.domain;

public class DeliveryPolicy {
	private int dvpNum;
	private int basicFee;
	private int freeDeliveryMp;
	
	public DeliveryPolicy(){}
	
	public DeliveryPolicy(int dvpNum, int basicFee, int freeDeliveryMp) {
		this.dvpNum = dvpNum;
		this.basicFee = basicFee;
		this.freeDeliveryMp = freeDeliveryMp;
	}

	public int getDvpNum() {
		return dvpNum;
	}
	public int getBasicFee() {
		return basicFee;
	}
	public int getFreeDeliveryMp() {
		return freeDeliveryMp;
	}
	public void setDvpNum(int dvpNum) {
		this.dvpNum = dvpNum;
	}
	public void setBasicFee(int basicFee) {
		this.basicFee = basicFee;
	}
	public void setFreeDeliveryMp(int freeDeliveryMp) {
		this.freeDeliveryMp = freeDeliveryMp;
	}
}
