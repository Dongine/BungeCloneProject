package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ImageDao {
	public String getImageName(String nickname) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "select image from profile where nickname_pk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		String imageName = "";
		if(rs.next()) {
			imageName = rs.getString(1);
		}
		rs.close();
		pstmt.close();
		return imageName;
	}
}
