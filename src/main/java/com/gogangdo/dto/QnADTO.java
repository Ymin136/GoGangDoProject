package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class QnADTO {
	private int qna_no;
	private String id;
	private String qna_content;
	private String qna_date;
	private int product_no;
	private String product_name;
	private String answer_content;
	private String answer_date;
	private int answer_check;
	private int pageNo;
	public QnADTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public QnADTO(int qna_no, String id, String qna_content, String qna_date, int product_no, String product_name,
			String answer_content, String answer_date, int answer_check) {
		super();
		this.qna_no = qna_no;
		this.id = id;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.product_no = product_no;
		this.product_name = product_name;
		this.answer_content = answer_content;
		this.answer_date = answer_date;
		this.answer_check = answer_check;
	}
	
	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getAnswer_content() {
		return answer_content;
	}

	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}

	public int getAnswer_check() {
		return answer_check;
	}

	public void setAnswer_check(int answer_check) {
		this.answer_check = answer_check;
	}

	@Override
	public String toString() {
		return "QnADTO [qna_no=" + qna_no + ", id=" + id + ", qna_content=" + qna_content + ", qna_date=" + qna_date
				+ ", product_no=" + product_no + ", answer_content=" + answer_content + ", answer_date=" + answer_date
				+ ", answer_check=" + answer_check + "]";
	}
	
	
}
