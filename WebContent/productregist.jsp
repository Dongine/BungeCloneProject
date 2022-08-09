<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	MultipartRequest mr = new MultipartRequest(request, "C:/eclipse/HSK/BungeProject/WebContent/images", 640*640*640,"utf-8",new DefaultFileRenamePolicy());
	SaleDao sDao = new SaleDao();
	String category1 = mr.getParameter("category1");
	String category2 = mr.getParameter("category2");
	String category3 = mr.getParameter("category3");
	String category1Code = sDao.getSaleCategory1(category1);
	String category2Code = sDao.getSaleCategory2(category1Code, category2);
	String category3Code = sDao.getSaleCategory3(category2Code, category3);
	
	Enumeration files = mr.getFileNames();
	String fileObject1 = (String)(files.nextElement());
	String imagename = mr.getFilesystemName(fileObject1);
	
	String nicknamefk = mr.getParameter("nickname");
	String productname = mr.getParameter("productname");
	int price = Integer.parseInt(mr.getParameter("price"));
	String productstate = mr.getParameter("productstate");
	String exchange = mr.getParameter("exchange");
	String deliverycharge = mr.getParameter("deliverycharge");
	String tradingarea = mr.getParameter("tradingarea");
	String productinformation = mr.getParameter("productinformation");
	int quantity = Integer.parseInt(mr.getParameter("quantity"));
	String tag = mr.getParameter("tag");
	String category = category3Code;
	String safety_payment = mr.getParameter("safety_payment");
	ProductRegistDao rdao = new ProductRegistDao();
	rdao.registProduct(nicknamefk, imagename, productname, price, productstate, exchange, deliverycharge, tradingarea, productinformation, quantity, tag, category,safety_payment);
%>
<script>
	alert("<%=nicknamefk%>");
	location.href = "sale.jsp";
</script>