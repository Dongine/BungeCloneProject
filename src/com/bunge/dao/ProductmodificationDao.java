package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.ProductmodificationDto;

public class ProductmodificationDao {
	public ArrayList<ProductmodificationDto> getmodification(int productnumber_pk) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		ArrayList<ProductmodificationDto> listProduct = new ArrayList<ProductmodificationDto>();
		
		String sql = "select productnumber_pk, nickname_fk, productname, category, trading_area, exchange, price, delivery_charge, product_information, tag, quantity from product where productnumber_pk = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productnumber_pk);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int productnumberpk = rs.getInt("productnumber_pk");
			String nicknamefk = rs.getString("nickname_fk");
			String productname = rs.getString("productname");
			int price = rs.getInt("price");
			String exchange = rs.getString("exchange");
			String deliverycharge = rs.getString("delivery_charge");
			String tradingarea = rs.getString("trading_area");
			String productinformation = rs.getString("product_information");
			int quantity = rs.getInt("quantity");
			String tag = rs.getString("tag");
			ProductmodificationDto dto = new ProductmodificationDto(productnumberpk, nicknamefk, productname, price, exchange, deliverycharge, tradingarea,productinformation, quantity, tag);
			listProduct.add(dto);
		}
		rs.close();
		pstmt.close();
		return listProduct;

	
		
	}
}
