<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>거래하기</title>
	<link rel="stylesheet" href="css/DirectDealSend.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		String nicknameFk = (String)(request.getAttribute("nicknameFk"));
		String imagename = (String)(request.getAttribute("imagename")); 
		String productname = (String)(request.getAttribute("productname")); 
		int price = (Integer)(request.getAttribute("price")); 
		String strConsumerPhoneNumber = (String)(request.getAttribute("strConsumerPhoneNumber")); 
	%>
</head>
<body>
	<form id="dealSendCt1" action="Controller?command=DirectDealSendAction" method="post">
		<input type="hidden" name="productnumber_pk" value="<%=productnumber_pk%>"/>
		<input type="hidden" name="sellerFk" value="<%=nicknameFk%>"/>
		<input type="hidden" name="imagename" value="<%=imagename%>"/>
		<input type="hidden" name="productname" value="<%=productname%>"/>
		<input type="hidden" name="price" value="<%=price%>"/>
		<div id="dealSendCt1_1">
			<div id="dealSendCt2">
				<div id="dealSendCt2Left">
					<span id="dealSendCt2LeftFont">거래하기</span>
				</div>
				<div id="dealSendCt2Right"></div>
			</div>
			<div id="dealSendCt3">
				<h2 class="dealCtFont1"><b>거래상품</b></h2>
			</div>
			<!-- 거래상품 -->
			<div id="dealSendCt4">
				<img style="width: 70px; height: 70px"src="images/<%=imagename%>"/>
				<div id="dealSendCt4_1">
					<p style="margin: 5px 0 0;"><%=productname%></p>
					<p id="dealSendCt4_1Font"><b><span><%=price%></span><span> 원 </span><span style="color: #e81e22">(직거래)</span></b></p>
				</div>
			</div>
			<div id="dealSendCt5">
				<h2 class="dealCtFont1"><b>거래정보</b></h2>
			</div>
			<div id="dealSendCt6_1">
				<div id="dealSendCt6_1Left">
					<p class="dealCtFont2">거래일</p> 
				</div>
				<div id="dealSendCt6_1Right">
					<input type="text" id="dealSendDaySelect" name="dealingDate" required>
				</div>
			</div>
			<div id="dealSendCt6_2">
				<div id="dealSendCt6_2Left">
					<p class="dealCtFont2">장소</p>
				</div>
				<div id="dealSendCt6_2Right">
					<input id="dealSendCt6_2Place" type="text" name="directPlace" placeholder="정확한 장소를 입력해주세요." required>
				</div>
			</div>
			<div id="dealSendCt7_1">
				<div id="dealSendCt7_1Left">
					<p class="dealCtFont2">연락처</p>
				</div>
				<div id="dealSendCt7_1Right">
					<p style="font-size: 15px; margin-bottom: 0px;"><%=strConsumerPhoneNumber%></p>
					<p class="infoContentFont"><b>연락처는 거래 필수항목입니다.<br/>번호변경은 <span class="redFont">설정>프로필</span>에서 가능합니다<br/>
					※ 거래승인 시 상대방의 연락처를 확인하실 수 있습니다.</b>
				</div>
			</div>
			<div id="dealSendCt8">
				<div class="customCheckboxPushAgreement flexAlignItemsCenter" style="padding-left: 17px;">
					<input style="width: 17px; height: 17px;" type="checkbox">
					<label style="padding-left: 14px;">번개장터의 다양한 혜택 알림받기</label>
				</div>
			</div>
			<div id="dealSendCt9">"번개장터_컨시어지" 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</div>
		</div>
		<div id="dealSendCt10">
			<button id="dealSendButton" class="fl"><b>전송</b></button>
		</div>
	</form>
</body>
</html>