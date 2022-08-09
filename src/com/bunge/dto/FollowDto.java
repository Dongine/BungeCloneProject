package com.bunge.dto;

public class FollowDto {
	private String nickname_opponet;  // 팔로우 당하는 상점의 닉네임.
	private int following;	// 팔로우 당하는 그 상점의 팔로잉 수.
	private int goodsQty;   // 그 상점의 등록 상품 수.
	private int[] arrProductNumber;   // size:3
	public FollowDto(String nickname_opponet, int following, int goodsQty, int[] arrProductNumber) {
		super();
		this.nickname_opponet = nickname_opponet;
		this.following = following;
		this.goodsQty = goodsQty;
		this.arrProductNumber = arrProductNumber;
	}
	public String getNickname_opponet() {
		return nickname_opponet;
	}
	public void setNickname_opponet(String nickname_opponet) {
		this.nickname_opponet = nickname_opponet;
	}
	public int getFollowing() {
		return following;
	}
	public void setFollowing(int following) {
		this.following = following;
	}
	public int getGoodsQty() {
		return goodsQty;
	}
	public void setGoodsQty(int goodsQty) {
		this.goodsQty = goodsQty;
	}
	public int[] getArrProductNumber() {
		return arrProductNumber;
	}
	public void setArrProductNumber(int[] arrProductNumber) {
		this.arrProductNumber = arrProductNumber;
	}
	
	
}
