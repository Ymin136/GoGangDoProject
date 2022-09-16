package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("cart")
public class CartDTO {
	private int img_no;
	private String img_path;
	private String product_name;
	private int product_price;
	private int cart_price;
	private int order_ea;
	private String id;
	private int cart_no;

	public CartDTO() {
		super();
	}

	public CartDTO(int img_no, String img_path, String product_name, int product_price, int cart_price, int order_ea,
			String id, int cart_no) {
		super();
		this.img_no = img_no;
		this.img_path = img_path;
		this.product_name = product_name;
		this.product_price = product_price;
		this.cart_price = cart_price;
		this.order_ea = order_ea;
		this.id = id;
		this.cart_no = cart_no;
	}

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
	public int getCart_price() {
		return cart_price;
	}

	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}

	public int getOrder_ea() {
		return order_ea;
	}

	public void setOrder_ea(int order_ea) {
		this.order_ea = order_ea;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	@Override
	public String toString() {
		return "CartDTO [img_no=" + img_no + ", img_path=" + img_path + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", cart_price=" + cart_price + ", order_ea=" + order_ea + ", id="
				+ id + ", cart_no=" + cart_no + "]";
	}

}