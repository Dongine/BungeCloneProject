package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SaleDao {
	public String getSaleCategory1(String category1) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "select IDENTIFICATION_VALUE from category where product_name = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		String iv = "";
		pstmt.setString(1, category1);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			iv = rs.getString(1);
		}
		return iv;
	}
	
	public String getSaleCategory2(String category1Code, String category2) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT identification_value FROM category WHERE parent_value=? AND product_name = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		String iv = "";
		pstmt.setString(1, category1Code);
		pstmt.setString(2, category2);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			iv = rs.getString(1);
		}
		return iv;
	}
	
	public String getSaleCategory3(String category2Code, String category3) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT identification_value FROM category WHERE parent_value=? AND product_name = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		String iv = "";
		pstmt.setString(1, category2Code);
		pstmt.setString(2, category3);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			iv = rs.getString(1);
		}
		return iv;
	}
}
