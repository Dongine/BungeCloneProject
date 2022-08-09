package com.bunge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bunge.dto.InquiryDto;

public class InquiryDao {
	public ArrayList<InquiryDto> getInquiryList(String nickname) throws SQLException{
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "select identification_number_pk, type_select, details_type_select, registration_time  from one_to_one_inquiry where report_nickname_fk=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<InquiryDto> InquiryList = new ArrayList<InquiryDto>();
		
		while(rs.next()) {
			int identificationNumberPk = rs.getInt("IDENTIFICATION_NUMBER_PK");
			String typeSelect = rs.getString("TYPE_SELECT");
			String detailsTypeSelect = rs.getString("DETAILS_TYPE_SELECT");
			String registrationTime = rs.getString("REGISTRATION_TIME");
			
			InquiryDto dto = new InquiryDto(identificationNumberPk,typeSelect,detailsTypeSelect,registrationTime);
			InquiryList.add(dto);
		}
		rs.close();
		pstmt.close();
		return InquiryList;
	}
}
