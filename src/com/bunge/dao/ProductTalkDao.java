package com.bunge.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bunge.dto.ProductTalkDto;

public class ProductTalkDao {
	
	// getProductListOrdered : 상품들의 목록을 리턴 (with정렬기준).  / 정렬기준 order: 최신순, 인기순, 저가순, 고가순 중에 하나.
	public ArrayList<ProductTalkDto> getProductListOrdered(String category, String nickname_Pk, String order) throws Exception {
		String strOrderBy = "";
		switch(order) {
		case "최신순":
			strOrderBy = "registration_date DESC";
			break;
		case "인기순":
			strOrderBy = "jjim_quantity DESC";
			break;
		case "저가순":
			strOrderBy = "price ASC";
			break;
		case "고가순":
			strOrderBy = "price DESC";
			break;
		}
		
		
		Connection conn = DBConnection.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		if("".equals(category)) {
			sql = "SELECT * FROM product WHERE NICKNAME_FK=? ORDER BY " + strOrderBy;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname_Pk); 
		} else {
			sql = "SELECT * FROM product WHERE NICKNAME_FK=? AND category LIKE '%' || (SELECT identification_value FROM category WHERE product_name=?) || '%' ORDER BY " + strOrderBy;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname_Pk);
			pstmt.setString(2, category);
		}
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProductTalkDto> tradeProductList = new ArrayList<ProductTalkDto>();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
//			String tradingArea = rs.getString("TRADING_AREA");
			String registrationDate = rs.getString("REGISTRATION_DATE");

			ProductTalkDto dto = new ProductTalkDto(nicknameFk, productNumberPK, imageName, productName, price, registrationDate);
			tradeProductList.add(dto);
		}
		return tradeProductList;
	}

	public ArrayList<ProductTalkDto> getProductJjimList(String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT p.*, j.date_of_writing FROM jjim j, product p WHERE j.productnumber_fk = p.productnumber_pk AND j.nickname_fk=? ORDER BY j.date_of_writing DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nicknamePk); 
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProductTalkDto> tradeProductList = new ArrayList<ProductTalkDto>();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
//			String tradingArea = rs.getString("TRADING_AREA");
			String registrationDate = rs.getString("REGISTRATION_DATE");

			ProductTalkDto dto = new ProductTalkDto(nicknameFk, productNumberPK, imageName, productName, price, registrationDate);
			tradeProductList.add(dto);
		}
		return tradeProductList;
	}
	
	
	
	public ArrayList<ProductTalkDto> getProductList(String category, String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		if("".equals(category)) {
			sql = "select * from product where NICKNAME_FK=? order by registration_date desc";
//			System.out.println("sql:" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk); 
		} else {
			sql = "select * from product where NICKNAME_FK=? and category like '%' || (select identification_value from category where product_name=?) || '%' order by registration_date desc";
//			System.out.println("sql:" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			pstmt.setString(2, category);
		}
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProductTalkDto> listResult = new ArrayList<ProductTalkDto>();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
			String registrationDate = rs.getString("REGISTRATION_DATE");

			ProductTalkDto dto = new ProductTalkDto(nicknameFk, productNumberPK, imageName, productName, price, registrationDate);
			listResult.add(dto);
		}
		return listResult;
	}
	
	public int getProductCnt(String category, String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		if("".equals(category)) {
			sql = "SELECT COUNT(*) FROM product WHERE NICKNAME_FK=? ORDER BY registration_date DESC";
//			System.out.println("sql:" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk); 
		} else {
			sql = "SELECT COUNT(*) FROM product WHERE NICKNAME_FK=? AND category like '%' || (SELECT identification_value FROM category WHERE product_name=?) || '%' ORDER BY registration_date DESC";
//			System.out.println("sql:" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			pstmt.setString(2, category);
		}
		ResultSet rs = pstmt.executeQuery();
		
		int cntResult = 0;
		if(rs.next()){
			cntResult = rs.getInt(1);
		}
		
		return cntResult;
	}
}
