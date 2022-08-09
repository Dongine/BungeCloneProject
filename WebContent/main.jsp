<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<%
	ProductDao pDao = new ProductDao();
	StoreDao sDao = new StoreDao();
	CommentDao cDao = new CommentDao();
	
%>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>프로젝트 메인화면</title>
	<link rel="shortcut icon" href="images/favicon.ico">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/slick.css"/>
 	<script type="text/javascript" src="js/slick.min.js"></script>
 	<script src="js/jquery-3.6.0.min.js"></script>	
 	<link rel = "stylesheet" href = "css/main.css"/>
	<script>
		$(function() {
			$("#slider_ad").slick({
				prevArrow: $('#slider_pager #prev'),
				nextArrow: $('#slider_pager #next'),
				infinite: false,
				speed: 300,
				autoplay: true,
				autoplaySpeed: 1000,
				slidesToScroll: 1
			});
			$("#p1").click(function(){
				location.href = "product.jsp?productnumber_pk=1&category1=남성의류&category2=티셔츠&category3=민소매티셔츠";
			});
			$("#p2").click(function(){
				location.href = "product.jsp?productnumber_pk=82&category1=여성의류&category2=패딩/점퍼&category3=롱패딩";
			});
			$("#p3").click(function(){
				location.href = "product.jsp?productnumber_pk=66&category1=남성의류&category2=티셔츠&category3=반팔티셔츠";
			});
			$("#p4").click(function(){
				location.href = "product.jsp?productnumber_pk=68&category1=남성의류&category2=티셔츠&category3=반팔티셔츠";
			});
			$("#p5").click(function(){
				location.href = "product.jsp?productnumber_pk=33&category1=남성의류&category2=티셔츠&category3=긴팔티셔츠";
			});
			$("#p6").click(function(){
				location.href = "product.jsp?productnumber_pk=67&category1=남성의류&category2=티셔츠&category3=반팔티셔츠";
			});
			$("#p7").click(function(){
				location.href = "product.jsp?productnumber_pk=22&category1=남성의류&category2=티셔츠&category3=민소매티셔츠";
			});
			$("#p8").click(function(){
				location.href = "product.jsp?productnumber_pk=83&category1=여성의류&category2=패딩/점퍼&category3=롱패딩";
			});
			$("#p9").click(function(){
				location.href = "product.jsp?productnumber_pk=30&category1=남성의류&category2=티셔츠&category3=긴팔티셔츠";
			});
			$("#p10").click(function(){
				location.href = "product.jsp?productnumber_pk=32&category1=남성의류&category2=티셔츠&category3=긴팔티셔츠";
			});
			
	    });
	</script>
