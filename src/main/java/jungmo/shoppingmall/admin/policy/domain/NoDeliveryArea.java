package jungmo.shoppingmall.admin.policy.domain;

public class NoDeliveryArea {
	private int ndaNum;
	private String ndaPostCode;
	private String ndaStreet;
	
	public NoDeliveryArea(){}
	
	public NoDeliveryArea(String ndaPostCode ,String ndaStreet) {
		this.ndaPostCode = ndaPostCode;
		this.ndaStreet = ndaStreet;
	}

	public int getNdaNum() {
		return ndaNum;
	}
	public String getNdaStreet() {
		return ndaStreet;
	}
	public void setNdaNum(int ndaNum) {
		this.ndaNum = ndaNum;
	}
	public void setNdaStreet(String ndaStreet) {
		this.ndaStreet = ndaStreet;
	}
	public String getNdaPostCode() {
		return ndaPostCode;
	}
	public void setNdaPostCode(String ndaPostCode) {
		this.ndaPostCode = ndaPostCode;
	}
}
