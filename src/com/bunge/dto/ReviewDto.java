package com.bunge.dto;

public class ReviewDto {
	
	private String writing;
	private String nickname_opponent;
	public ReviewDto(String writing, String nickname_opponent) {
		super();
		this.writing = writing;
		this.nickname_opponent = nickname_opponent;
	}
	public String getWriting() {
		return writing;
	}
	public void setWriting(String writing) {
		this.writing = writing;
	}
	public String getNickname_opponent() {
		return nickname_opponent;
	}
	public void setNickname_opponent(String nickname_opponent) {
		this.nickname_opponent = nickname_opponent;
	}
	
}
