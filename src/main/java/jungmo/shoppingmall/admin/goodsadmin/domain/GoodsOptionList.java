package jungmo.shoppingmall.admin.goodsadmin.domain;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class GoodsOptionList {
	private String optName;
	private List<GoodsOption> godoList;
	
	public GoodsOptionList(){}
	
	public GoodsOptionList(boolean t){
		godoList = new ArrayList<>();
	}
	
	public String getOptName() {
		return optName;
	}
	public List<GoodsOption> getGodoList() {
		return godoList;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public void setGodoList(List<GoodsOption> godoList) {
		this.godoList = godoList;
	}	
}
