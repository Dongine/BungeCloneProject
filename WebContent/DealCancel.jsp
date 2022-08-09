<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>거래취소</title>
	<link rel="stylesheet" href="css/DealCancel.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		String deliveryCharge = (String)(request.getAttribute("deliveryCharge"));
		String imagename = (String)(request.getAttribute("imagename"));
		int price = (Integer)(request.getAttribute("price"));
		String productName = (String)(request.getAttribute("productName"));
		String sellerFk = (String)(request.getAttribute("sellerFk"));
		String cancelReason = (String)(request.getAttribute("cancelReason"));
		String cancelReasonDetail = (String)(request.getAttribute("cancelReasonDetail"));
	%>
</head>
<body>
	<div id="dealCancelCt1">
		<div id="dealCancelCt2">
			<h2 id="dealCancelTitleFont">거래가<br/>취소되었습니다</h2>
			<div id="dealCancelCt3_1">
				<div id="dealCancelCt3_2">
					<img style="width: 44px; height: 44px;" src="images/<%=imagename%>"/>
					<div id="dealCancelCt3_3">
						<div id="dealCancelCt3_4">
							<span style="font-size: 18px;"><b><%=price%><span>원</span></b></span><span id="deliveryChargeInclude">&nbsp;<%=deliveryCharge%></span> <!-- ::before -->
							<p id="dealCancelCt3_5"><%=productName%></p>
						</div>
					</div>
				</div>
				<div id="dealCancelCt3_6">
					<span>판매자: </span><button class="dealProfileInquiryButton"><%=sellerFk %></button>
					<p style="margin: 3px 0px;">취소 사유: <span id="cancelReason"><%=cancelReason%></span></p>
					<p style="margin: 3px 0px;">상세 내용: <span id="cancelReasonDetail"><%=cancelReasonDetail%></span></p>
				</div>
			</div>
			<div id="dealCancelCt4">
				“BGZT Digital”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
			</div>
		</div>
	</div>
</body>
</html>