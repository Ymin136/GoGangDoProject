package com.gogangdo.dto;

import org.apache.ibatis.type.Alias;

@Alias("manager") 
public class ManagerDTO {
	String ID;
	String PW;
	public ManagerDTO(String iD, String pW) {
		super();
		ID = iD;
		PW = pW;
	}
	public String getID() {
		return ID;
	}
	@Override
	public String toString() {
		return "ManagerDTO [ID=" + ID + ", PW=" + PW + "]";
	}
	public ManagerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	
}
