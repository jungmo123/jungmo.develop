package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;

import jungmo.shoppingmall.user.login.domain.*;

public class Exchange {
	private String ordNum;
	private Date excRequestDate;
	private String excReason;
	private String reaName;
	private String excContent;
	private String excState;
	private String excCompleteDate;
	private String excMemo;
	private List<GoodsList> goods;
	private User user;
	private List<ExchangeImage> images;
	
	public String getReaName() {
		return reaName;
	}
	public void setReaName(String reaName) {
		this.reaName = reaName;
	}
	public String getOrdNum() {
		return ordNum;
	}
	public Date getExcRequestDate() {
		return excRequestDate;
	}
	public String getExcReason() {
		return excReason;
	}
	public String getExcContent() {
		return excContent;
	}
	public String getExcState() {
		return excState;
	}
	public User getUser() {
		return user;
	}
	public List<ExchangeImage> getImages() {
		return images;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setExcRequestDate(Date excRequestDate) {
		this.excRequestDate = excRequestDate;
	}
	public void setExcReason(String excReason) {
		this.excReason = excReason;
	}
	public void setExcContent(String excContent) {
		this.excContent = excContent;
	}
	public void setExcState(String excState) {
		this.excState = excState;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setImages(List<ExchangeImage> images) {
		this.images = images;
	}
	public String getExcCompleteDate() {
		return excCompleteDate;
	}
	public void setExcCompleteDate(String excCompleteDate) {
		this.excCompleteDate = excCompleteDate;
	}
	public String getExcMemo() {
		return excMemo;
	}
	public void setExcMemo(String excMemo) {
		this.excMemo = excMemo;
	}
	public List<GoodsList> getGoods() {
		return goods;
	}
	public void setGoods(List<GoodsList> goods) {
		this.goods = goods;
	}
}
