package com.bunge.dto;

public class ProductmodificationDto {
	private int productnumber_pk;
	private String nickname_fk;
	private String productname;
	private int price;
	private String exchange;
	private String delivery_charge;
	private String trading_area;
	private String product_information;
	private int quantity;
	private String tag;
	
	public ProductmodificationDto(int productnumber_pk, String nickname_fk, String productname, int price, String exchange,
			String delivery_charge, String trading_area, String product_information, int quantity, String tag
			) {
		this.productnumber_pk = productnumber_pk;
		this.nickname_fk = nickname_fk;
		this.productname = productname;
		this.price = price;
		this.exchange = exchange;
		this.delivery_charge = delivery_charge;
		this.trading_area = trading_area;
		this.product_information = product_information;
		this.quantity = quantity;
		this.tag = tag;
	}

	public int getProductnumber_pk() {
		return productnumber_pk;
	}

	public void setProductnumber_pk(int productnumber_pk) {
		this.productnumber_pk = productnumber_pk;
	}

	public String getNickname_fk() {
		return nickname_fk;
	}

	public void setNickname_fk(String nickname_fk) {
		this.nickname_fk = nickname_fk;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
}
