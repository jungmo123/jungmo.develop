package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;

import jungmo.shoppingmall.user.login.domain.*;

public class Refund {
	private String ordNum;
	private Date refRequestDate;
	private String refReason;
	private String refContent;
	private String refState;
	private String refCompleteDate;
	private String refMemo;
	private List<Goods> goods;
	private List<GoodsOption> goodsOption;
	private User user;
	private List<RefundImage> images;
	
	public String getOrdNum() {
		return ordNum;
	}
	public Date getRefRequestDate() {
		return refRequestDate;
	}
	public String getRefReason() {
		return refReason;
	}
	public String getRefContent() {
		return refContent;
	}
	public String getRefState() {
		return refState;
	}
	public List<Goods> getGoods() {
		return goods;
	}
	public List<GoodsOption> getGoodsOption() {
		return goodsOption;
	}
	public User getUser() {
		return user;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setRefRequestDate(Date refRequestDate) {
		this.refRequestDate = refRequestDate;
	}
	public void setRefReason(String refReason) {
		this.refReason = refReason;
	}
	public void setRefContent(String refContent) {
		this.refContent = refContent;
	}
	public void setRefState(String refState) {
		this.refState = refState;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	public void setGoodsOption(List<GoodsOption> goodsOption) {
		this.goodsOption = goodsOption;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<RefundImage> getImages() {
		return images;
	}
	public void setImages(List<RefundImage> images) {
		this.images = images;
	}
	public String getRefCompleteDate() {
		return refCompleteDate;
	}
	public void setRefCompleteDate(String refCompleteDate) {
		this.refCompleteDate = refCompleteDate;
	}
	public String getRefMemo() {
		return refMemo;
	}
	public void setRefMemo(String refMemo) {
		this.refMemo = refMemo;
	}
}
