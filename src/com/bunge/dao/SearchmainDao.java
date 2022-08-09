package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.ProductListDto;

public class SearchmainDao {
	public ArrayList<ProductListDto> getsearchProductList(String input) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<ProductListDto> listProduct = new ArrayList<ProductListDto>();
		
		String sql = "select productnumber_pk, nickname_fk, imagename, productname, price, trading_area, trunc(sysdate-registration_date), purchase_status from product where productname like ?";
		String registration_date = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+input+"%");
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int productnumber_pk = rs.getInt("productnumber_pk");
			String nickname_fk = rs.getString("nickname_fk");
			String imagename = rs.getString("imagename");
			String productname = rs.getString("productname");
			int price = rs.getInt("price");
			String trading_area = rs.getString("trading_area");
			registration_date = rs.getString("trunc(sysdate-registration_date)");
			String purchase_status = rs.getString("purchase_status");
			ProductListDto dto = new ProductListDto(productnumber_pk, nickname_fk ,imagename, productname, price, trading_area, registration_date,purchase_status);
			listProduct.add(dto);
		}
		return listProduct;
	}
	public int getProductListSizeBysearch(String input) {
		Connection conn = DBConnection.getConnection();

		String sql = "SELECT count(*) FROM product WHERE productname like ?";
		int count = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+input+"%");
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<ProductListDto> getProductListBysearchOrderBy(String input, String order) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<ProductListDto> listProduct = new ArrayList<ProductListDto>();
//System.out.println("ProductListDao, category:" + category);		
		String sql = "SELECT productnumber_pk, nickname_fk, imagename, productname, price, trading_area, trunc(sysdate-registration_date), purchase_status FROM product WHERE productname like ? ORDER BY " + order;
		String registration_date = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+input+"%");
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int productnumber_pk = rs.getInt("productnumber_pk");
			String nickname_fk = rs.getString("nickname_fk");
			String imagename = rs.getString("imagename");
			String productname = rs.getString("productname");
			int price = rs.getInt("price");
			String trading_area = rs.getString("trading_area");
			registration_date = rs.getString("trunc(sysdate-registration_date)");
			String purchase_status = rs.getString("purchase_status");
			ProductListDto dto = new ProductListDto(productnumber_pk, nickname_fk ,imagename, productname, price, trading_area, registration_date,purchase_status);
			listProduct.add(dto);
		}
		return listProduct;
	}
}
