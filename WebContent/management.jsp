<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.bunge.dto.*" %>
<%@ page import = "com.bunge.dao.*" %>
<%
	/* String nicknamefk = (String)(session.getAttribute("NICKNAME_PK")); *//*session.parse*/
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	ProductListDao pDao = new ProductListDao();
	JjimCountDao jDao = new JjimCountDao();
	ArrayList<ProductDto> listProduct = pDao.getAllProductList(NICKNAME_PK);
%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
 <link rel = "stylesheet" href = "css/management.css"/>
 <link rel="shortcut icon" href="images/favicon.ico">
<meta charset="UTF-8">
<title>상품 관리</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
/* $(this).ready(function(){
	$("#header").load("mainheader.jsp");
}); */
</script>
</head>
<body>
<div id="header">
		<%@ include file="mainheader.jspf" %>
</div>
	
	<div class= "container">
		<div class ="maintitle">
			<div class = "mainshape">
				<div class="regis">
					<a href="Controller?command=GoSale">상품등록</a>
				</div>
				<div class="magagement">
					<a href="Controller?command=GoManagement">상품관리</a>
				</div>
				<div class="tradelist">
					<a href="tradelist.jsp" target ="_black">구매/판매 내역</a>
				</div>
			</div>
		</div>
		<div class="basicinfomation">
			<div class="main">
				<header class="topcast">
					<form class="topsearchcast">
						<input type="text" placeholder ="상품명을 입력해주세요." value="">
						<button type="submit" class="topsearchbox"></button>
					</form>
					<select class="topbundle">
						<option value="">10개씩</option>
						<option value="">20개씩</option>
						<option value="">30개씩</option>
					</select>
					<select class="topbundle">
						<option value="">전체</option>
						<option value="">판매 중</option>
						<option value="">예약 중</option>
						<option value="">판매완료</option>
					</select>
				</header>
				<table>
					<thead>
						<tr>
						<th>사진</th>
						<th>판매상태</th>
						<th>상품명</th>
						<th>가격</th>
						<th>안전결제 환영</th>
						<th>찜</th>
						<th>최근수정일</th>
						<th>수정</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(ProductDto pboard: listProduct) {
					%>
						<tr>
							<td>
								<a href="#">
									<img src="images/<%= pboard.getImagename() %>" alt ="상품이미지" height ="152px" width = "152px">
								</a>
							</td>
							<td>
								<select class="topbundle">
									<option value="">판매중</option>
									<option value="">예약중</option>
									<option value="">삭제</option>
									<option value="">판매완료</option>
								</select>
							</td>
							<td>
								<a href="#"><%= pboard.getProductname() %></a>
							</td>
							<td>
								<%= pboard.getPrice() %>
								원
							</td>
							<td>
								<%= pboard.getSafetypayment() %>
							</td>
							<td>
								<%= pboard.getJjimquantity() %>
							</td>
							<td>
								<%= pboard.getLastupdate() %>
							</td>
							<td>
								<button type="button" class="functionup">UP</button>
								<a class ="crystal" href="Controller?command=GoModification&productnumber=<%= pboard.getProductnumberpk()%>">수정</a>
							</td>																	
						</tr>
						<%
							}						
						%>
					</tbody>
				</table>
			</div>
			<footer class="footer"><!-- 사진 추가, 갯수 늘리기 -->
				<div class="footercast">
					<a class="footerbar">
						<img src="#" width="12" height="12" alt="페이징 아이콘" class="footernextbar">
					</a>
					<a class="footernum">1</a>
					<a class="footerbar">
						<img src="#" width="12" height="12" alt="페이징 아이콘">
					</a>
				</div>
			</footer>
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
	</div>
</body>
</html>