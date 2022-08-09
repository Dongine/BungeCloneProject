package com.bunge.dto;

public class RealTimeChatDto {
	private int cno;
	private int rno;
	private String sayNicknameFk;
	private String say;
	private String sayTime;
	private int readCheck;
	private String imageUrl;
	
	public RealTimeChatDto(int cno, int rno, String sayNicknameFk, String say, String sayTime, int readCheck,
			String imageUrl) {
		super();
		this.cno = cno;
		this.rno = rno;
		this.sayNicknameFk = sayNicknameFk;
		this.say = say;
		this.sayTime = sayTime;
		this.readCheck = readCheck;
		this.imageUrl = imageUrl;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getSayNicknameFk() {
		return sayNicknameFk;
	}

	public void setSayNicknameFk(String sayNicknameFk) {
		this.sayNicknameFk = sayNicknameFk;
	}

	public String getSay() {
		return say;
	}

	public void setSay(String say) {
		this.say = say;
	}

	public String getSayTime() {
		return sayTime;
	}

	public void setSayTime(String sayTime) {
		this.sayTime = sayTime;
	}

	public int getReadCheck() {
		return readCheck;
	}

	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
}
