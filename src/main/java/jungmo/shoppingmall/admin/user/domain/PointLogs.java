package jungmo.shoppingmall.admin.user.domain;

import java.util.*;

public class PointLogs {
	private List<String> userId;
	private String userid;
	private Date polgDate;
	private String polgContent;
	private int polgChange;
	
	public PointLogs(){}

	public PointLogs(List<String> userId, String polgContent, int polgChange) {
		this.userId = userId;
		this.polgContent = polgContent;
		this.polgChange = polgChange;
	}

	public PointLogs(String userid,String polgContent,
			int polgChange) {
		this.userid = userid;
		this.polgContent = polgContent;
		this.polgChange = polgChange;
	}

	public Date getPolgDate() {
		return polgDate;
	}
	public String getPolgContent() {
		return polgContent;
	}

	public void setPolgDate(Date polgDate) {
		this.polgDate = polgDate;
	}
	public void setPolgContent(String polgContent) {
		this.polgContent = polgContent;
	}
	public int getPolgChange() {
		return polgChange;
	}
	public void setPolgChange(int polgChange) {
		this.polgChange = polgChange;
	}

	public List<String> getUserId() {
		return userId;
	}

	public void setUserId(List<String> userId) {
		this.userId = userId;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
