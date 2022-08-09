package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.FollowerDto;

public class FollowerDao {
	public ArrayList<FollowerDto> getFollowerList(String nickname) throws SQLException{
		ArrayList<FollowerDto> FollowerList = new ArrayList<FollowerDto>();
		Connection conn = DBConnection.getConnection();	
		
		String sql = "select nickname_fk, nickname_opponet from following where nickname_opponet=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String nickname_opponet = rs.getString("NICKNAME_FK");
			int following = 0;
			int goodQty = 0;
			
			String sql2 = "select following from profile where nickname_pk=?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, nickname_opponet);
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				following = rs2.getInt(1);
			}
			rs2.close();
			pstmt2.close();
			
			String sql3 = "select count(*) from product where nickname_fk=?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, nickname_opponet);
			ResultSet rs3 = pstmt3.executeQuery();
			if(rs3.next()) {
				goodQty = rs3.getInt(1);
			}
			rs3.close();
			pstmt3.close();
			
			FollowerDto dto = new FollowerDto(nickname_opponet, following, goodQty);
			FollowerList.add(dto);
		}
		return FollowerList;
	}
	public String getFollowerCount(String nickname) throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(nickname_fk) from following where nickname_opponet=?";
		String followCount ="";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				followCount = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return followCount;
	}
}
