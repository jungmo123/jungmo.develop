package jungmo.shoppingmall.admin.goodsadmin.domain;

import java.sql.*;

public class GoodsManageLog {
	private Date gmlDate;
	private String gmlContent;
	private String userId;
	private String godNum;
	
	public Date getGmlDate() {
		return gmlDate;
	}
	public String getGmlContent() {
		return gmlContent;
	}
	public String getUserId() {
		return userId;
	}
	public String getGodNum() {
		return godNum;
	}
	public void setGmlDate(Date gmlDate) {
		this.gmlDate = gmlDate;
	}
	public void setGmlContent(String gmlContent) {
		this.gmlContent = gmlContent;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}
}
