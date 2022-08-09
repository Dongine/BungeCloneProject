package com.bunge.dto;

public class JjimDto {
	private String nicknamefk;
	private int productnumberfk;
	public JjimDto(String nicknamefk, int productnumberfk) {
		this.nicknamefk = nicknamefk;
		this.productnumberfk = productnumberfk;
	}
	public String getNicknamefk() {
		return nicknamefk;
	}
	public void setNicknamefk(String nicknamefk) {
		this.nicknamefk = nicknamefk;
	}
	public int getProductnumberfk() {
		return productnumberfk;
	}
	public void setProductnumberfk(int productnumberfk) {
		this.productnumberfk = productnumberfk;
	}
}
