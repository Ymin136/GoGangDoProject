package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("review")
public class ReviewDTO {
	private int review_no;
	private String id;
	private String review_title;
	private String review_content;
	private String review_date;
	private int product_no;
	private String user_name;

	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int review_no, String id, String review_title, String review_content, String review_date,
			int product_no, String user_name) {
		super();
		this.review_no = review_no;
		this.id = id;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
		this.product_no = product_no;
		this.user_name = user_name;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "CommentDTO [review_no=" + review_no + ", id=" + id + ", review_title=" + review_title
				+ ", review_content=" + review_content + ", review_date=" + review_date + ", product_no=" + product_no
				+ ", user_name=" + user_name + "]";
	}
	
	
}
