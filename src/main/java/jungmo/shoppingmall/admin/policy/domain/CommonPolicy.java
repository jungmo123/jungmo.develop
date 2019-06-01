package jungmo.shoppingmall.admin.policy.domain;

public class CommonPolicy {
	private int cmpNum;
	private String cmpDeliveryGuide;
	private String cmpExchangeGuide;
	
	public CommonPolicy(){}
	
	public CommonPolicy(String cmpDeliveryGuide,
			String cmpExchangeGuide) {
		this.cmpDeliveryGuide = cmpDeliveryGuide;
		this.cmpExchangeGuide = cmpExchangeGuide;
	}

	public int getCmpNum() {
		return cmpNum;
	}
	public String getCmpDeliveryGuide() {
		return cmpDeliveryGuide;
	}
	public String getCmpExchangeGuide() {
		return cmpExchangeGuide;
	}
	public void setCmpNum(int cmpNum) {
		this.cmpNum = cmpNum;
	}
	public void setCmpDeliveryGuide(String cmpDeliveryGuide) {
		this.cmpDeliveryGuide = cmpDeliveryGuide;
	}
	public void setCmpExchangeGuide(String cmpExchangeGuide) {
		this.cmpExchangeGuide = cmpExchangeGuide;
	}
}
