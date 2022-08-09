package com.bunge.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bunge.dto.ProductDto;
import com.bunge.dto.ProductViewDto;

public class ProductDao {
	
	// getProductListOrdered : 상품들의 목록을 리턴 (with정렬기준).  / 정렬기준 order: 최신순, 인기순, 저가순, 고가순 중에 하나.
	public ArrayList<ProductViewDto> getProductListOrdered(String category, String nicknamePk, String order) throws Exception {
		ArrayList<ProductViewDto> listResult = new ArrayList<ProductViewDto>();
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
			sql = "select * from product where NICKNAME_FK=? order by " + strOrderBy;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk); 
		} else {
			sql = "select * from product where NICKNAME_FK=? and category like '%' || (select identification_value from category where product_name=?) || '%' order by " + strOrderBy;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			pstmt.setString(2, category);
		}
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
			String tradingArea = rs.getString("TRADING_AREA");
			
			/*
			 * String sql2 =
			 * "select trunc(sysdate-REGISTRATION_DATE) FROM product where NICKNAME_FK=?";
			 * PreparedStatement pstmt2 = conn.prepareStatement(sql2); pstmt.setString(1,
			 * nicknamePk); ResultSet rs2 = pstmt.executeQuery(); String registrationDate =
			 * "";
			 * 
			 * if(rs2.next()) { registrationDate = rs2.getString(3); }
			 */
			String registrationDate = rs.getString("REGISTRATION_DATE");
			
			ProductViewDto dto = new ProductViewDto(nicknameFk, productNumberPK, imageName, productName, price, tradingArea, registrationDate);
			listResult.add(dto);
		}
		rs.close();
		pstmt.close();
		return listResult;
	}

	public ArrayList<ProductViewDto> getProductJjimList(String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "select p.*, j.date_of_writing from jjim j, product p where j.productnumber_fk = p.productnumber_pk and j.nickname_fk=? ORDER BY j.date_of_writing DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nicknamePk); 
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<ProductViewDto> listResult = new ArrayList<ProductViewDto>();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
			String tradingArea = rs.getString("TRADING_AREA");
			String registrationDate = rs.getString("REGISTRATION_DATE");

			ProductViewDto dto = new ProductViewDto(nicknameFk, productNumberPK, imageName, productName, price, tradingArea, registrationDate);
			listResult.add(dto);
		}
		rs.close();
		pstmt.close();
		return listResult;
	}
	
	
	
	public ArrayList<ProductViewDto> getProductList(String category, String nicknamePk) throws Exception {
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
		
		ArrayList<ProductViewDto> listResult = new ArrayList<ProductViewDto>();
		
		while(rs.next()){
			String nicknameFk = rs.getString("NICKNAME_FK");
			int productNumberPK = rs.getInt("PRODUCTNUMBER_PK");
			String imageName = rs.getString("IMAGENAME");
			String productName = rs.getString("PRODUCTNAME");
			int price = rs.getInt("PRICE");
			String tradingArea = rs.getString("TRADING_AREA");
			String registrationDate = rs.getString("REGISTRATION_DATE");

			ProductViewDto dto = new ProductViewDto(nicknameFk, productNumberPK, imageName, productName, price, tradingArea, registrationDate);
			listResult.add(dto);
		}
		rs.close();
		pstmt.close();
		return listResult;
	}
	
	public int getProductCnt(String category, String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		if("".equals(category)) {
			sql = "select count(*) from product where NICKNAME_FK=? order by registration_date desc";
//			System.out.println("sql:" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk); 
		} else {
			sql = "select count(*) from product where NICKNAME_FK=? and category like '%' || (select identification_value from category where product_name=?) || '%' order by registration_date desc";
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
		rs.close();
		pstmt.close();
		return cntResult;
	}
	
	// 거래상대의 닉네임, 상품정보, 배송비여부 가져오기
	public String getSellerProduct(int productnumberPk) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT productnumber_pk, nickname_fk, imagename, productname, price, delivery_charge FROM product WHERE productnumber_pk=?";
		String strRet="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productnumberPk);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String nicknameFk = rs.getString("nickname_fk");
				String imagename = rs.getString("imagename");
				String productname = rs.getString("productname");
				int price = rs.getInt("price");
				String deliveryCharge = rs.getString("delivery_charge");
				strRet = nicknameFk + "/" + imagename + "/" + productname + "/" + price + "/" + deliveryCharge;
				//strRet = nicknameFk + imagename + productname + price + deliveryCharge;		
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	public String getImagenameByProductNumber(int productnumberPk) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT imagename FROM product WHERE productnumber_pk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productnumberPk);
		ResultSet rs = pstmt.executeQuery();
		String imagename = null;
		if(rs.next()) {
			imagename = rs.getString(1);
		}
		return imagename;
	}
}
