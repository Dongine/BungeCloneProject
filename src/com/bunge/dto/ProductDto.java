package com.bunge.dto;

public class ProductDto {
	private int productnumberpk;
	private String nickname_fk;
	private String imagename;
	private String productname;
	private int price;
	private String product;
	private String productstate;
	private String exchange;
	private String deleverycharge;
	private String tradingarea;
	private String productinformation;
	private int quantity;
	private String safetypayment;
	private String tag;
	private String category;
	private String registrationdate;
	private String lastupdate;
	private String commentsnickname;
	private String commentdate;
	private String commentscontent;
	private String inquirycontents;
	private int jjimquantity;
	private int hitcount;
	private String purchasestatus;
	private String purchaser;
	
	public ProductDto(int productnumberpk, String nickname_fk, String imagename, String productname, int price,
			String product, String productstate, String exchange, String deleverycharge, String tradingarea,
			String productinformation, int quantity, String safetypayment, String tag, String category,
			String registrationdate, String lastupdate, String commentsnickname, String commentdate,
			String commentscontent, String inquirycontents, int jjimquantity, int hitcount, String purchasestatus,
			String purchaser) {
		super();
		this.productnumberpk = productnumberpk;
		this.nickname_fk = nickname_fk;
		this.imagename = imagename;
		this.productname = productname;
		this.price = price;
		this.product = product;
		this.productstate = productstate;
		this.exchange = exchange;
		this.deleverycharge = deleverycharge;
		this.tradingarea = tradingarea;
		this.productinformation = productinformation;
		this.quantity = quantity;
		this.safetypayment = safetypayment;
		this.tag = tag;
		this.category = category;
		this.registrationdate = registrationdate;
		this.lastupdate = lastupdate;
		this.commentsnickname = commentsnickname;
		this.commentdate = commentdate;
		this.commentscontent = commentscontent;
		this.inquirycontents = inquirycontents;
		this.jjimquantity = jjimquantity;
		this.hitcount = hitcount;
		this.purchasestatus = purchasestatus;
		this.purchaser = purchaser;
	}

	public ProductDto(int productnumberpk, String imagename,String productstate,String productname, int price, String safetypayment, int jjimquantity, String lastupdate) {
		this.productnumberpk = productnumberpk;
		this.imagename = imagename;
		this.productstate = productstate;
		this.productname = productname;
		this.price = price;
		this.safetypayment = safetypayment;
		this.jjimquantity = jjimquantity;
		this.lastupdate = lastupdate;
	}

	public int getProductnumberpk() {
		return productnumberpk;
	}

	public void setProductnumberpk(int productnumberpk) {
		this.productnumberpk = productnumberpk;
	}

	public String getNicknamefk() {
		return nickname_fk;
	}

	public void setNicknamefk(String nicknamefk) {
		this.nickname_fk = nicknamefk;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProductstate() {
		return productstate;
	}

	public void setProductstate(String productstate) {
		this.productstate = productstate;
	}

	public String getExchange() {
		return exchange;
	}

	public void setExchange(String exchange) {
		this.exchange = exchange;
	}

	public String getDeleverycharge() {
		return deleverycharge;
	}

	public void setDeleverycharge(String deleverycharge) {
		this.deleverycharge = deleverycharge;
	}

	public String getTradingarea() {
		return tradingarea;
	}

	public void setTradingarea(String tradingarea) {
		this.tradingarea = tradingarea;
	}

	public String getProductinformation() {
		return productinformation;
	}

	public void setProductinformation(String productinformation) {
		this.productinformation = productinformation;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSafetypayment() {
		return safetypayment;
	}

	public void setSafetypayment(String safetypayment) {
		this.safetypayment = safetypayment;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRegistrationdate() {
		return registrationdate;
	}

	public void setRegistrationdate(String registrationdate) {
		this.registrationdate = registrationdate;
	}

	public String getLastupdate() {
		return lastupdate;
	}

	public void setLastupdate(String lastupdate) {
		this.lastupdate = lastupdate;
	}

	public String getCommentsnickname() {
		return commentsnickname;
	}

	public void setCommentsnickname(String commentsnickname) {
		this.commentsnickname = commentsnickname;
	}

	public String getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}

	public String getCommentscontent() {
		return commentscontent;
	}

	public void setCommentscontent(String commentscontent) {
		this.commentscontent = commentscontent;
	}

	public String getInquirycontents() {
		return inquirycontents;
	}

	public void setInquirycontents(String inquirycontents) {
		this.inquirycontents = inquirycontents;
	}

	public int getJjimquantity() {
		return jjimquantity;
	}

	public void setJjimquantity(int jjimquantity) {
		this.jjimquantity = jjimquantity;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getPurchasestatus() {
		return purchasestatus;
	}

	public void setPurchasestatus(String purchasestatus) {
		this.purchasestatus = purchasestatus;
	}

	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	
	
}
