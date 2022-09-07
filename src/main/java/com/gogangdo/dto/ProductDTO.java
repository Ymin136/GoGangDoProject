package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("product")
public class ProductDTO {
	private int productNo;
	private int categoryNo;
	private int subcategoryNo;
	private String productName;
	private String productContent;
	private int productPrice;
	private int productStock;
	private int productSell;
	
	public ProductDTO() {
		super();
	}

	public ProductDTO(int productNo, int categoryNo, int subcategoryNo, String productName, String productContent,
			int productPrice, int productStock, int productSell) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.subcategoryNo = subcategoryNo;
		this.productName = productName;
		this.productContent = productContent;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productSell = productSell;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getSubcategoryNo() {
		return subcategoryNo;
	}

	public void setSubcategoryNo(int subcategoryNo) {
		this.subcategoryNo = subcategoryNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public int getProductSell() {
		return productSell;
	}

	public void setProductSell(int productSell) {
		this.productSell = productSell;
	}

	@Override
	public String toString() {
		return "ProductDTO [productNo=" + productNo + ", categoryNo=" + categoryNo + ", subcategoryNo=" + subcategoryNo
				+ ", productName=" + productName + ", productContent=" + productContent + ", productPrice="
				+ productPrice + ", productStock=" + productStock + ", productSell=" + productSell + "]";
	}
	
	
	
}
