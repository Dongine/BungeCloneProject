package com.bunge.dto;

public class ProductTalkDto {
	private String nicknameFk;  //NICKNAME_FK
	private int productNumber;	// (PK)
	private String imageName;  //IMAGENAME
	private String productName;  //PRODUCTNAME
	private int price;  //PRICE
	private String registrationDate;
	
	public ProductTalkDto(String nicknameFk, int productNumber, String imageName, String productName, int price,
			String registrationDate) {
		this.nicknameFk = nicknameFk;
		this.productNumber = productNumber;
		this.imageName = imageName;
		this.productName = productName;
		this.price = price;
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
	
	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	
	
}