</head>
<body>
<%--
	<script>
		$(this).ready(function(){
			$("#header").load('mainheader.jsp');
		});
	</script>
 --%>
 <div>
	<div id="header">
		<%@ include file="mainheader.jspf" %>

	<div class="container">
		<div id="slider">
			<div id="slider_ad">
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828901944.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/830013572.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/825349649.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829892367.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828675501.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828675124.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/794647434.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828139924.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829062065.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829839241.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828901944.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/830013572.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/825349649.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829892367.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828675501.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828675124.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/794647434.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828139924.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829062065.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/829839241.jpg"/></div>
				<div><img src="https://media.bunjang.co.kr/images/nocrop/828901944.jpg"/></div>
			</div>
			<div id="slider_pager">
				<button id="prev">&lt;</button>
				<button id="next">&gt;</button>
			</div>
		</div>
		<div class= advertisement>
			<img src="images/mainad.png"/>
		</div>
		<h2 class="recommendtitle"><span> 오늘의 상품 추천</span></h2>
		<div class="recommendboardshape">
			<div class="recommendboardcast">
				<div class="productcast">
					<div class="product">
						<img src = "images/rb_min.png" alt= "상품이미지" height="194px" width="194px" id = "p1"/>
						<div class="producttextbar">
							<span class="product_name">(L)르브론 클리블랜드 농구 져지 유니폼</span><br/>
							<div class="fll product_price"><b>35,000원</b></div>
							<div class="flr"><span class="product_hour">3일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/bbrpadding.png" alt= "상품이미지" height="194px" width="194px" id = "p2"/>
						<div class="producttextbar">
							<span class="product_name">버버리아비데일 유광6사이즈</span><br/>
							<div class="fll product_price"><b>750,000원</b></div>
							<div class="flr"><span class="product_hour">28일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/pxg-st.png" alt= "상품이미지" height="194px" width="194px" id = "p3"/>
						<div class="producttextbar">
							<span class="product_name">PXG 반팔 티셔츠</span><br/>
							<div class="fll product_price"><b>160,000원</b></div>
							<div class="flr"><span class="product_hour">1일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/commededoubleheart-st.png" alt= "상품이미지" height="194px" width="194px" id = "p4"/>
						<div class="producttextbar">
							<span class="product_name">[L]꼼데 가르송 더블하트 카모반팔티</span><br/>
							<div class="fll product_price"><b>50,000원</b></div>
							<div class="flr"><span class="product_hour">1일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/babari_LT1.png" alt= "상품이미지" height="194px" width="194px" id = "p5"/>
						<div class="producttextbar">
							<span class="product_name">ARMY 긴팔티 M</span><br/>
							<div class="fll product_price"><b>30,000원</b></div>
							<div class="flr"><span class="product_hour">21일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/supreme-st.png" alt= "상품이미지" height="194px" width="194px" id = "p6"/>
						<div class="producttextbar">
							<span class="product_name">슈프림 스톤아일랜드 반팔티</span><br/>
							<div class="fll product_price"><b>195,000원</b></div>
							<div class="flr"><span class="product_hour">6일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/wonder_min.png" alt= "상품이미지" height="194px" width="194px" id = "p7"/>
						<div class="producttextbar">
							<span class="product_name">원더플레이스 그레이 민소매 프리사이즈</span><br/>
							<div class="fll product_price"><b>10,000원</b></div>
							<div class="flr"><span class="product_hour">2일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/shortpadding.png" alt= "상품이미지" height="194px" width="194px" id = "p8"/>
						<div class="producttextbar">
							<span class="product_name">short Padding maria edition</span><br/>
							<div class="fll product_price"><b>60,000원</b></div>
							<div class="flr"><span class="product_hour">1일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/iap_LT.png" alt= "상품이미지" height="194px" width="194px" id = "p9"/>
						<div class="producttextbar">
							<span class="product_name">아이앱 후드티 (올리브 초판)</span><br/>
							<div class="fll product_price"><b>250,000원</b></div>
							<div class="flr"><span class="product_hour">19일 전</span></div>
						</div>
					</div>
					
					<div class="product">
						<img src = "images/junji_LT1.png" alt= "상품이미지" height="194px" width="194px" id = "p10"/>
						<div class="producttextbar">
							<span class="product_name">나이키 드라이핏 시러큐스대학 긴팔티셔츠 L</span><br/>
							<div class="fll product_price"><b>200,000원</b></div>
							<div class="flr"><span class="product_hour">18일 전</span></div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="fl top_line" style="margin-top:20px; width:100%">
		<div class="div1" style="margin-top:10px; margin-bottom:10px">
			<a style="border-right:1px solid rgb(238, 238, 238); padding-right:25px; font-size:13px">회사소개</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">이용약간</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">운영정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">개인정보처리방침</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">광고운영정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">청소년보호정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">위치기반서비스 이용약관</a>
		</div>
	</div>
	<div class="fl top_line" style="margin-top:10px; width:100%">	
		<div class="div1" style="margin-top:20px">
			<div style="width:1024px"> 
				<div class="fl"style="width:512px">
					<div style="font-size:14px;color:rgb(102, 102, 102)">번개장터(주) 사업자정보</div>
						<div class="JS_box6">
							대표이사 : 홍성권   |   개인정보보호책임자 : 박종선<br/>
							사업자등록번호 : 113-86-45836   |   통신판매업신고 : 2019-서울서초-1126<br/>
							호스팅서비스 제공자 : Amazon Web Services (AWS)<br/>
							EMAIL : help@bunjang.co.kr   |   FAX : 02-598-8241<br/>
							주소 : 서울특별시 서초구 서초대로38길 12, 타워1 1층, 타워2 7층 지하1층<br/>
							(서초동, 마제스타시티)<br/>
							<a>사업자정보 확인</a>
						</div>
				</div>
				<div class="fl"style="width:512px">
					<div style="font-size:14px;color:rgb(102, 102, 102)">고객센터</div>
					<div style="font-size:25px;color:rgb(102, 102, 102)">1670-2910</div>
					<div style="font-size:12px;color:rgb(127, 127, 127);">
						운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 13시 - 14시)<br/>
						<a class="link2"href="TM_NOTICE.html">공지사항</a>
						<a class="link2"href="TM_QNA.html">1:1문의하기</a>
						<a class="link2"href="TM_FAQ.html">자주 묻는 질문</a>
					</div>
				</div>
			</div>
			<div class="fl"style="width:1024px; margin-top:16px">
				<div class="fl"style="width:512px">
					<div class="JS_box6">
						<p>번개장터(주)더현대서울점   |   김동인   |   365-85-01581<br/>
						서울특별시 영등포구 여의대로 108, 지하2층(여의도동, 파크원)<br/>
						번개장터(주)코엑스점   |   이재후   |   142-85-27412<br/>
						서울특별시 강남구 영동대로 513, 쇼핑몰동 B1층 C102호(삼성동, 코엑스)<br/>
						번개장터(주)센터필드점   |   이재후   |   808-85-01905<br/>
						서울특별시 강남구 테헤란로 231, 쇼핑몰동 1층 W124호(역삼동)(역삼동, 센터필드)<br/></p>
					</div>
				</div>
				<div class="fl"style="width:512px">
					<div style="font-size:14px;color:rgb(102, 102, 102)">
						우리은행 채무지급보증 안내
					</div>
					<div style="margin-top:0.5rem;font-size:12px;color:rgb(102, 102, 102)">
						번개장터㈜는 “BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점이 판매한<br/>
						상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하<br/>
						고 있습니다.<br/>
						<a>서비스 가입사실 확인</a><br/>
						Ⓒ Bungaejangter. Inc All rights reserved.
					</div>
				</div>
			</div>
			<div class="fl top_line" style="width:1024px; padding-top:16px; margin-top:40px">
				<div class="fl"style="width:1024px">
					<div class="fl"style="width:512px">
						<img class="fl" src="images/TM_ISMS.png" width="31" height="28" style="margin-right:16px">
						<div class="fl" style="font-size:11px;color:rgb(102, 102, 102)">
						<p style="margin:0">
							[인증범위] 번개장터 중고거래 플랫폼 서비스 운영(심사받지 않은 물리적 인프라 제외)<br/>
							[유효기간] 2021.05.18 ~ 2024.05.17
						</p>
						</div>
					</div>
					<div class="fl"style="width:512px">
						<div class="fl" style="font-size:11px;color:rgb(102, 102, 102)">
						<p style="margin:0">
							“BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들<br/>
							에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상<br/>
							품정보 및 거래에 대해 책임을 지지 않습니다.
						</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>