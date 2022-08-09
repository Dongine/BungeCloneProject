package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductmodificationupdateDao {
	public void modificationupdateProduct(String imagename, String productname, int price, String productstate, String exchange, String deliverycharge, String tradingarea, String productinformation, int quantity, String tag, String category, int productnumber_pk) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "update product set imagename = ?, productname = ?, price = ?, productstate = ?, exchange = ?, delivery_charge = ?, trading_area = ?, product_information = ?, quantity = ?, tag = ?, category = ? where productnumber_pk = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, imagename);
		pstmt.setString(2, productname);
		pstmt.setInt(3, price);
		pstmt.setString(4,productstate);
		pstmt.setString(5, exchange);
		pstmt.setString(6,deliverycharge);
		pstmt.setString(7,tradingarea);
		pstmt.setString(8,productinformation);
		pstmt.setInt(9,quantity);
		pstmt.setString(10,tag);
		pstmt.setString(11, category);
		pstmt.setInt(12, productnumber_pk);
		pstmt.executeUpdate();
		pstmt.close();
	}
}
