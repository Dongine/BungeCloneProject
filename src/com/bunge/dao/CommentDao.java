package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bunge.dto.CommentDto;

public class CommentDao {
	
	public ArrayList<CommentDto> getCommentLiST(String nickname) throws Exception{
		Connection conn = DBConnection.getConnection();
		String sql = "select bno, nickname_fk, content from PROFILE_COMMENT where NICKNAME_FK=? ORDER BY BNO";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,nickname);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<CommentDto> listComment = new ArrayList<CommentDto>();
		
		while(rs.next()) {
			int bno = rs.getInt("BNO");
			String nicknameFk = rs.getString("NICKNAME_FK");
			String content = rs.getString("CONTENT");
			
			CommentDto dto = new CommentDto(bno,nickname,content);
			listComment.add(dto);
		}
		rs.close();
		pstmt.close();
		return listComment;
	}
	
	public String getCommentCount(String nickname) {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(*) from profile_comment where NICKNAME_FK=?";
		String commentCount = "";
		
		try {
			PreparedStatement pstmt2 = conn.prepareStatement(sql);
			pstmt2.setString(1, nickname);
			ResultSet rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				commentCount = rs2.getString(1);
			}
			rs2.close();
			pstmt2.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return commentCount;
	}
}
