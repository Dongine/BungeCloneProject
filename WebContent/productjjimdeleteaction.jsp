<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*" %>
<%@ page import = "com.bunge.dto.*"%>
<%@ page import = "com.bunge.dao.*" %>

<%

	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	int productnumber = Integer.parseInt(request.getParameter("productnumber_pk"));
	String category1 = request.getParameter("category1");
	String category2 = request.getParameter("category2");
	String category3 = request.getParameter("category3");
	System.out.print("NICKNAME_PK");
	JjimDao jdao = new JjimDao();
	jdao.jjimdelete(NICKNAME_PK, productnumber);
%>
<script>
	location.href = "product.jsp?productnumber_pk=<%= productnumber%>&category1=<%=category1%>&category2=<%=category2%>&category3=<%=category3%>";
</script>