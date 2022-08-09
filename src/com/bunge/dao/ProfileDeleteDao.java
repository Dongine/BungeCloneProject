package com.bunge.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.ProfileDeleteDto;

public class ProfileDeleteDao {
	
	public String getProfileList(String nickname) throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "delete from profile where nickname_pk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		pstmt.executeUpdate();
		pstmt.close();
		return null;
	}
}
