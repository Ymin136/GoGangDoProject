package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String user_no;
	private int user_grade;
	private String id;
	private String pw;
	private String user_name;
	private String email;
	
	public MemberDTO(String user_no, int user_grade, String id, String pw, String user_name, String email) {
		super();
		this.user_no = user_no;
		this.user_grade = user_grade;
		this.id = id;
		this.pw = pw;
		this.user_name = user_name;
		this.email = email;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public int getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_no=" + user_no + ", user_grade=" + user_grade + ", id=" + id + ", pw=" + pw
				+ ", user_name=" + user_name + ", email=" + email + "]";
	}
	
}
