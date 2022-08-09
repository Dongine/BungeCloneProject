<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>판매자에게 거래를 요청받았습니다</title>
	<link rel="stylesheet" href="css/SellerGetDealRequest.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String imagename = (String)(request.getAttribute("imagename"));
		int price = (Integer)(request.getAttribute("price"));
		String deliveryCharge = (String)(request.getAttribute("deliveryCharge"));
		String productName = (String)(request.getAttribute("productName"));
		String accountNumber = (String)(request.getAttribute("accountNumber"));
		String bankName = (String)(request.getAttribute("bankName"));
		String accountHolder = (String)(request.getAttribute("accountHolder"));
		String bankImgName = (String)(request.getAttribute("bankImgName"));
	%>
	<script>
		$(function() {
			$("#dealCancelButton").click(function() {
				location.href="Controller?command=GoCancel&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			$("#dealDoneButton").click(function() {
				location.href="Controller?command=DealDoneAction&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
		});
	</script>
</head>
<body>
	<div id="consumerDealCt1">
		<div id="consumerDealCt2">
			<h2 id="consumerDealTitleFont">판매자에게<br/>거래를 요청받았습니다</h2>
			<div id="consumerDealCt3_1">
				<div id="consumerDealCt3_2">
					<img style="width: 44px; height: 44px;" src="images/<%=imagename%>"/>
					<div id="consumerDealCt3_3">
						<div id="consumerDealCt3_4">
							<span style="font-size: 18px;"><b><%=price%></b></span><span id="deliveryChargeInclude"> <%=deliveryCharge%></span>
							<span>
								<button id="changeButton">
								</button>
							</span> 
							<p id="consumerDealCt3_5"><%=productName%></p>
						</div>
					</div>
				</div>
				<div id="consumerDealCt3_6">
					<span>구매자:</span><button class="dealProfileInquiryButton">TEST상점</button>
				</div>
			</div>
			<div id="consumerDealCt4">
				<div id="consumerDealCt4_1">
					<p style="margin: 0px; font-size: 1rem;"><b>계좌정보</b></p>
					<div id="consumerDealCt4_2">
						<img style="width: 28px; height: 28px; margin-right: 16px;" src="<%=bankImgName%>"/>
						<div id="consumerDealCt4_3">
							<p style="margin: 0 0 3px 0; font-size: 0.875rem;">
								<span><%=accountNumber%></span>
								<button id="changeButton"></button>
							</p>
							<p style="margin: 0px; font-size: 0.875rem;">
								<span><%=bankName%></span>   ・ 
								<span><%=accountHolder%></span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="consumerDealCt5">
				<div id="consumerDealCt5_1">
					<p style="margin: 0px; font-size: 0.875rem; color: rgb(94, 92, 107);">거래 취소 시 계좌 정보가 구매자에게 표시되지 않습니다.</p>
					<button class="dealCancelButton" id="dealCancelButton">거래 취소</button>
					<button class="dealCancelButton" id="dealDoneButton">거래 완료</button>
					<p style="margin: 0px; font-size: 0.875rem; color: rgb(94, 92, 107);">거래 취소 시 계좌 정보가 구매자에게 표시되지 않습니다.</p>
				</div>
			</div>
			<div id="consumerDealCt6" style="margin-top: 60px;">
				“BGZT Digital”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
			</div>
		</div>
	</div>
</body>
</html>