package com.training.vo;

import java.util.Set;

import com.training.formbean.ShoppingCartGoods;

public class ShoppingCartGoodsInfo {
	private int totalAmount;
	
	private Set<ShoppingCartGoods> shoppingCartGoods;

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Set<ShoppingCartGoods> getShoppingCartGoods() {
		return shoppingCartGoods;
	}

	public void setShoppingCartGoods(Set<ShoppingCartGoods> shoppingCartGoods) {
		this.shoppingCartGoods = shoppingCartGoods;
	}
	
}
