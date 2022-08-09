package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BlockPhoneNumberDao {
	public boolean getBlockPhoneList(String phone_number) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT COUNT(*) FROM one_to_one_inquiry o, profile p, profile p2 WHERE o.report_nickname_fk = p.nickname_pk AND o.reported_nickname_fk = p2.nickname_pk AND p2.phone_number = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone_number);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt("count(*)");
			System.out.println("getBlockList, result = " + result);
		}
		rs.close();
		pstmt.close();
		return result>=1;
	}
}
