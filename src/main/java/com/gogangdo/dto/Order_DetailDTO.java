package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("orderdetail")
public class Order_DetailDTO {
	private int img_no;
	private String img_path;
	private String product_name;
	private int order_no;
	private int order_detail_no;
	private int product_no;
	private int order_ea;
	private int order_total;
	private int product_price;
	private String id;
	
	public Order_DetailDTO() {
		super();
	}
	
	public Order_DetailDTO(int img_no, String img_path, int order_no, int order_detail_no, int product_no, int order_ea,
			int order_total, int product_price, String id, String product_name) {
		super();
		this.img_no = img_no;
		this.img_path = img_path;
		this.order_no = order_no;
		this.order_detail_no = order_detail_no;
		this.product_no = product_no;
		this.order_ea = order_ea;
		this.order_total = order_total;
		this.product_price = product_price;
		this.id = id;
		this.product_name = product_name;
	}

	public Order_DetailDTO(int order_no, int order_detail_no, int product_no, int order_ea, int product_price, String product_name) {
		super();
		this.order_no = order_no;
		this.order_detail_no = order_detail_no;
		this.product_no = product_no;
		this.order_ea = order_ea;
		this.product_price = product_price;
		this.product_name = product_name;
	}
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public int getOrder_detail_no() {
		return order_detail_no;
	}
	public void setOrder_detail_no(int order_detail_no) {
		this.order_detail_no = order_detail_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getOrder_ea() {
		return order_ea;
	}
	public void setOrder_ea(int order_ea) {
		this.order_ea = order_ea;
	}
	public int getOrder_total() {
		return order_total;
	}
	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "OrderDTO [img_no=" + img_no + ", img_path=" + img_path + ", product_name=" + product_name
				+ ", order_no=" + order_no + ", order_detail_no=" + order_detail_no + ", product_no=" + product_no
				+ ", order_ea=" + order_ea + ", order_total=" + order_total + ", product_price=" + product_price
				+ ", id=" + id + "]";
	}

	
}
