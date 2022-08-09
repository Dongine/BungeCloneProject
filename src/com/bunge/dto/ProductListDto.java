package com.bunge.dto;



public class ProductListDto {
	private int productnumber_pk;
	private String nickname_fk;
	private String imagename;
	private String productname;
	private int price;
	private String trading_area;
	private String registration_date;
	private String purchase_status;
	
	public ProductListDto(int productnumber_pk, String nickname_fk ,String imagename, String productname, int price, String trading_area, String registration_date, String purchase_status) {
		this.productnumber_pk = productnumber_pk;
		this.nickname_fk = nickname_fk;
		this.imagename = imagename;
		this.productname = productname;
		this.price = price;
		this.trading_area = trading_area;
		this.registration_date = registration_date;
		this.purchase_status = purchase_status;
	}
	
	public String getPurchase_status() {
		return purchase_status;
	}

	public void setPurchase_status(String purchase_status) {
		this.purchase_status = purchase_status;
	}

	public String getNickname_fk() {
		return nickname_fk;
	}

	public void setNickname_fk(String nickname_fk) {
		this.nickname_fk = nickname_fk;
	}

	public int getProductnumber_pk() {
		return productnumber_pk;
	}

	public void setProductnumber_pk(int productnumber_pk) {
		this.productnumber_pk = productnumber_pk;
	}

	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTrading_area() {
		return trading_area;
	}
	public void setTrading_area(String trading_area) {
		this.trading_area = trading_area;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	
	
	
}
