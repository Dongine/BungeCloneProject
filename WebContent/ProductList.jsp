<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*" %>
<%@ page import = "com.bunge.dto.*"%>
<%@ page import = "com.bunge.dao.*" %>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	int productnumber = 0;

	ProductListDao bDao = new ProductListDao();
	//String categori = request.getParameter("categori");
	String category1 = request.getParameter("category1");
	String category1Code = bDao.getCategory1Code(category1);
	String category2 = request.getParameter("category2");
	String category2Code = bDao.getCategory2Code(category1Code, category2);
	String category3 = request.getParameter("category3");  //a2_b5_c2
	String categori = bDao.getCategoriFromCategoryName(category3, category1Code);
	ArrayList<String> listCategory2 = bDao.getCategory2List(category1Code); //a2-> 반팔 티셔츠
	ArrayList<String> listCategory3 = bDao.getCategory3List(category2Code);
	
	String categoryl ="";
	String categorym ="";
	String categorys ="";
	
	String order = request.getParameter("order");
	String classBoardTotalState01 = "";    // 최신순, 인기순, 저가순, 고가순
	String classBoardTotalState02 = "";
	String classBoardTotalState03 = "";
	String classBoardTotalState04 = "";
	if(order==null) {
		order = "registration_date desc";
		classBoardTotalState01 = "red";
	} else if(order.equals("최신순")) { 
		order = "registration_date desc";
		classBoardTotalState01 = "red";
	} else if(order.equals("인기순")) {
		order = "jjim_quantity desc";
		classBoardTotalState02 = "red";
	} else if(order.equals("저가순")) {
		order = "price asc";
		classBoardTotalState03 = "red";
	} else if(order.equals("고가순")) {
		order = "price desc";
		classBoardTotalState04 = "red";
	} else {	// (혹시 몰라서.)
		order = "registration_date desc";
		classBoardTotalState01 = "red";
	}

	ArrayList<ProductListDto> listProduct = bDao.getProductListByCategoryOrderBy(categori, order);
	int listProductSize = bDao.getProductListSizeByCategory(categori);
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "css/ProductList.css"/>
<link rel="shortcut icon" href="images/favicon.ico">
<meta charset="UTF-8">
<title>게시판</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$(".boardcategoriSoption").on("change", function() {
			var selectedValue = $(this).val(); //ProductList.jsp
			location.href = "Controller?command=GoProductList&category1=<%=category1%>&category2=<%=category2%>&category3=" + selectedValue;
		});
		
		$(".saledone").click(function(){
			alert("이미 판매된 상품입니다.");
		});
	});
</script>
</head>
<body>
	<div id="header">
		<%@ include file="mainheader.jspf" %>
	</div>
	<div class="boardmain">
		<div class="boardcast">
			<div class="board">
				<div class="boardcategori">
					<div class="boardhome">
						<img src="images/categorihome.png" width="15" height="15" alt="카테고리 네비게이션 아이콘">홈
					</div>
					<div class="boardcategoricast">
						<img src="images/categoriarrowright.png" width="6" height="10" alt="카테고리 선택그룹 아이콘">
						<div class="boardcategoriL">
							<div class="boardcategoriLbox">
								<select class="boardcategoriLoption">
								<%
									String[] arrCategory1 = {
										"여성의류", "남성의류", "신발", "가방", "시계/쥬얼리", "패션 액세사리", "디지털/가전", "스포츠/레저", "차량/오토바이", "스타굿즈",
										"키덜트", "예술/희귀/수지품", "음반/악기", "도서/티켓/문구", "뷰티/미용", "가구/인테리어", "생활/가공식품", "유아동/출산",
										"반려동물용품", "기타", "지역 서비스", "원룸/함계살아요", "번개나눔", "구인구직", "재능", "커뮤니티"
									};
								
									for(String category : arrCategory1) {
										String bonus = (category.equals(category1)) ? "selected" : "";
								%>
										<option value="<%=category%>" <%=bonus%>><%=category%></option>
								<%
									}
								%>
									<!-- <option value="">여성의류</option>
									<option value="">남성의류</option>
									<option value="">신발</option>
									<option value="">가방</option>
									<option value="">시계/쥬얼리</option>
									<option value="">패션 액세서리</option>
									<option value="">디지털/가전</option>
									<option value="">스포츠/레저</option>
									<option value="">차량/오토바이</option>
									<option value="">스타굿즈</option>
									<option value="">키덜트</option>
									<option value="">예술/희귀/수집품</option>
									<option value="">음반/악기</option>
									<option value="">도서/티켓/문구</option>
									<option value="">뷰티/미용</option>
									<option value="">가구/인테리어</option>
									<option value="">생활/가공식품</option>
									<option value="">유아동/출산</option>
									<option value="">기타</option>
									<option value="">지역 서비스</option>
									<option value="">원룸/함께살아요</option>
									<option value="">번개나눔</option>
									<option value="">구인구직</option>
									<option value="">재능</option>
									<option value="">커뮤니티</option> -->
								</select>
							</div>
						</div>
					</div>
					<div class="boardcategoricast">
						<img src="images/categoriarrowright.png" width="6" height="10" alt="카테고리 선택그룹 아이콘">
						<div class="boardcategoriM">
							<div class="boardcategoriMbox">
								<!-- <div class="boardcategoriLcast">
									남성의류
									<img src="../Images/categoriarrowbottom.png" width="10" height="6" alt="카테고리 화살표 아이콘">
								</div> -->
								<select class="boardcategoriMoption"><!-- 남성의류 -->
								<%  
									for(String category : listCategory2) {
										String bonus = (category.equals(category2)) ? "selected" : "";
								%>
										<option value="<%=category%>" <%=bonus%>><%=category%></option>
								<%
									}
								%>
