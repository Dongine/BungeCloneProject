package com.bunge.dto;

public class CommentDto {
	private int bno;
	private String nicknameFk;
	private String content;
	public CommentDto(int bno, String nicknameFk, String content) {
		super();
		this.bno = bno;
		this.nicknameFk = nicknameFk;
		this.content = content;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getNicknameFk() {
		return nicknameFk;
	}
	public void setNicknameFk(String nicknameFk) {
		this.nicknameFk = nicknameFk;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
