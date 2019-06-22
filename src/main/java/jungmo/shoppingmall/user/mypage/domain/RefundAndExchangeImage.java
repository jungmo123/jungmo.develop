package jungmo.shoppingmall.user.mypage.domain;

import java.util.*;

public class RefundAndExchangeImage {
	private String ordNum;
	private List<ImageList> reaList;
	
	public RefundAndExchangeImage(){}
	
	public RefundAndExchangeImage(String ordNum, List<ImageList> reaList) {
		this.ordNum = ordNum;
		this.reaList = reaList;
	}
	
	public String getOrdNum() {
		return ordNum;
	}
	public List<ImageList> getReaList() {
		return reaList;
	}
	public void setOrdNum(String ordNum) {
		this.ordNum = ordNum;
	}
	public void setReaList(List<ImageList> reaList) {
		this.reaList = reaList;
	}
}
