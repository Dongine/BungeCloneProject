<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>주소 관리</title>
	<link rel="stylesheet" href="css/AddressManagement.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
	 	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	 	int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
	 	String addressName = (String)(request.getAttribute("addressName"));
	 	String phoneNumber = (String)(request.getAttribute("phoneNumber"));
	 	String address = (String)(request.getAttribute("address"));
	 	String detailedAddress = (String)(request.getAttribute("detailedAddress"));
	 	String nicknameFk = (String)(request.getAttribute("nicknameFk"));
	 	String imagename = (String)(request.getAttribute("imagename"));
	 	String productname = (String)(request.getAttribute("productname"));
	 	String delieveryCharge = (String)(request.getAttribute("delieveryCharge"));

		// 계좌정보값이 없다면 계좌 추가 화면을 블록하고 계좌정보 화면을 숨기고, 계좌정보값이 있다면 계좌정보 화면을 블록하고 계좌 추가 화면을 숨기기
		if((addressName==null) || (phoneNumber==null) || (address==null) || (detailedAddress==null)) {
		%>
			<script>
 				$(function() {
					$("#addressManagCt6").css("display","block");
					$("#selectedAddress").css("display","none");
					$(".selectAddressButtonCt").css("display","none"); 
				}); 
			</script>
		<%
		} else {
		%>
			<script>
				$(function() {
					$("#addressManagCt6").css("display","none");
					$("#selectedAddress").css("display","block");
					$(".selectAddressButtonCt").css("display","block");
				}); 
			</script> 
		<%
		}
	%>
	<style>
		
	</style>
	<script>
		$(function() {
			// 주소 수정
			$("#addressModifyButton").click(function() {
				location.href="Controller?command=GoAddressAdd&productnumber_pk=<%=productnumber_pk%>";
			});
			// 주소 추가
			$("#addressAddButton").click(function() {
				location.href="Controller?command=GoAddressAdd&productnumber_pk=<%=productnumber_pk%>";
			});
			// 주소 삭제
			$("#addressDeleteButton").click(function() {
				location.href="Controller?command=AddressDeleteAction&productnumber_pk=<%=productnumber_pk%>";
			})
			// 주소보내기로 이동
			$(".selectAddressButtonCt").click(function() {
				location.href="Controller?command=GoAddressSend&productnumber_pk=<%=productnumber_pk%>";
			});
		});
	</script>
</head> 
<body>
	<div id="addressManagCt1">
		<div id="addressManagCt2">
			<div id="addressManagCt3">
				<svg onclick="history.back()" class="fl" style="cursor:pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M14.265 19.537a.9.9 0 1 0 1.27-1.274l-8.362-8.34 8.365-8.387A.9.9 0 0 0 14.263.264l-9 9.024a.902.902 0 0 0 .002 1.273l9 8.976z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
				<button id="addressAddButton" class="fr">주소 추가</button>
			</div>
			<div id="addressManagCt4">
				<div id="addressMangCt5">
					<h1 id="addressMangCt5Font" class="fl"><b>주소 관리</b></h1>
				</div>
				
				<!-- 등록된 주소가 없을 때 -->
				<div id="addressManagCt6">
					<svg style="margin-top: 40px; margin-right: 107px;"width="56" height="56" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><g fill="none" fill-rule="evenodd"><path d="M13.742 0a.9.9 0 0 1 .637.264l3.457 3.457a.9.9 0 0 1 .264.636V18.9a.9.9 0 0 1-.901.9H2.8a.9.9 0 0 1-.9-.9V.9a.9.9 0 0 1 .9-.9Zm-.373 1.8H3.7V18h12.599V4.73l-2.93-2.93Zm-.113 12.135a.9.9 0 0 1 0 1.8H6.438a.9.9 0 1 1 0-1.8Zm0-4.218a.9.9 0 0 1 0 1.8H6.438a.9.9 0 1 1 0-1.8Zm0-4.218a.9.9 0 1 1 0 1.8H6.438a.9.9 0 0 1 0-1.8Z" fill="#999"></path></g></svg>
					<p style="font-size: 16px;">주소를 추가해주세요</p>
				</div>
				
				<!-- 등록된 주소가 있을 때 -->
				<div id="selectedAddress">
					<div class="addressTop">
						<p class="addressTopName"><%=addressName%></p><!-- 구매자이름 -->
						<span class="fl addressTopIcons">
							<button class="addressModifyDelete" id="addressModifyButton" style="padding-right: 12px; border-right: 1px solid rgb(153, 153, 153);">수정</button>
							<button class="addressModifyDelete" id="addressDeleteButton" style="padding-left: 12px;">삭제</button>
						</span>
					</div>
					<div class="selectedAddressFont"><span id="address"><%=address%></span>&nbsp;<span id="detailAddress"><%=detailedAddress%></span><br/><span id="addressPhoneNumber"><%=phoneNumber%></span></div>
				</div>
			</div>
			<!-- 등록된 주소가 있을 때 선택적용 버튼-->
			<div class="selectAddressButtonCt">
				<button class="selectAddressButton">선택한 주소로 적용하기</button>
			</div>
		</div>
	</div>
</body>
</html>