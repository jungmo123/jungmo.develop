package jungmo.shoppingmall.admin.order.domain;

public class Delivery {
	private int dvpNum;
	private int basicFee;
	private int freedeliveryMp;
	
	public int getDvpNum() {
		return dvpNum;
	}
	public int getBasicFee() {
		return basicFee;
	}
	public int getFreedeliveryMp() {
		return freedeliveryMp;
	}
	public void setDvpNum(int dvpNum) {
		this.dvpNum = dvpNum;
	}
	public void setBasicFee(int basicFee) {
		this.basicFee = basicFee;
	}
	public void setFreedeliveryMp(int freedeliveryMp) {
		this.freedeliveryMp = freedeliveryMp;
	}
}
