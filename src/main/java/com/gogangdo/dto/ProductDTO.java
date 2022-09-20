package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductDTO {
	private int product_no;
	private int category_no;
	private String product_name;
	private int product_price;
	private int product_stock;
	private int product_sell;
	private String product_desc;
	private int sub_category_no;
	private String category_name;
	private String sub_category_name;
	private int img_no;
	
	
	
	public ProductDTO() {
		super();
	}


	public ProductDTO(int product_no, int category_no, String product_name, int product_price, int product_stock,
			int product_sell, String product_desc, int sub_category_no, String category_name, String sub_category_name,
			int img_no) {
		super();
		this.product_no = product_no;
		this.category_no = category_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_sell = product_sell;
		this.product_desc = product_desc;
		this.sub_category_no = sub_category_no;
		this.category_name = category_name;
		this.sub_category_name = sub_category_name;
		this.img_no = img_no;
	}
	
	public int getImg_no() {
		return img_no;
	}


	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public String getSub_category_name() {
		return sub_category_name;
	}


	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}









	public int getProduct_no() {
		return product_no;
	}




	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}




	public int getCategory_no() {
		return category_no;
	}




	public void setCategory_no(int category_no) {
		this.category_no = category_no;
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




	public int getProduct_stock() {
		return product_stock;
	}




	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}




	public int getProduct_sell() {
		return product_sell;
	}




	public void setProduct_sell(int product_sell) {
		this.product_sell = product_sell;
	}




	public String getProduct_desc() {
		return product_desc;
	}




	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}




	public int getSub_category_no() {
		return sub_category_no;
	}




	public void setSub_category_no(int sub_category_no) {
		this.sub_category_no = sub_category_no;
	}


	@Override
	public String toString() {
		return "ProductDTO [product_no=" + product_no + ", category_no=" + category_no + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_sell=" + product_sell + ", product_desc=" + product_desc + ", sub_category_no="
				+ sub_category_no + ", category_name=" + category_name + ", sub_category_name=" + sub_category_name
				+ ", img_no=" + img_no + "]";
	}




	

	

	
	
	
}
