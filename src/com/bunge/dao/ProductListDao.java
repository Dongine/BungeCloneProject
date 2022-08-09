package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.ProductDetailDto;
import com.bunge.dto.ProductDto;
import com.bunge.dto.ProductListDto;


public class ProductListDao {
	public ArrayList<ProductDto> getAllProductList(String nickname) throws SQLException{
		String sql = null;
		PreparedStatement pstmt = null;
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		
		Connection conn = DBConnection.getConnection();
		sql = "select productnumber_pk, imagename, productstate, productname, price, safety_payment ,jjim_quantity, last_up_date from product where nickname_fk = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);

		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int productnumber = rs.getInt("productnumber_pk");
			String imagename = rs.getString("imagename");
			String productstate = rs.getString("productstate");
			String productname = rs.getString("productname");
			int price = rs.getInt("price");
			String safetypay = rs.getString("safety_payment");
			int jjimquantity = rs.getInt("jjim_quantity");
			String lastupdate = rs.getString("last_up_date");
			list.add(new ProductDto(productnumber,imagename, productstate,productname, price, safetypay, jjimquantity,lastupdate) );
		}
		return list;
	}
	
	public ArrayList<ProductListDto> getProductListByCategoryOrderBy(String category, String order) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<ProductListDto> listProduct = new ArrayList<ProductListDto>();
//System.out.println("ProductListDao, category:" + category);		
		String sql = "SELECT productnumber_pk, nickname_fk, imagename, productname, price, trading_area, trunc(sysdate-registration_date), purchase_status FROM product WHERE category like ? ORDER BY " + order;
		String registration_date = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+category+"%");
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

	public int getProductListSizeByCategory(String category) {
		Connection conn = DBConnection.getConnection();

		String sql = "SELECT count(*) FROM product WHERE category = ?";
		int count = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<ProductDetailDto> getProductDetailDto(int productnumber_pk) throws SQLException{
		
		Connection conn = DBConnection.getConnection();
			
		ArrayList<ProductDetailDto> listProductDetail = new ArrayList<ProductDetailDto>();
		
		  String sql = "SELECT nickname_fk, imagename, productname, price, productstate, exchange, delivery_charge, trading_area ,product_information, tag, category, trunc(sysdate-registration_date), jjim_quantity, hitcount FROM product WHERE productnumber_pk = ?";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1,productnumber_pk);
		  ResultSet rs = pstmt.executeQuery();
		  
		  while(rs.next()) { 
			  String nickname_fk = rs.getString("nickname_fk");
			  String imagename = rs.getString("imagename"); 
			  String productname = rs.getString("productname"); 
			  int price = rs.getInt("price");
			  String productstate = rs.getString("productstate"); 
			  String exchange = rs.getString("exchange");
			  String delivery_charge = rs.getString("delivery_charge"); 
			  String trading_area = rs.getString("trading_area"); 
			  String product_information = rs.getString("product_information"); 
			  String tag = rs.getString("tag"); 
			  String category = rs.getString("category"); 
			  String registration_date = rs.getString("trunc(sysdate-registration_date)"); 
			  int jjim_quantity = rs.getInt("jjim_quantity"); 
			  int hitcount = rs.getInt("hitcount");
			  ProductDetailDto dto = new ProductDetailDto(nickname_fk,imagename, productname, price, productstate, exchange,
														delivery_charge, trading_area, product_information, tag, category,
														registration_date, jjim_quantity, hitcount);
		  listProductDetail.add(dto);
		  
		 }
		  return listProductDetail;
	 }
	
	// category1Selected : "여성의류" ---> returns "a1"
	public String getCategory1Code(String category1) {
System.out.println("." + category1 + ".");
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT identification_value FROM category WHERE product_name=? AND parent_value='(null)'";
		PreparedStatement pstmt = null;
		String iv = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				iv = rs.getString(1);
				System.out.println("rs.next() 들어옴. iv=" + iv);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return iv;
	}
	
	// parentValue:"a1", category2:"패딩/점퍼" ---> returns "a1_b1"
	public String getCategory2Code(String parentValue, String category2) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT identification_value FROM category WHERE parent_value=? AND product_name = ?";
		PreparedStatement pstmt = null;
		String iv = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, parentValue);
			pstmt.setString(2, category2);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				iv = rs.getString(1);
				System.out.println("rs.next() 들어옴. iv=" + iv);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return iv;
	}
		
	// categoryName : "롱패딩", category1SelectedCode : "a1"
	public String getCategoriFromCategoryName(String categoryName, String category1Code) {
System.out.println("getCategori... - categoryName : " + categoryName);
System.out.println("getCategori... - category1SelectedCode : " + category1Code);
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT identification_value FROM category WHERE product_name=? AND parent_value LIKE ?";
		PreparedStatement pstmt = null;																		
		String iv = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryName);
			pstmt.setString(2, category1Code+"%");
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				iv = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return iv;
	}
	
	// 남성의류 ---> a2
	// category1Code:"a2" --> category2의 문자열 배열(ArrayList<String>)
	public ArrayList<String> getCategory2List(String category1Code) {
		Connection conn = DBConnection.getConnection();
		String sql = "select product_name from category where parent_value=?";
		PreparedStatement pstmt = null;
		ArrayList<String> listResult = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1Code);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				listResult.add(rs.getString(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listResult;
	}

	public ArrayList<String> getCategory3List(String category2Code) {
		Connection conn = DBConnection.getConnection();
		String sql = "select product_name from category where parent_value=?";
		PreparedStatement pstmt = null;
		ArrayList<String> listResult = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category2Code);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				listResult.add(rs.getString(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listResult;
	}
	public void increaseHitcount(int productnumber) throws SQLException {
		Connection conn = DBConnection.getConnection();
		
		String sql = "UPDATE product SET hitcount = hitcount+1 WHERE productnumber_pk =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, productnumber);
		pstmt.executeUpdate();
	}

}



