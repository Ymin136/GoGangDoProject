package com.gogangdo.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ordermanage")
public class OrderManageDTO {
	private int order_no; 
	private String order_address;
	private Date order_date;
	private int order_total;
	private String id;
	
	public OrderManageDTO() {
		super();
	}

	public OrderManageDTO(int order_no, String order_address, Date order_date, int order_total, String id) {
		super();
		this.order_no = order_no;
		this.order_address = order_address;
		this.order_date = order_date;
		this.order_total = order_total;
		this.id = id;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getOrder_address() {
		return order_address;
	}

	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "OrderManageDTO [order_no=" + order_no + ", order_address=" + order_address + ", order_date="
				+ order_date + ", order_total=" + order_total + ", id=" + id + "]";
	}
	
}
