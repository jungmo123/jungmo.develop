package jungmo.shoppingmall.user.mypage.domain;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;

public class CartList {
	private String cartNum;
	private List<GoodsOption> godoList;
	
	public CartList(){}
	
	public CartList(String cartNum) {
		this.cartNum = cartNum;
		this.godoList = new ArrayList<>();
	}

	public String getCartNum() {
		return cartNum;
	}
	public List<GoodsOption> getGodoList() {
		return godoList;
	}
	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}
	public void setGodoList(List<GoodsOption> godoList) {
		this.godoList = godoList;
	}
}
