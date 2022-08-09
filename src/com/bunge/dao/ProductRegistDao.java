package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductRegistDao {
	
	public void registProduct(String nickname_fk, String imagename, String productname, int price, String productstate, String exchange, String deliverycharge, String tradingarea, String productinformation, int quantity, String tag, String category, String safety_payment) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "insert into PRODUCT(PRODUCTNUMBER_PK,NICKNAME_FK,IMAGENAME,PRODUCTNAME,PRICE,PRODUCTSTATE,EXCHANGE,DELIVERY_CHARGE"
				+ ",TRADING_AREA,PRODUCT_INFORMATION,QUANTITY,TAG,CATEGORY,safety_payment,REGISTRATION_DATE,JJIM_QUANTITY,HITCOUNT,PURCHASE_STATUS) values(PRODUCT_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,0,0,'판매중')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname_fk);
		pstmt.setString(2, imagename);
		pstmt.setString(3, productname);
		pstmt.setInt(4, price);
		pstmt.setString(5,productstate);
		pstmt.setString(6, exchange);
		pstmt.setString(7,deliverycharge);
		pstmt.setString(8,tradingarea);
		pstmt.setString(9,productinformation);
		pstmt.setInt(10,quantity);
		pstmt.setString(11,tag);
		pstmt.setString(12, category);
		pstmt.setString(13, safety_payment);
		pstmt.executeUpdate();
		System.out.println("몇번?");
	}
}
