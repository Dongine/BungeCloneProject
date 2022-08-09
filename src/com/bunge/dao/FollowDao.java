package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.FollowDto;

public class FollowDao {
	public ArrayList<FollowDto> getFollowList(String nickname) throws Exception{
		ArrayList<FollowDto> Followlist = new ArrayList<FollowDto>();
		
		Connection conn = DBConnection.getConnection();
//		String sql = "select distinct p.following, f.nickname_opponet\r\n"
//				+ "from following f, profile p\r\n"
//				+ "where p.nickname_pk=? and f.nickname_fk=?";
		String sql = "select * from following where nickname_fk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			//int following = rs.getInt("FOLLOWING");
			String nickname_opponet = rs.getString("NICKNAME_OPPONET");
			
			int following = 0;	//그상점팔로잉개수
			int goodQty = 0;	//등록수
			int[] arrProductNumberPK = new int[3];
			
			// 팔로잉개수
			String sql2 = "select following from profile where nickname_pk=?";
			//pstmt2..
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, nickname_opponet);
			ResultSet rs2 = pstmt2.executeQuery();
			// rs2 = ....
			if(rs2.next()) {
				following = rs2.getInt(1);
			}
			rs2.close();
			pstmt2.close();
			
			// 상품 등록수
			// sql2, pstmt2, rs2
			String sql3 = "select count(*) from product where nickname_fk=?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, nickname_opponet);
			ResultSet rs3 = pstmt3.executeQuery();
			
			if(rs3.next()) {
				goodQty = rs3.getInt(1);
			}
			rs3.close();
			pstmt3.close();
			// arrProductNumberPK
			// sql2, pstmt2, rs2
			String sql4 = "select productnumber_pk from product where nickname_fk=?";
			PreparedStatement pstmt4 = conn.prepareStatement(sql4);
			pstmt4.setString(1, nickname_opponet);
			ResultSet rs4 = pstmt4.executeQuery();
			for(int i=0; i<=2; i++){
				if(rs4.next()==false) {
					break;
				}
				arrProductNumberPK[i] = rs4.getInt(1);
			}
			rs4.close();
			pstmt4.close();
			
			FollowDto dto = new FollowDto(nickname_opponet, following, goodQty, arrProductNumberPK);
//			System.out.println(getImageNameByPno(dto.getArrProductNumber()[0]));
//			System.out.println(getImageNameByPno(dto.getArrProductNumber()[1]));
//			System.out.println(getImageNameByPno(dto.getArrProductNumber()[2]));
			Followlist.add(dto);
		}
		return Followlist;
	}

	public String getImageNameByPno(int productNumber) throws Exception {
		// 52 파라미터 ---> "bbr-st.png" 리턴.
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT imagename FROM product WHERE productnumber_pk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productNumber);
		ResultSet rs = pstmt.executeQuery();
		String imgName = "";
		if(rs.next()) {
			imgName = rs.getString("imagename");
		}
		rs.close();
		pstmt.close();
		return imgName;
	}
	public String getFollowCount(String nickname) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "select count(nickname_fk) from following where nickname_FK=?";
		String followCount = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				followCount = rs.getString(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return followCount;
	}		
}
