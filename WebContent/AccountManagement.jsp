<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계좌 관리</title>
	<link rel="stylesheet" href="css/AccountManagement.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	// 기본계좌로 설정 체크박스 선택시 DB로 계좌정보 보내기
		<%-- var bank_name_add =  $("#bankSelectCt > span").text() = <%=bank_name_add%> --%>
	</script>
		<%
			String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			int dno = Integer.parseInt(request.getParameter("dno")); 
			String bankName = (String)(request.getAttribute("bankName"));
			String accountHolder = (String)(request.getAttribute("accountHolder"));
			String accountNumber = (String)(request.getAttribute("accountNumber"));
			String bankImgName = (String)(request.getAttribute("bankImgName"));
		
		// 계좌정보값이 없다면 계좌 추가 화면을 블록하고 계좌정보 화면을 숨기고, 계좌정보값이 있다면 계좌정보 화면을 블록하고 계좌 추가 화면을 숨기기
		if((bankName==null) || (accountHolder==null) || (accountNumber==null)) {
		%>
			<script>
 				$(function() {
					$("#accountManagCt6").css("display","block");
					$("#selectedBank").css("display","none");
					$(".selectAccountButtonCt").css("display","none"); 
				}); 
			</script>
		<%
		} else {
		%>
			<script>
				$(function() {
					$("#accountManagCt6").css("display","none");
					$("#selectedBank").css("display","block");
					$(".selectAccountButtonCt").css("display","block");
				}); 
			</script> 
		<%
		}
	%>
	<script>
		$(function() {
			// 계좌추가
			$("#accountAddButton").click(function() {
				location.href="Controller?command=GoAccountAdd&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			// 계좌수정
			$("#bankModify").click(function() {
				location.href="Controller?command=GoAccountAdd&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			// 계좌삭제
			$("#bankDelete").click(function() {
				location.href="Controller?command=AccountDeleteAction&rno="+<%=rno%>+'&dno='+<%=dno%>;
			});
			// 계좌보내기로 이동
			$(".selectAccountButton").click(function() {
				var bankName = $(".bankNameFont").text();
				var accountNumber = $("#accountNumber").text();
				var accountHolder = $("#accountHolder").text();
				location.href="Controller?command=GoConsumerGetDealRequest2&rno="+<%=rno%>+'&dno='+<%=dno%>+'&bankName='+bankName+'&accountNumber='+accountNumber+'&accountHolder='+accountHolder;
			});
		});
	</script>
</head>
<body>
	<div id="accountManagCt1">
		<div id="accountManagCt2">
			<div id="accountManagCt3">
				<svg onclick="history.back()" class="fl" style="padding-left:20px; padding-top: 9.5px; cursor:pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M14.265 19.537a.9.9 0 1 0 1.27-1.274l-8.362-8.34 8.365-8.387A.9.9 0 0 0 14.263.264l-9 9.024a.902.902 0 0 0 .002 1.273l9 8.976z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
				<button id="accountAddButton" class="fr">계좌 추가</button>
			</div>
			<div id="accountManagCt4">
				<div id="accountManagCt5">
					<h1 id="accountManagCt5Font" class="fl"><b>계좌 관리</b></h1>
				</div>
				
				<!-- 등록된 계좌가 없을 때 -->
				<div id="accountManagCt6">
					<svg style="margin-top: 40px; margin-right: 107px;"width="56" height="56" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><g fill="none" fill-rule="evenodd"><path d="M13.742 0a.9.9 0 0 1 .637.264l3.457 3.457a.9.9 0 0 1 .264.636V18.9a.9.9 0 0 1-.901.9H2.8a.9.9 0 0 1-.9-.9V.9a.9.9 0 0 1 .9-.9Zm-.373 1.8H3.7V18h12.599V4.73l-2.93-2.93Zm-.113 12.135a.9.9 0 0 1 0 1.8H6.438a.9.9 0 1 1 0-1.8Zm0-4.218a.9.9 0 0 1 0 1.8H6.438a.9.9 0 1 1 0-1.8Zm0-4.218a.9.9 0 1 1 0 1.8H6.438a.9.9 0 0 1 0-1.8Z" fill="#999"></path></g></svg>
					<p style="font-size: 16px;">계좌를 추가해주세요</p>
				</div>
				
				<!-- 등록된 계좌가 있을 때 -->
				<div id="selectedBank">
					<div>
						<span class="fl">
							<span class="accountTopIcons">정산계좌</span>
							<span class="accountTopIcons">환불계좌</span>
						</span>
						<button class="fr bankModifyDelete" id="bankDelete" style="padding-left: 12px;">삭제</button>
						<button class="fr bankModifyDelete" id="bankModify" style="padding-right: 12px; border-right: 1px solid rgb(153, 153, 153); ">수정</button>
					</div>
					<div class="selectBankCt1">
						<img style="width: 24px; height: 24px;" src="<%=bankImgName%>"/>
						<span class="bankNameFont"><%=bankName%></span><!-- 국민은행 -->
					</div>
					<div class="fl accountNumberNameCt"><span id="accountNumber"><%=accountNumber%></span>  ・ <span id="accountHolder"><%=accountHolder%></span></div><!-- 93000000223345  ・ 홍길동 -->
				</div>
			</div>
			<!-- 등록된 계좌가 있을 때 선택적용 버튼-->
			<div class="selectAccountButtonCt">
				<button class="selectAccountButton">선택한 계좌로 적용하기</button>
			</div>
		</div>
	</div>
</body>
</html>