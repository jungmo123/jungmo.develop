package jungmo.shoppingmall.admin.order.domain;

import java.sql.*;

public class ManageLogCategories {
	private  Date mlcDate;
	private String ordNum;
	private String mlcContent;
	
	public Date getMlcDate() {
		return mlcDate;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public String getMlcContent() {
		return mlcContent;
	}
	public void setMlcDate(Date mlcDate) {
		this.mlcDate = mlcDate;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setMlcContent(String mlcContent) {
		this.mlcContent = mlcContent;
	}
}
