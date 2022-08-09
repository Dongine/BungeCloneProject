<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link rel="shortcut icon" href="images/favicon.ico">
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="css/TM_CENTER.css"/>
	<script>
		$(function(){
			$('.box5').click(function(){
				//location.href="TM_FAQ.html";
				history.back();
			});
		});
	</script>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<a href="Controller?command=GoTM4">
				<img src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			</a>
		</div>
		<div class="main box tl">
			<div class="fl font28 width"style="margin:30px 20px 0px">
				<%=NICKNAME_PK%>님<br/>
				무엇을 도와드릴까요?
			</div>
			<div class="fl box2 font13"style="width:92%">
				<span class="green">공지</span>GS25 편의점 택배 서비스 점검 안내
			</div>
			<div class="fl width"style="padding:0px 20px;cursor:pointer">
				<div class="fl width height">
					<div class="fl box3">
						<div class="fl img">
							<a href="Controller?command=GoOperate">
								<img src="images/운영정책.png"width="142px"height="142px">
							</a>
						</div>
						<div class="fl font width font13">
							운영정책
						</div>
					</div>
					<div class="fl box3">
						<div class="fl img">
							<a href="Controller?command=GoNotice">
								<img src="images/공지사항.png"width="142px"height="142px">
							</a>
						</div>
						<div class="fl font width font13">
							공지사항
						</div>
					</div>
					<div class="fl box3">
						<div class="fl img">
							<a href="Controller?command=GoFaq">
								<img src="images/자주묻는질문.png"width="142px"height="142px">
							</a>
						</div>
						<div class="fl font width font13">
							자주묻는질문
						</div>
					</div>
					<div class="fl box3">
						<div class="fl img">
							<a href="Controller?command=GoQna">
								<img src="images/문의.png"width="142px"height="142px">
							</a>
						</div>
						<div class="fl font width font13">
							1:1문의
						</div>
					</div>
					<div class="fl box3">
						<div class="fl img">
							<a href="Controller?command=GoViolation">
								<img src="images/제재내역.png"width="142px"height="142px">
							</a>
						</div>
						<div class="fl font width font13">
							내상점 제재내역
						</div>
					</div>
					<div class="fl width bar"><!-- 바 --></div>
					<div class="fl width box4">
						<div class="fl width font20">
							여기서 빠르게 해결하세요
						</div>
						<div class="fl width font16">
							<div class="fl">
								<span class="fl Q">Q</span>	
							</div>
							<div class="fl">
								<a href="Controller?command=GoFaq_2">
									거래를 하면 안 되는 것들은 어떤 것이 있나요?
								</a>
							</div>
							<div class="fr">
								<img src=images/TM_RIGHT.svg width="12"height="12">
							</div>
						</div>	
						<div class="fl width font16">
							<div class="fl">
								<span class="fl Q">Q</span>	
							</div>
							<div class="fl">
								번개페이로 정산한 상품은 언제 정산 되나요?
							</div>
							<div class="fr">
								<img src=images/TM_RIGHT.svg width="12"height="12">
							</div>
						</div>
						<div class="fl width font16">
							<div class="fl">
								<span class="fl Q">Q</span>	
							</div>
							<div class="fl">
								번개페이(안전결제)란 무엇 인가요?
							</div>
							<div class="fr">
								<img src=images/TM_RIGHT.svg width="12"height="12">
							</div>
						</div>		
						<div class="fl width font16">
							<div class="fl">
								<span class="fl Q">Q</span>	
							</div>
							<div class="fl">
								[분쟁해결절차]사기를 당하면 어떻게 처리해야 하나요?
							</div>
							<div class="fr">
								<img src=images/TM_RIGHT.svg width="12"height="12">
							</div>
						</div>		
						<div class="fl width font16">
							<div class="fl">
								<span class="fl Q">Q</span>	
							</div>
							<div class="fl">
								여러개의 계정을 만들 수 있나요?
							</div>
							<div class="fr">
								<img src=images/TM_RIGHT.svg width="12"height="12">
							</div>
						</div>				
					</div>
					<div class="fl width box5">
						전체 더보기
					</div>
					<div class="fl width box6"style="font-size:12px">
						<div class="fl"style="margin-bottom:8px">
							<a href="https://m.bunjang.co.kr/">(주)번개장터 사업자정보</a>
							<img src=images/TM_RIGHT.svg width="10px"height="10px">
						</div>
							<div class="fl width"style="font-size:10px;font-weight: bold;color: rgb(178, 178, 178);">
							Ⓒ Bungaejangter. Inc All rights reserved.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>