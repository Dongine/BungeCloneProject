package com.bunge.dto;

public class InquiryDto {
	private int identificationNumberPk;
	private String typeSelect;
	private String detailsTypeSelect;
	private String registrationTime;
	public InquiryDto(int identificationNumberPk, String typeSelect, String detailsTypeSelect,
			String registrationTime) {
		super();
		this.identificationNumberPk = identificationNumberPk;
		this.typeSelect = typeSelect;
		this.detailsTypeSelect = detailsTypeSelect;
		this.registrationTime = registrationTime;
	}
	public int getIdentificationNumberPk() {
		return identificationNumberPk;
	}
	public void setIdentificationNumberPk(int identificationNumberPk) {
		this.identificationNumberPk = identificationNumberPk;
	}
	public String getTypeSelect() {
		return typeSelect;
	}
	public void setTypeSelect(String typeSelect) {
		this.typeSelect = typeSelect;
	}
	public String getDetailsTypeSelect() {
		return detailsTypeSelect;
	}
	public void setDetailsTypeSelect(String detailsTypeSelect) {
		this.detailsTypeSelect = detailsTypeSelect;
	}
	public String getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(String registrationTime) {
		this.registrationTime = registrationTime;
	}
	
	
}
