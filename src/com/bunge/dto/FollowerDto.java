package com.bunge.dto;

public class FollowerDto {
		private String nickname_opponet;	
		private int following; 
		private int goodsQty;
		public FollowerDto(String nickname_opponet, int following, int goodsQty) {
			super();
			this.nickname_opponet = nickname_opponet;
			this.following = following;
			this.goodsQty = goodsQty;
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
	

}
