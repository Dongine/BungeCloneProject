package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JjimDao {		//상품번호로 닉넴(판매자),    닉네임으로 로그인한사람(구매자)
	public void jjiminsert(int productnumberfk, String nickname) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "insert into jjim values(?,?,sysdate)";
		try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		pstmt.setInt(2, productnumberfk);
		pstmt.executeUpdate();
		pstmt.close();
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	public void jjimdelete(String nickname, int productnumberfk) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "delete from jjim where productnumber_fk= ? and nickname_fk = ?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productnumberfk);
		pstmt.setString(2, nickname);
		pstmt.executeUpdate();
		pstmt.close();
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
	}
	
	// jjim : returns 1 / no jjim : returns 0
	public int isJjim(int productnumber, String nickname) throws Exception {
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT count(*) FROM jjim WHERE nickname_fk=? AND productnumber_fk=?";
		int cnt = -1;    // -1 : 초기값일 뿐.
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setInt(2, productnumber);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int getJjimCount(int productnumber) {
		Connection conn = DBConnection.getConnection();
		//String sql = "select count(*) from jjim j, product p where j.productnumber_fk = p.productnumber_pk and j.nickname_fk=?";
		String sql = "SELECT count(*) FROM jjim WHERE productnumber_fk=?";
		int jjimcount = -1;	   // -1 : 초기값일 뿐. 절대로 화면에 나와서는 안됨!
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productnumber);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				jjimcount = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return jjimcount;
	}
}
