<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<!DOCTYPE html>
<html>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>

<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="css/TM_SETTINGS.css"/>
	<script>
		$(function(){
			$('#btn').click(function(){
				location.href="Controller?command=GoTM4";
			})
			$('#logout').click(function(){
				location.href="Controller?command=GoLogout";
			})
			$('#delete').click(function(){
				location.href="Controller?command=DeleteAction";
			})
			$('#sns').click(function(){
				alert("준비중입니다.");
			})
		});
	</script>
</head>
<body>
	<div>
		<div class="box">
			<div class="box2">
				<div class="box3">
					<button class="box3-1" id="btn">
						<img src="images/left.svg"/>
					</button>
					계정설정
				</div>
				<div class="box4">
					<button class="btn"id="sns">sns연동</button>
					<button class="btn"id="logout">로그아웃</button>
					<button class="btn"id="delete">탈퇴</button>
				</div>
				<div class="box5">
				</div>
			</div>
		</div>
	</div>
</body>
</html>