package jungmo.shoppingmall.admin.boardadmin.domain;

public class Faq {
	private int faqNum;
	private String faqTitle;
	private String faqContent;
	private String faqcTitle;
	
	public int getFaqNum() {
		return faqNum;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public String getFaqcTitle() {
		return faqcTitle;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public void setFaqcTitle(String faqcTitle) {
		this.faqcTitle = faqcTitle;
	}
}
