<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
	    String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String dbID="bg";
		String dbPW="1234";
		
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbID,dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%
		String NICKNAME_PK = request.getParameter("NICKNAME_PK");
		String NAME = request.getParameter("NAME");
		
		session.setAttribute("NICKNAME_PK", NICKNAME_PK);
		
		String sql = "select count(*) from PROFILE where NICKNAME_PK=? and NAME=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, NICKNAME_PK);
		pstmt.setString(2, NAME);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			int num = rs.getInt(1);
			if(num==1){
	%>
			<script>
				location.href="main.jsp?login_NICKNAME=<%=NICKNAME_PK%>";
			</script>
	<% 
			} else {
	%>
			<script>
				alert("입력된 정보가 잘 못 되었습니다.");
				location.href="TM_LOGIN.jsp"    
			</script>
	<%				
			}
		}
	%>
</body>
</html>