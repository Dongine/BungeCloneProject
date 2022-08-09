package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StoreDao {	
	public String getOpeningDay(String nickname) {
		Connection conn = DBConnection.getConnection(); //DBConnection.java를 가져옴
		String sql = "select trunc(sysdate-opening_day) FROM PROFILE where NICKNAME_PK=?";
		String openingDay = "";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				openingDay = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return openingDay;
	}
	public int getVisits(String nickname) {
		Connection conn = DBConnection.getConnection(); 
		String sql = "select visits FROM PROFILE where NICKNAME_PK=?";//UPDATE PROFILE SET VISITS = (SELECT NVL(MAX(visits), '0') + 1 FROM  profile)WHERE NICKNAME_PK=?
		int visits = 0;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				visits = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return visits;
	}
	public int getvisitsUpdate(String nickname) {
		Connection conn = DBConnection.getConnection();
		String sql = "update profile set visits=visits+1 where nickname_pk=?";
		int visitsUpdate = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return visitsUpdate;
	}
	public int getSell(String nickname) {
		Connection conn = DBConnection.getConnection(); 
		String sql = "select sell FROM PROFILE where NICKNAME_PK=?";
		int sell = 0;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				sell = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return sell;
	}
	public int getDelivery(String nickname) {
		Connection conn = DBConnection.getConnection(); 
		String sql = "select delivery FROM PROFILE where NICKNAME_PK=?";
		int delivery = 0;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				delivery = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return delivery;
	}
	public String getWriting(String nickname) {
		Connection conn = DBConnection.getConnection(); 
		String sql = "select writing FROM PROFILE where NICKNAME_PK=?";
		String writing = "";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				writing = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return writing;
	}
	public String getContent(String nickname) {
		Connection conn = DBConnection.getConnection();
		String sql = "select content from PROFILE_COMMENT where NICKNAME_FK=?";
		String content = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				content = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return content;
	}
	public String getNicknameFk(String nickname) {
		Connection conn = DBConnection.getConnection();
		String sql = "select nickname_fk from PROFILE_COMMENT where NICKNAME_FK=?";
		String nicknameFk = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nicknameFk = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return nicknameFk;
	}
}
