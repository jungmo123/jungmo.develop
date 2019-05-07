package jungmo.shoppingmall.admin.boardadmin.domain;

public class FaqCategory {
	private int faqcNum;
	private String faqcTitle;
	private String faqcContent;
	
	public int getFaqcNum() {
		return faqcNum;
	}
	public String getFaqcTitle() {
		return faqcTitle;
	}
	public String getFaqcContent() {
		return faqcContent;
	}
	public void setFaqcNum(int faqcNum) {
		this.faqcNum = faqcNum;
	}
	public void setFaqcTitle(String faqcTitle) {
		this.faqcTitle = faqcTitle;
	}
	public void setFaqcContent(String faqcContent) {
		this.faqcContent = faqcContent;
	}
}
