package jungmo.shoppingmall.admin.order.domain;

import java.sql.Date;
import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;

public class GoodsList {
	private int godNum;
	private int purNum;
	private int ordNum;
	private int godNormalPrice;
	private int godSellingPrice;
	private String godMainImageUrl;
	private String godListImageUrl;
	private int godStock;
	private int godSellingLimit;
	private String godName;
	private String godDisplayType;
	private Date godRegDate;
	private int godViewPoint;
	private int godcNum;
	private String godcName;
	private int godAmount;
	private String godDetailInfo;
	private String memo;
	private String godIntroduce;
	private GoodsCategories godc;
	private List<GoodsOption> godoList;
	
	public GoodsList(){}

	public GoodsList(int godNum, int ordNum, int godNormalPrice,
			int godSellingPrice, String godMainImageUrl,
			String godListImageUrl, int godStock, int godSellingLimit,
			String godName, String godDisplayType, Date godRegDate,
			int godViewPoint, int godcNum, String godcName, int godAmount,
			String godDetailInfo, String memo, String godIntroduce,
			GoodsCategories godc, List<GoodsOption> godoList) {
		this.godNum = godNum;
		this.ordNum = ordNum;
		this.godNormalPrice = godNormalPrice;
		this.godSellingPrice = godSellingPrice;
		this.godMainImageUrl = godMainImageUrl;
		this.godListImageUrl = godListImageUrl;
		this.godStock = godStock;
		this.godSellingLimit = godSellingLimit;
		this.godName = godName;
		this.godDisplayType = godDisplayType;
		this.godRegDate = godRegDate;
		this.godViewPoint = godViewPoint;
		this.godcNum = godcNum;
		this.godcName = godcName;
		this.godAmount = godAmount;
		this.godDetailInfo = godDetailInfo;
		this.memo = memo;
		this.godIntroduce = godIntroduce;
		this.godc = godc;
		this.godoList = godoList;
	}
	
	

	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}
	public int getGodAmount() {
		return godAmount;
	}
	public void setGodAmount(int godAmount) {
		this.godAmount = godAmount;
	}
	public int getGodNum() {
		return godNum;
	}
	public int getGodNormalPrice() {
		return godNormalPrice;
	}
	public int getGodSellingPrice() {
		return godSellingPrice;
	}
	public String getGodMainImageUrl() {
		return godMainImageUrl;
	}
	public String getGodListImageUrl() {
		return godListImageUrl;
	}
	public int getGodStock() {
		return godStock;
	}
	public int getGodSellingLimit() {
		return godSellingLimit;
	}
	public String getGodName() {
		return godName;
	}
	public String getGodDisplayType() {
		return godDisplayType;
	}
	public Date getGodRegDate() {
		return godRegDate;
	}
	public int getGodViewPoint() {
		return godViewPoint;
	}
	public int getGodcNum() {
		return godcNum;
	}
	public void setGodNum(int godNum) {
		this.godNum = godNum;
	}
	public void setGodNormalPrice(int godNormalPrice) {
		this.godNormalPrice = godNormalPrice;
	}
	public void setGodSellingPrice(int godSellingPrice) {
		this.godSellingPrice = godSellingPrice;
	}
	public void setGodMainImageUrl(String godMainImageUrl) {
		this.godMainImageUrl = godMainImageUrl;
	}
	public void setGodListImageUrl(String godListImageUrl) {
		this.godListImageUrl = godListImageUrl;
	}
	public void setGodStock(int godStock) {
		this.godStock = godStock;
	}
	public void setGodSellingLimit(int godSellingLimit) {
		this.godSellingLimit = godSellingLimit;
	}
	public void setGodName(String godName) {
		this.godName = godName;
	}
	public void setGodDisplayType(String godDisplayType) {
		this.godDisplayType = godDisplayType;
	}
	public void setGodRegDate(Date godRegDate) {
		this.godRegDate = godRegDate;
	}
	public void setGodViewPoint(int godViewPoint) {
		this.godViewPoint = godViewPoint;
	}
	public void setGodcNum(int godcNum) {
		this.godcNum = godcNum;
	}
	public GoodsCategories getGodc() {
		return godc;
	}
	public void setGodc(GoodsCategories godc) {
		this.godc = godc;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getGodDetailInfo() {
		return godDetailInfo;
	}
	public void setGodDetailInfo(String godDetailInfo) {
		this.godDetailInfo = godDetailInfo;
	}
	public String getGodcName() {
		return godcName;
	}
	public void setGodcName(String godcName) {
		this.godcName = godcName;
	}
	public String getGodIntroduce() {
		return godIntroduce;
	}
	public void setGodIntroduce(String godIntroduce) {
		this.godIntroduce = godIntroduce;
	}
	public List<GoodsOption> getGodoList() {
		return godoList;
	}
	public void setGodoList(List<GoodsOption> godoList) {
		this.godoList = godoList;
	}
	public int getPurNum() {
		return purNum;
	}
	public void setPurNum(int purNum) {
		this.purNum = purNum;
	}
}
