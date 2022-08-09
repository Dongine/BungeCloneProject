package com.bunge.dto;

public class ChatRoomDto {
	private int rno;
	private String purchaseFk;
	private String sellerFk;
	private String closeYn;
//	private int crDno;	// 거래번호(chat room)
//	private int dlDno;	// 거래번호(dl 거래중인)
//	private int productnumber;
	private int dno;

	public ChatRoomDto(int rno, String purchaseFk, String sellerFk, String closeYn, int dno) {
		this.rno = rno;
		this.purchaseFk = purchaseFk;
		this.sellerFk = sellerFk;
		this.closeYn = closeYn;
		this.dno = dno;
	}
//	public ChatRoomDto(int rno, String purchaseFk, String sellerFk, String closeYn, int crDno, int dlDno, int productnumber) {
//		super();
//		this.rno = rno;
//		this.purchaseFk = purchaseFk;
//		this.sellerFk = sellerFk;
//		this.closeYn = closeYn;
//		this.crDno = crDno;
//		this.dlDno = dlDno;
//		this.productnumber = productnumber;
//	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getPurchaseFk() {
		return purchaseFk;
	}

	public void setPurchaseFk(String purchaseFk) {
		this.purchaseFk = purchaseFk;
	}

	public String getSellerFk() {
		return sellerFk;
	}

	public void setSellerFk(String sellerFk) {
		this.sellerFk = sellerFk;
	}

	public String getCloseYn() {
		return closeYn;
	}

	public void setCloseYn(String closeYn) {
		this.closeYn = closeYn;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	
	
}
