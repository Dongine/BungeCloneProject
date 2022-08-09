<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link rel="shortcut icon" href="images/favicon.ico">
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
		conn = DriverManager.getConnection(url,dbID,dbPW);
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
	session.invalidate();
%>
<%
	String sql = "DELETE FROM PROFILE WHERE NICKNAME_PK=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, NICKNAME_PK);
	pstmt.executeUpdate();
%>
	<script>
		location.href="TM4.jsp";
	</script>
</body>
</html>