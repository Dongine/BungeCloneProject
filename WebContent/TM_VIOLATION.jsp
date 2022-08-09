<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<link rel="stylesheet"href="css/TM_VIOLATION.css"/>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<a href="Controller?command=GoCenter">
				<img src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			</a>
		</div>
	</div>
	<div class="main box tl">
		<div class="fl box1 width">
			내상점 제재내역
		</div>
		<div class="fl box2 width">
			<%=NICKNAME_PK%><br/><span class="s line">정상운영</span>되고있어요
			<div class="width box2-1">
				<div class="fl width center"style="padding-top:17%">
					<img src="images/TM_PAGE.png"width="40px"height="45px">
				</div>
				<div class="fl width center font21">
					멋지네요!
				</div>
				<div class="fl width center font16">
					내 상점은 제재 내역이 없어요!!
				</div>
			</div>
		</div>
		<div style="margin:0 20px;height:1px;background-color: rgb(246, 246, 246);"></div>
		<div class="fl box3 width">
			<div class="fl box3-1">
				유의사항
			</div>
			<ul class="fl box3-2">
				<li>・ 번개장터에서는 3아웃 정책을 실시하고 있어요. 자세한 운영정책을 확인하세요. <a href="Controller?command=GoOperate"><span>번개장터 운영정책</span></a></li>
				<li>・ 운영정책 위반이 확인되면 사전 안내 없이 서비스 사용이 한시적 또는 영구적으로 제한될 수 있어요.</li>
				<li>・ 영구차단의 경우, 문제해결이 되어야 해제가 가능해요.</li>
			</ul>
			<div class="fl box3-3">
				<span class="line">1:1문의</span>
				<span style="margin:0 16px">|</span>
				<span class="line">전화문의</span>
			</div>
		</div>
	</div>
</body>
</html>