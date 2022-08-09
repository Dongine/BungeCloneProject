package com.bunge.dto;

public class RecentlyDto {
	private int pno;
	private String img;
	
	public RecentlyDto() {}
	public RecentlyDto(int pno, String img) {
		this.pno = pno;
		this.img = img;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
