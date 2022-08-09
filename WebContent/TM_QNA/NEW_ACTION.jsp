<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>
<%
   String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbID = "bg";
	String dbPW = "1234";
	
	Connection conn = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, dbID, dbPW);
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String typeSelect = request.getParameter("typeSelect");
		String detailsTypeSelect = request.getParameter("detailsTypeSelect");
		String reportedNicknameFk = request.getParameter("reportedNicknameFk");
		String inquiryContent = request.getParameter("inquiryContent");
		String photoAttachment1 = request.getParameter("photoAttachment1");
		String photoAttachment2 = request.getParameter("photoAttachment2");
		String photoAttachment3 = request.getParameter("photoAttachment3");
		String photoAttachment4 = request.getParameter("photoAttachment4");
		String photoAttachment5 = request.getParameter("photoAttachment5");
		String photoAttachment6 = request.getParameter("photoAttachment6");
		
		if(typeSelect.equals("거래신고")){
			String sql ="insert into ONE_TO_ONE_INQUIRY(TYPE_SELECT, DETAILS_TYPE_SELECT, REPORTED_NICKNAME_FK, INQUIRY_CONTENT, PHOTO_ATTACHMENT1, PHOTO_ATTACHMENT2, PHOTO_ATTACHMENT3, PHOTO_ATTACHMENT4, PHOTO_ATTACHMENT5, PHOTO_ATTACHMENT6,report_nickname_fk, REGISTRATION_TIME)" 
			+"VALUES(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, typeSelect);
			pstmt.setString(2, detailsTypeSelect);
			pstmt.setString(3, reportedNicknameFk);
			pstmt.setString(4, inquiryContent);
			pstmt.setString(5, photoAttachment1);
			pstmt.setString(6, photoAttachment2);
			pstmt.setString(7, photoAttachment3);
			pstmt.setString(8, photoAttachment4);
			pstmt.setString(9, photoAttachment5);
			pstmt.setString(10, photoAttachment6);
			pstmt.setString(11, NICKNAME_PK);
				
			pstmt.executeUpdate();
		} else {
			String sql ="insert into ONE_TO_ONE_INQUIRY(TYPE_SELECT, DETAILS_TYPE_SELECT, INQUIRY_CONTENT, PHOTO_ATTACHMENT1, PHOTO_ATTACHMENT2, PHOTO_ATTACHMENT3, PHOTO_ATTACHMENT4, PHOTO_ATTACHMENT5, PHOTO_ATTACHMENT6,report_nickname_fk, REGISTRATION_TIME)" 
			+"VALUES(?,?,?,?,?,?,?,?,?,?,sysdate)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, typeSelect);
			pstmt.setString(2, detailsTypeSelect);
			pstmt.setString(3, inquiryContent);
			pstmt.setString(4, photoAttachment1);
			pstmt.setString(5, photoAttachment2);
			pstmt.setString(6, photoAttachment3);
			pstmt.setString(7, photoAttachment4);
			pstmt.setString(8, photoAttachment5);
			pstmt.setString(9, photoAttachment6);
			pstmt.setString(10, NICKNAME_PK);
			
			pstmt.executeUpdate();
		}
	%>
		<script>
			location.href="../TM_QNA.jsp";
		</script>
</body>
</html>