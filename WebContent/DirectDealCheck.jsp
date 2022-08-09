<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거래하기(직거래)</title>
	<link rel="stylesheet" href="css/DirectDealCheck.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
 		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int	rno = Integer.parseInt(request.getParameter("rno"));
		int	dno = Integer.parseInt(request.getParameter("dno"));
	
		String sellerFk = (String)(request.getAttribute("sellerFk"));
		String consumerFk = (String)(request.getAttribute("consumerFk"));
		String productName = (String)(request.getAttribute("productName"));
		int price = (Integer)(request.getAttribute("price"));
		String place = (String)(request.getAttribute("place"));
		String imagename = (String)(request.getAttribute("imagename"));
		int productNumber = (Integer)(request.getAttribute("productNumber"));
		String directDealPromiseDate = (String)(request.getAttribute("directDealPromiseDate"));
		String sellerPhoneNumber = (String)(request.getAttribute("sellerPhoneNumber"));
		String consumerPhoneNumber = (String)(request.getAttribute("consumerPhoneNumber"));
	%>
	<script>
		$(function(){
			// 거래취소로 이동
			$("#dealCancelButton").click(function() {
				location.href="Controller?command=GoCancel&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			// 거래완료로 이동
			$("#dealDoneButton").click(function() {
				location.href="Controller?command=DirectDealCheckAction&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
		});
	</script>
</head>
<body>
	<div>
		<div id="dealCheckCt1">
			<div id="dealCheckCt1_1">
				<div id="dealCheckCt2">
					<div id="dealCheckCt2Left">
						<span id="dealCheckCt2LeftFont">거래하기</span>
					</div>
					<div id="dealCheckCt2Right">
					</div>
				</div>
				<div id="dealCheckCt3">
					<span class="dealCtFont1"><b>거래상품</b></span>
					<span id="dealCheckCt3Right"><%=sellerFk%> 
					</span>
				</div>
				<div id="dealCheckCt4">
					<img style="width: 70px; height: 70px"src="images/<%=imagename%>"/>
					<div id="dealCheckCt4_1">
						<span id="dealingDirect">거래중</span>
						<p style="margin: 5px 0 0;"><%=productName%></p>
						<p id="dealCheckCt4_1Font"><b><span><%=price%></span><span> 원 </span><span style="color: #e81e22">(직거래)</span></b></p>
					</div>
				</div>
				<div id="dealCheckInfo" class="dealCtFont1">
					<span><b>거래정보</b></span>
				</div>
				<div id="dealCheckCt5">
					<div id="dealCheckCt5_1">
						<p id="dealCheckCt5_1_1">거래일</p>
						<span style="color: #212121;"><%=directDealPromiseDate%></span>
					</div>
					<div id="dealCheckCt5_2">
						<p id="dealCheckCt5_1_1">장소</p>
						<span style="color: #212121;"><%=place%></span>
					</div>
					<div id="dealCheckCt5_3">
						<p id="dealCheckCt5_3_1">연락처</p>
						<div>
							<p style="margin: 0; color: #212121;"><span><%=sellerFk%></span>&nbsp;:&nbsp;<%=sellerPhoneNumber%></p>
							<p style="margin: 0; color: #212121;"><span><%=consumerFk %></span>&nbsp;:&nbsp;<%=consumerPhoneNumber%></p> 
						</div>
					</div>
				</div>
				<div id="dealCheckCt6">"번개장터_컨시어지" 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다."</div>
			</div>
		</div>
		<div id="dealCheckCt7">
			<button id="dealCancelButton" class="fl"><b>거래취소</b></button>
			<button id="dealDoneButton" class="fl"><b>거래완료</b></button>
		</div>
	</div>
</body>
</html>