<!-- 									<option value="">패딩/점퍼</option>
									<option value="">코트</option>
									<option value="">맨투맨</option>
									<option value="">후드티/후드집업</option>
									<option value="">티셔츠</option>
									<option value="">셔츠</option>
									<option value="">가디건</option>
									<option value="">니트/스웨터</option>
									<option value="">바지</option>
									<option value="">청바지</option>
									<option value="">반바지</option>
									<option value="">자켓</option>
									<option value="">정장</option>
									<option value="">조끼/베스트</option>
									<option value="">트레이닝</option>
									<option value="">언더웨어/홈웨어</option>
									<option value="">테마/이벤트</option>
 -->								</select>
							</div>
						</div>
					</div>
				<div class="boardcategoricast">
					<img src="images/categoriarrowright.png" width="6" height="10" alt="카테고리 선택그룹 아이콘">
					<div class="boardcategoriS">
						<div class="boardcategoriSbox">
								<!-- <div class="boardcategoriLcast">
									남성의류
									<img src="../Images/categoriarrowbottom.png" width="10" height="6" alt="카테고리 화살표 아이콘">
								</div> -->
								<select class="boardcategoriSoption">
								<%
									for(String category : listCategory3) {
										String bonus = (category.equals(category3)) ? "selected" : "";
								%>
										<option value="<%=category%>" <%=bonus%>><%=category%></option>
								<%
									}
								%>
									<!-- <option value="">긴팔 티셔츠</option>
									<option value="">반팔 티셔츠</option>
									<option value="">민소매 티셔츠</option> -->
								</select>
							</div>
					</div>
				</div>
			</div>
			<div class="boardtitle">
				<div class="boardtitlecast">
					<div class="boardtotal">
						<%=category3 %>
						의 전체상품
						<span class="boardtotalproduct">
						<%=listProductSize %>개
						</span>
					</div> 
					<div class="boardtotalstates">
						<a class="boardtotalstate1 <%=classBoardTotalState01%>" href="Controller?command=GoProductList&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>&order=최신순">최신순</a>
						<a class="boardtotalstate2 <%=classBoardTotalState02%>" href="Controller?command=GoProductList&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>&order=인기순">인기순</a>
						<a class="boardtotalstate2 <%=classBoardTotalState03%>" href="Controller?command=GoProductList&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>&order=저가순">저가순</a>
						<a class="boardtotalstate2 <%=classBoardTotalState04%>" href="Controller?command=GoProductList&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>&order=고가순">고가순</a>
					</div>
				</div>
			</div>
			<div class="boardproductmain">
				<div class="recommendboardshape">
					<div class="recommendboardcast">
						<div class="productcast">
							
							<%
								DecimalFormat decFormat = new DecimalFormat("###,###");
								for(ProductListDto dto : listProduct) {
									String strPrice = decFormat.format(dto.getPrice());
									productnumber = dto.getProductnumber_pk();
									if((dto.getPurchase_status()).equals("판매완료")){
							%>
							<div class="productshape">
								<a class="productlink" href ="Controller?command=GoProductList&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>">
									<div class="productimg">
										<img src = "images/saledone.png" alt= "상품이미지" height="194px" width="194px" class = "saledone"/>
									<%
										} else{
									%>
							<div class="productshape">
								<a class="productlink" href ="Controller?command=GoProduct&productnumber_pk=<%=productnumber %>&category1=<%=category1 %>&category2=<%=category2 %>&category3=<%=category3 %>">
									<div class="productimg">
										<img src = "images/<%=dto.getImagename() %>" alt= "상품이미지" height="194px" width="194px"/>
									<%
										}
									%>
									</div>
									<div class="producttextbar">
										<div class="product_name"><%=dto.getProductname() %></div><br/>
										<div class="fll product_price"><b><%=strPrice %>원</b></div>
										<div class="flr"><span class="product_hour"><%=dto.getRegistration_date() %>일 전</span></div>  <!-- 버림 : 1시간 전 -->
									</div>
									<div class="product_area">
										<img src= "images/productarea.png" width="15" height="17" alt = "위치 아이콘"><%=dto.getTrading_area() %>
									</div>
								</a>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<%--
			<!--  Pagination : 나중에. -->
			<div class= "productpage">
				<div class= "productpagecast">
					<a class= "productpagenum">
						<img src = "../Images/categoriarrowleft.png" width ="12" height = "12" alt= "페이징 아이콘">
					</a>
					<a class= "productpagenum">1</a>
					<a class= "productpagenum">2</a>
					<a class= "productpagenum">3</a>
					<a class= "productpagenum">4</a>
					<a class= "productpagenum">5</a>
					<a class= "productpagenum">6</a>
					<a class= "productpagenum">7</a>
					<a class= "productpagenum">8</a>
					<a class= "productpagenum">9</a>
					<a class= "productpagenum">10</a>
					<a class= "productpagenum">
						<img src = "../Images/categoriarrowright.png" width = "12" height ="12" alt= "페이징 아이콘">
					</a>
					
				</div>
			</div>
			 --%>
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

</body>
</html>