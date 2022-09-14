package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartDTO {
	private int cart_no;
	private int product_no;
	private int id;
	private int cart_price;
	private int cart_ea;
	
	public CartDTO() {
		super();
	}

	public CartDTO(int cart_no, int product_no, int id, int cart_price, int cart_ea) {
		super();
		this.cart_no = cart_no;
		this.product_no = product_no;
		this.id = id;
		this.cart_price = cart_price;
		this.cart_ea = cart_ea;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id= id;
	}

	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

	public int getCart_ea() {
		return cart_ea;
	}

	public void setCart_ea(int cart_ea) {
		this.cart_ea = cart_ea;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", product_no=" + product_no + ", id=" + id+ ", cart_price="
				+ cart_price + ", cart_ea=" + cart_ea + "]";
	}
	
}
