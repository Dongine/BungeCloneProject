package com.bunge.dto;

public class ProfileDto {
	private String nicknamePk;
	private String openingDay;
	private int visit;
	private	int sell;
	private int delivery;
	public ProfileDto(String nicknamePk, String openingDay, int visit, int sell, int delivery) {
		super();
		this.nicknamePk = nicknamePk;
		this.openingDay = openingDay;
		this.visit = visit;
		this.sell = sell;
		this.delivery = delivery;
	}
	public String getNicknamePk() {
		return nicknamePk;
	}
	public void setNicknamePk(String nicknamePk) {
		this.nicknamePk = nicknamePk;
	}
	public String getOpeningDay() {
		return openingDay;
	}
	public void setOpeningDay(String openingDay) {
		this.openingDay = openingDay;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public int getSell() {
		return sell;
	}
	public void setSell(int sell) {
		this.sell = sell;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	
}
