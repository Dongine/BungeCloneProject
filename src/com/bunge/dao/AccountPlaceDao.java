package com.bunge.dao;

import java.sql.Connection;


import com.bunge.dto.AccountPlaceDto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AccountPlaceDao {
	// 회원정보에 계좌정보 업데이트
	public void updateAccountSend(String bankName, String accountHolder, String accountNumber, String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE profile SET bank_name = ?, account_holder = ?, account_number = ? WHERE nickname_pk = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bankName);
			pstmt.setString(2, accountHolder);
			pstmt.setString(3, accountNumber);
			pstmt.setString(4, nicknamePk);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보에 주소정보 업데이트
	public void updateAddressSend(String addressName, String phoneNumber, String address, String detailedAddress, String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE profile SET address_name = ?, phone_number = ?, address = ?, detailed_address = ? WHERE nickname_pk = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addressName);
			pstmt.setString(2, phoneNumber);
			pstmt.setString(3, address);
			pstmt.setString(4, detailedAddress);
			pstmt.setString(5, nicknamePk);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보에 계좌정보 불러오기
	
	public String getAccountSelect(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT bank_name, account_holder, account_number FROM  profile WHERE nickname_pk = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String bankName = rs.getString("bank_name");
				String accountHolder = rs.getString("account_holder");
				String accountNumber = rs.getString("account_number");
				strRet = bankName + "/" + accountHolder + "/" + accountNumber;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	
	// 회원정보에 주소정보 불러오기
	public String getAddressSelect(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT address_name, phone_number, address, detailed_address FROM profile WHERE nickname_pk = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String addressName = rs.getString("address_name");
				String phoneNumber = rs.getString("phone_number");
				String address = rs.getString("address");
				String detailedAddress = rs.getString("detailed_address");
				strRet = addressName + "/" + phoneNumber + "/" + address + "/" + detailedAddress;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
		
	}
	
	// 회원정보에 계좌정보 삭제
	public void updateAccountToDelete(String bankName, String accountHolder, String accountNumber, String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE profile SET bank_name = ?, account_holder = ?, account_number = ? WHERE nickname_pk = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);
			pstmt.setString(2, null);
			pstmt.setString(3, null);
			pstmt.setString(4, nicknamePk);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원정보에 주소정보 삭제
	public void updateAddressToDelete(String addressName, String phoneNumber, String address, String detailedAddress, String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE profile SET address_name = ?, phone_number = ?, address = ?, detailed_address = ? WHERE nickname_pk = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);
			pstmt.setString(2, null);
			pstmt.setString(3, null);
			pstmt.setString(4, null);
			pstmt.setString(5, nicknamePk);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
