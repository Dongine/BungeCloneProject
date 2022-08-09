package com.bunge.dto;

public class JjimCountDto {
	private String nicknameFk;
	private int productNumberFk;
	public JjimCountDto(String nicknameFk, int productNumberFk) {
		super();
		this.nicknameFk = nicknameFk;
		this.productNumberFk = productNumberFk;
	}
	public String getNicknameFk() {
		return nicknameFk;
	}
	public void setNicknameFk(String nicknameFk) {
		this.nicknameFk = nicknameFk;
	}
	public int getProductNumberFk() {
		return productNumberFk;
	}
	public void setProductNumberFk(int productNumberFk) {
		this.productNumberFk = productNumberFk;
	}
	
	
}
