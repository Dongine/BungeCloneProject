package com.bunge.dto;

public class ProductViewDto {
	private String nicknameFk;  //NICKNAME_FK
	private int productNumber;	// (PK)
	private String imageName;  //IMAGENAME
	private String productName;  //PRODUCTNAME
	private int price;  //PRICE
	private String tradingArea;   //TRADING_AREA
	private String registrationDate;
	
	public ProductViewDto(String nicknameFk, int productNumber, String imageName, String productName, int price,
			String tradingArea, String registrationDate) {
		this.nicknameFk = nicknameFk;
		this.productNumber = productNumber;
		this.imageName = imageName;
		this.productName = productName;
		this.price = price;
		this.tradingArea = tradingArea;
		this.registrationDate = registrationDate;
	}

	public String getNicknameFk() {
		return nicknameFk;
	}

	public void setNicknameFk(String nicknameFk) {
		this.nicknameFk = nicknameFk;
	}
	
	public int getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTradingArea() {
		return tradingArea;
	}

	public void setTradingArea(String tradingArea) {
		this.tradingArea = tradingArea;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	
	
}
