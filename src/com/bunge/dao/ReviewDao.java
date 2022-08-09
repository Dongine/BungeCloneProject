package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bunge.dto.ReviewDto;

public class ReviewDao {
	public ArrayList<ReviewDto> getReviewList(String nickname) throws Exception{
		ArrayList<ReviewDto> ReviewList = new ArrayList<ReviewDto>();
		
		Connection conn = DBConnection.getConnection();
		String sql = "select nickname_opponent, writing from review where nickname_fk=?";
		String nicknameOpponent = "";
		String writing = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			nicknameOpponent = rs.getString("NICKNAME_OPPONENT");
			writing = rs.getString("WRITING");
			
			
			ReviewDto dto = new ReviewDto(nicknameOpponent,writing);
			ReviewList.add(dto);
		}
		rs.close();
		pstmt.close();
		return ReviewList;
	}
	
	public String getReviewCount(String nickname) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(nickname_fk) from review where nickname_fk=?";
		String ReviewCount="";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			ReviewCount = rs.getString(1);
		}
		rs.close();
		pstmt.close();
		return ReviewCount;
	}
	
	
	// 후기에 작성할 판매자 구매자 rno와 dno로 가져오기
		public String getPurchaseSeller(int rno, int dno) {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT purchase_fk, seller_fk FROM chat_room WHERE rno = ? AND dno = ?";
			String strRet = "";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rno);
				pstmt.setInt(2, dno);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					String purchaseFk = rs.getString("purchase_fk");
					String sellerFk = rs.getString("seller_fk");
					strRet = purchaseFk + "/" + sellerFk; 
				}
				rs.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return strRet;
		}
		
		// 후기작성
		public void insertReview(String nicknameFk, String writing, String nicknameOpponent) {
			Connection conn = DBConnection.getConnection();
			String sql = "INSERT INTO review(eno, nickname_fk, writing, date_of_writing, nickname_opponent) VALUES(review_seq.nextval, ?, ?, sysdate, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nicknameFk);
				pstmt.setString(2, writing);
				pstmt.setString(3, nicknameOpponent);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
}
