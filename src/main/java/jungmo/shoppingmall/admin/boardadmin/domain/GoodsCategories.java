package jungmo.shoppingmall.admin.boardadmin.domain;

public class GoodsCategories {
	private int godcNum;
	private String godcName;
	private String godcViewState;
	private String godcContent;
	
	public GoodsCategories(){}
	
	public GoodsCategories(int godcNum, String godcName, String godcViewState) {
		this.godcNum = godcNum;
		this.godcName = godcName;
		this.godcViewState = godcViewState;
	}

	public GoodsCategories(String godcName, String godcViewState) {
		this.godcName = godcName;
		this.godcViewState = godcViewState;
	}

	public int getGodcNum() {
		return godcNum;
	}
	public String getGodcName() {
		return godcName;
	}
	public void setGodcNum(int godcNum) {
		this.godcNum = godcNum;
	}
	public void setGodcName(String godcName) {
		this.godcName = godcName;
	}
	public String getGodcContent() {
		return godcContent;
	}
	public void setGodcContent(String godcContent) {
		this.godcContent = godcContent;
	}
	public String getGodcViewState() {
		return godcViewState;
	}
	public void setGodcViewState(String godcViewState) {
		this.godcViewState = godcViewState;
	}
}
