package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JjimCountDao {
	
	public String getJjimcount(String nickname) {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(*) from jjim j, product p where j.productnumber_fk = p.productnumber_pk and j.nickname_fk=?";
		String jjimcount = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				jjimcount = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return jjimcount;
	}
}
