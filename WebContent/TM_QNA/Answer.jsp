<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.bunge.dao.*" %>
    <%@ page import="com.bunge.dto.*" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<link rel="stylesheet"href="../css/TM_answer.css"/>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<a href="../TM_QNA.jsp">
				<img src=../images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			</a>
		</div>
		<div class="main box tl">
			<div class="box1">
				<div class ="type_select">
					거래신고 <!-- type-select -->
				</div>
				<div class="details_type">
					상태불량 <!-- details-type-select -->
				</div>
				<div class="time">
					2022/22/13	<!-- rsgistration_time -->
				</div>
			</div>
			<div class="line"></div>
			<div class="box2">
				<div class="font">
					신고한상점: 신고한상점	<!-- REPORTED_NICKNAME_FK -->
				</div>
				<div class="font">
					문의내용: 사기를 당했습니다.	<!-- inquiry_content -->
				</div>
			</div>
			<div class="binbox"></div>
			<div class="box3">
				<div class="answer">
					답변완료
				</div>
				<div class="answer1">
					답변해드렸습니다.
				</div>
			</div>
			<div class="line"></div>
		</div>
	</div>
</body>
</html>