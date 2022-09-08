package com.gogangdo.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

@Alias("file")
public class FileDTO {
	private int img_no;
	private String img_path;
	private String img_name;
	private int thumbnail;
	private int product_no;
	public FileDTO() {
		super();
	}
	public FileDTO(int img_no, String img_path, String img_name, int thumbnail, int product_no) {
		super();
		this.img_no = img_no;
		this.img_path = img_path;
		this.img_name = img_name;
		this.thumbnail = thumbnail;
		this.product_no = product_no;
	}
	
	public FileDTO(File file, int product_no, int img_no) {
		this.img_path = file.getAbsolutePath();
		this.img_name = file.getName();
		this.product_no = product_no;
		this.img_no = img_no;
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
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public int getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(int thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	@Override
	public String toString() {
		return "FileDTO [img_no=" + img_no + ", img_path=" + img_path + ", img_name=" + img_name + ", thumbnail="
				+ thumbnail + ", product_no=" + product_no + "]";
	}
	
	
	
	
}




