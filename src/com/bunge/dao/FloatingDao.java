package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FloatingDao {
	public String getImagenameFromProductNumber(int productNumber) throws Exception {
		Connection conn = DBConnection.getConnection();
		
		String sql = "select imagename from product where productnumber_pk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productNumber);
		ResultSet rs = pstmt.executeQuery();
		String ret = null;
		if(rs.next()) {
			ret = rs.getString(1);
		}
		rs.close();
		pstmt.close();
		return ret;
	}
}
