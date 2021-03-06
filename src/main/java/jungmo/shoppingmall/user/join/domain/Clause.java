package jungmo.shoppingmall.user.join.domain;

public class Clause {
	private int clsNum;
	private String clsTitle;
	private	String clsContent;
	private String clsUsage;
	
	public Clause(){}

	public Clause(String clsTitle, String clsContent, String clsUsage) {
		this.clsTitle = clsTitle;
		this.clsContent = clsContent;
		this.clsUsage = clsUsage;
	}

	public int getClsNum() {
		return clsNum;
	}
	public String getClsUsage() {
		return clsUsage;
	}
	public void setClsUsage(String clsUsage) {
		this.clsUsage = clsUsage;
	}
	public String getClsTitle() {
		return clsTitle;
	}
	public String getClsContent() {
		return clsContent;
	}
	public void setClsNum(int clsNum) {
		this.clsNum = clsNum;
	}
	public void setClsTitle(String clsTitle) {
		this.clsTitle = clsTitle;
	}
	public void setClsContent(String clsContent) {
		this.clsContent = clsContent;
	}
}
