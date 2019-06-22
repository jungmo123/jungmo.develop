package jungmo.shoppingmall.user.mypage.domain;

public class RefundAndExchange {
	private String ordNum;
	private String reDate;
	private String reReason;
	private String reaName;
	private String reContent;
	private String reState;
	private String reCompleteDate;
	private String reMemo;
	private String rePayNum;
	
	public RefundAndExchange(){}
	
	public RefundAndExchange(String ordNum, String reReason, String reContent,String rePayNum) {
		this.ordNum = ordNum;
		this.reReason = reReason;
		this.reContent = reContent;
		this.rePayNum = rePayNum;
	}

	public String getOrdNum() {
		return ordNum;
	}
	public String getReDate() {
		return reDate;
	}
	public String getReReason() {
		return reReason;
	}
	public String getReContent() {
		return reContent;
	}
	public String getReState() {
		return reState;
	}
	public String getReCompleteDate() {
		return reCompleteDate;
	}
	public String getReMemo() {
		return reMemo;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	public void setReReason(String reReason) {
		this.reReason = reReason;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public void setReState(String reState) {
		this.reState = reState;
	}
	public void setReCompleteDate(String reCompleteDate) {
		this.reCompleteDate = reCompleteDate;
	}
	public void setReMemo(String reMemo) {
		this.reMemo = reMemo;
	}
	public String getRePayNum() {
		return rePayNum;
	}
	public void setRePayNum(String rePayNum) {
		this.rePayNum = rePayNum;
	}
	public String getReaName() {
		return reaName;
	}
	public void setReaName(String reaName) {
		this.reaName = reaName;
	}
}
