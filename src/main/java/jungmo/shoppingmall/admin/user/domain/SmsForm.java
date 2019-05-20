package jungmo.shoppingmall.admin.user.domain;

public class SmsForm {
	private int smsNum;
	private String smsSendingPoint;
	private String smsContent;
	private String smsAutomaticallySend;
	private String smsAddressee;
	
	public SmsForm(){};
	
	public SmsForm(int smsNum, String smsContent, String smsAutomaticallySend) {
		this.smsNum = smsNum;
		this.smsContent = smsContent;
		this.smsAutomaticallySend = smsAutomaticallySend;
	}

	public int getSmsNum() {
		return smsNum;
	}
	public String getSmsSendingPoint() {
		return smsSendingPoint;
	}
	public String getSmsContent() {
		return smsContent;
	}
	public String getSmsAutomaticallySend() {
		return smsAutomaticallySend;
	}
	public String getSmsAddressee() {
		return smsAddressee;
	}
	public void setSmsNum(int smsNum) {
		this.smsNum = smsNum;
	}
	public void setSmsSendingPoint(String smsSendingPoint) {
		this.smsSendingPoint = smsSendingPoint;
	}
	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}
	public void setSmsAutomaticallySend(String smsAutomaticallySend) {
		this.smsAutomaticallySend = smsAutomaticallySend;
	}
	public void setSmsAddressee(String smsAddressee) {
		this.smsAddressee = smsAddressee;
	}
}
