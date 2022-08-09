<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매자에게 거래를 요청받았습니다</title>
	<link rel="stylesheet" href="css/ConsumerGetDealRequest.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	    int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String sellerFk = (String)(request.getAttribute("sellerFk"));
		String consumerFk = (String)(request.getAttribute("consumerFk"));
		String productName = (String)(request.getAttribute("productName"));
		int price = (Integer)(request.getAttribute("price"));
		String address = (String)(request.getAttribute("address"));
		String detailedAddress = (String)(request.getAttribute("detailedAddress"));
		String addressName = (String)(request.getAttribute("addressName"));
		String imagename = (String)(request.getAttribute("imagename"));
		String deliveryCharge = (String)(request.getAttribute("deliveryCharge"));
		String phoneNumber = (String)(request.getAttribute("phoneNumber"));
	%>
	<script>
		$(function() {
			// 계좌관리로 이동
			$("#dealDoneAccountSend").click(function() {
				location.href="Controller?command=GoAccountManagement&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			// 거래취소로 이동
			$(".dealCancelButton").click(function() {
				location.href="Controller?command=GoCancel&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
		});
	</script>
</head>
<body>
	<div id="sellerDealCt1">
		<div id="sellerDealCt2">
			<h2 id="sellerDealTitleFont">구매자에게<br/>거래를 요청받았습니다</h2>
			<div id="sellerDealCt3_1">
				<div id="sellerDealCt3_2">
					<img style="width: 44px; height: 44px;" src="images/<%=imagename%>"/>
					<div id="sellerDealCt3_3">
						<div id="sellerDealCt3_4">
							<span style="font-size: 18px;"><b><%=price%><span>원</span></b></span><span id="deliveryChargeInclude"> <%=deliveryCharge%></span>
							<span>
								<button id="changeButton">
								</button>
							</span>
							<p id="sellerDealCt3_5"><%=productName%></p>
						</div>
					</div>
				</div>
				<div id="sellerDealCt3_6">
					<span>판매자:</span><button class="dealProfileInquiryButton"><%=sellerFk %></button>
				</div>
			</div>
			<div id="sellerDealCt4">
				<div id="sellerDealCt4_1">
					<p style="margin: 0px; font-size: 1rem;"><b>배송지정보</b></p>
					<p style="margin: 27px 0 3px 0; font-size: 15px;">
						<span><%=detailedAddress%></span>
						<button id="changeButton">
						</button>
					</p>
					<p style="margin: 0px; font-size: 0.875rem;">
						<span><%=addressName%></span>
						<span id="phoneNumber"><%=phoneNumber%></span>
					</p>
				</div>
			</div>
			<div id="sellerDealCt5">
				<div id="sellerDealCt5_1">
					<p style="margin: 0px; font-size: 0.875rem; color: rgb(94, 92, 107);">거래 취소 시 배송지 정보가 상대방에게 표시되지 않습니다.</p>
					<button class="dealCancelButton">거래 취소</button>
					<p id="sellerDealDoneFont">거래 완료 후에는 거래 취소를 할 수 없습니다.</p>
				</div>
			</div>
			<div id="sellerDealCt6">
				“BGZT Digital”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
			</div>
			
			<!-- 거래승인후  계좌보내기 -->
			<div id="dealDoneAccountSend">
				<button id="dealDoneAccountSendFont">거래승인후 계좌보내기</button>
			</div>
		</div>
	</div>
</body>
</html>