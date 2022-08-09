<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<%
	ReviewDao rDao = new ReviewDao();
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	int rno = Integer.parseInt(request.getParameter("rno"));
	int dno = Integer.parseInt(request.getParameter("dno"));
	
	String strPurchaseSeller = rDao.getPurchaseSeller(rno, dno);
	String[] arrGetPurchaseSeller = strPurchaseSeller.split("/");
	String purchaseFk = arrGetPurchaseSeller[0]; // 구매자닉네임
	String sellerFk = arrGetPurchaseSeller[1]; // 판매자닉네임
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>후기작성</title>
	<link rel="stylesheet" href="css/ReviewWrite.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="Controller?command=ReviewWriteAction" method="post">
		<input type="hidden" name="rno" value="<%=rno%>">
		<input type="hidden" name="dno" value="<%=dno%>">
		<input type="hidden" name="purchaseFk" value="<%=purchaseFk%>">
		<input type="hidden" name="sellerFk" value="<%=sellerFk%>">
		<div id="reviewAllCt">
		 	<div id="reviewAllTitle">
		 		<span style="margin-left: 9px;">후기작성</span>
		 		<img id="reviewWriteCloseButton" src="images/closeButton.png"/>
		 	</div>
		 	<div id="textareaCt">
				<textarea  placeholder="거래는 만족스러우셨나요? 후기를 작성해주세요!" name="reviewWrite"></textarea>
		 	</div>
		 	<div id="reviewWriteInfo">거래가 만족스러웠다면 따뜻한 후기를, 만족하지 못했다면 만족하지 못한 부분을 작성해보세요.</div>
		 	<div id="reviewWriteDoneButtonCt">
				<button type="submit"><b>후기작성완료</b></button>
		 	</div>
		</div>
	</form>
</body>
</html>