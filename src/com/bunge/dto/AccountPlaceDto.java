package com.bunge.dto;

public class AccountPlaceDto {
	private String nicknamePk;
	private String bankName;
	private String accountHolder;
	private String accountNumber;
	private String addressName;
	private String address;
	private String detailedAddress;
	private String phoneNumber;
	public AccountPlaceDto(String nicknamePk, String bankName, String accountHolder, String accountNumber, String addressName,
			String address, String detailedAddress, String phoneNumber) {
		super();
		this.nicknamePk = nicknamePk;
		this.bankName = bankName;
		this.accountHolder = accountHolder;
		this.accountNumber = accountNumber;
		this.addressName = addressName;
		this.address = address;
		this.detailedAddress = detailedAddress;
		this.phoneNumber = phoneNumber;
	}
	public String getNicknamepk() {
		return nicknamePk;
	}
	public void setNicknamepk(String nicknamePk) {
		this.nicknamePk = nicknamePk;
	}
	public String getBankname() {
		return bankName;
	}
	public void setBankname(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountholder() {
		return accountHolder;
	}
	public void setAccountholder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	public String getAccountnumber() {
		return accountNumber;
	}
	public void setAccountnumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAddressname() {
		return addressName;
	}
	public void setAddressname(String addressName) {
		this.addressName = addressName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailedaddress() {
		return detailedAddress;
	}
	public void setDetailedaddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}
	public String getPhonenumber() {
		return phoneNumber;
	}
	public void setPhonenumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
}
