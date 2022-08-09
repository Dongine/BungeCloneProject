package com.bunge.dto;

public class ProductDetailDto {
	private String nickname_fk;
	private String imagename;
	private String productname;
	private int price;
	private String productstate;
	private String exchange;
	private String delivery_charge;
	private String trading_area;
	private String product_information;
	private String tag;
	private String category;
	private String registration_date;
	private int jjim_quantity;
	private int hitcount;
	
	public ProductDetailDto(String nickname_fk, String imagename, String productname, int price, String productstate, String exchange,
			String delivery_charge, String trading_area, String product_information, String tag, String category,
			String registration_date, int jjim_quantity, int hitcount) {
		this.nickname_fk = nickname_fk;
		this.imagename = imagename;
		this.productname = productname;
		this.price = price;
		this.productstate = productstate;
		this.exchange = exchange;
		this.delivery_charge = delivery_charge;
		this.trading_area = trading_area;
		this.product_information = product_information;
		this.tag = tag;
		this.category = category;
		this.registration_date = registration_date;
		this.jjim_quantity = jjim_quantity;
		this.hitcount = hitcount;
	}

	public String getNickname_fk() {
		return nickname_fk;
	}

	public void setNickname_fk(String nickname_fk) {
		this.nickname_fk = nickname_fk;
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

	public String getProductstate() {
		return productstate;
	}

	public void setProductstate(String productstate) {
		this.productstate = productstate;
	}

	public String getExchange() {
		return exchange;
	}

	public void setExchange(String exchange) {
		this.exchange = exchange;
	}

	public String getDelivery_charge() {
		return delivery_charge;
	}

	public void setDelivery_charge(String delivery_charge) {
		this.delivery_charge = delivery_charge;
	}

	public String getTrading_area() {
		return trading_area;
	}

	public void setTrading_area(String trading_area) {
		this.trading_area = trading_area;
	}

	public String getProduct_information() {
		return product_information;
	}

	public void setProduct_information(String product_information) {
		this.product_information = product_information;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public int getJjim_quantity() {
		return jjim_quantity;
	}

	public void setJjim_quantity(int jjim_quantity) {
		this.jjim_quantity = jjim_quantity;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	
}
