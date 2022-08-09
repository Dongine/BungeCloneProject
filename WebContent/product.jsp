<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*" %>
<%@ page import = "com.bunge.dto.*"%>
<%@ page import = "com.bunge.dao.*" %>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	JjimDao jjimDao = new JjimDao();
%> 
<%
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
    int productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
	
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

	ProductListDao pDao = new ProductListDao();
	ArrayList<ProductDetailDto> listProductDetail = pDao.getProductDetailDto(productnumber_pk);
	bDao.increaseHitcount(productnumber_pk);
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "css/product.css"/>
<link rel="shortcut icon" href="images/favicon.ico">
<meta charset="UTF-8">
<title>상품</title>
<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$(".purchasercall").click(function(){
			location.href="Controller?command=GoMainTalkFromProduct&productnumber_pk=<%=productnumber_pk%>";
		});
		$(".productbuttonstore").click(function(){
			location.href = "Controller?command=GoTM4";
		});
		$(".boardcategoriSoption").on("change", function() {
			var selectedValue = $(this).val();
			location.href = "Controller?command=GoProductList&category1=<%=category1%>&category2=<%=category2%>&category3=" + selectedValue;
		});
		
		$(".productrightbuttonjjimselect").click(function(){
			location.href = "Controller?command=ProductJjimDeleteAction&nickname_pk=<%=NICKNAME_PK %>&productnumber_pk=<%=productnumber_pk%>&category1=<%=category1%>&category2=<%=category2%>&category3=<%=category3%>";
		});
		
		$(".productrightbuttonjjim").click(function(){
			location.href = "Controller?command=ProductJjimInsertAction&productnumber_pk=<%=productnumber_pk%>&category1=<%=category1%>&category2=<%=category2%>&category3=<%=category3%>";
		});
		
	});
	
	</script>
</head>
<body>
	
	<div id="header">
		<%@ include file="mainheader.jspf" %>
	</div>
	<div class= "productmain">
		<div>
			<div class="productmainshape">
				<div class="productmaincast">
					<div class="boardcategori">
					<div class="boardhome">
						<img src="images/categorihome.png" width="15" height="15" alt="카테고리 네비게이션 아이콘">홈
					</div>
					<div class="boardcategoricast">
						<img src="images/categoriarrowright.png" width="6" height="10" alt="카테고리 선택그룹 아이콘">
						<div class="boardcategoriL">
							<div class="boardcategoriLbox">
								<!-- <div class="boardcategoriLcast">
									남성의류
									<img src="../Images/categoriarrowbottom.png" width="10" height="6" alt="카테고리 화살표 아이콘">
								</div> -->
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
					<%
						DecimalFormat decFormat = new DecimalFormat("###,###");
						for(ProductDetailDto dto : listProductDetail){
						String strPrice = decFormat.format(dto.getPrice());
							String category = dto.getCategory();
							category = "반팔 티셔츠";
					%>
					<div class= "product">
						<div class = "productcast">
							<div class= "productleft">
								<div class = "productleftcast">
									<div class= "productleftimgs">
										<img src="images/<%=dto.getImagename()%>" class="productleftimg"/>
										<img src="images/blackout-st.png" class="productleftimghidden"/>
										<img src="images/tasty-st.png" class="productleftimghidden"/>
										<div class="productleftbrand">
										</div>
									</div>
									<div class= "productleftproduct"></div>
									<!-- <button class= "productleftarrowleft">
										<img src = "images/categoriarrowleft.png" width = "12" height = "22" alt = "이전 페이지 이동 버튼 아이콘"/>
									</button>
									<button class= "productleftarrowright">
										<img src = "images/categoriarrowright.png" width = "12" height = "22" alt = "다음  페이지 이동 버튼 아이콘"/>
									</button>
									<button class= "productleftexpansion">
										<img src = "images/productexpansion.png" width= "16" height= "16" alt ="확대 버튼 아이콘">확대
									</button> -->
									<!-- <div class= "productleftimgslider">
										<button disabled class = "productleftimgsliderbuttonmaking"></button>
										<button class = "productleftimgsliderbutton"></button>
										<button class = "productleftimgsliderbutton"></button>
									</div> -->
									<div class= "productleftexpansiondisplay">
										<div class="productleftexpansiondisplaycast">
											<button type= "button" class= "productleftexpansiondisplayexit">
												<img src="images/productexpansionexit.png" width= "34" height = "32" alt = "닫기 버튼 아이콘">
											</button>
											<div>
												<div class = "productleftexpansionhiddentitle">
													테스트용제목
												</div>
												<div class = "productleftexpansionhiddenimgs">
													<div class = "productleftexpansionhiddenimg">
														<img src = "images/bbr-st.png" width = "550" height = "550"alt = "리뷰 이미지"/>
														<div class ="productleftexpansionhiddenimgcast"></div>
													</div>
													<div class = "productleftexpansionhiddenimg">
														<img src = "images/blackout-st.png" width = "550" height = "550"alt = "리뷰 이미지"/>
														<div class ="productleftexpansionhiddenimgcast"></div>
													</div>
													<div class = "productleftexpansionhiddenimg">
														<img src = "images/tasty-st.png" width = "550" height = "550"alt = "리뷰 이미지"/>
														<div class ="productleftexpansionhiddenimgcast"></div>
													</div>
												</div>
												<div class= "productleftexpansionhiddenimgslider">
													<button disabled class = "productleftexpansionhiddenimgsliderbuttonmaking"></button>
													<button class = "productleftexpansionhiddenimgsliderbutton"></button>
													<button class = "productleftexpansionhiddenimgsliderbutton"></button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class= "productright">
								<div class= "productrightcast">
									<div class = "productrightinfo">
										<div class= "productrightinfocast">
											<div class= "productrightinfotitle">
												<%= dto.getProductname() %>
											</div>
											<div class= "productrightinfomiddle">
												<div class= "productrightinfoprice">
													<%= strPrice %>
													<span>원</span>
												</div>
												<div class= "productrightinfopay">
													<span class="productrightinfopaycast">
														<img src = "images/brandpay.png" alt="번개 페이 가능"/>
													</span>
												</div>
												<button class= "productrightinfoappbutton">
													<img src = "images/appbutton.png" width= "216" height = "30" alt ="앱 다운로드 아이콘"/>
												</button>
											</div>
										</div>
										<div class= "productrightinfo">
											<div class = "productrightinfomation">
												<div class = "productrightinfomationcast">
													<div class = "productrightinfomationjjimhitcountregistration">
														<img src = "images/jjim.png" width = "16" height = "16" alt = "상품 상태 아이콘"/>
														<div class= "productrightinfomationjjim"><%=jjimDao.getJjimCount(productnumber_pk) %></div>
													</div>
													<div class = "productrightinfomationjjimhitcountregistration">
														<img src = "images/hitcount.png" width ="21" height ="13" alt = "상품 상태 아이콘"/><%= dto.getHitcount()%>
													</div>
													<div class = "productrightinfomationjjimhitcountregistration">
														<img src = "images/registration.png" width ="16" height ="16" alt = "상품 상태 아이콘"/><%= dto.getRegistration_date() %>일 전
													</div>
												</div>
												<!-- <button class = "productrightinfomationreport">
													<img src = "images/report.png" width = "15" height = "15" alt = "신고 아이콘"/>신고하기
												</button> -->
											</div>
											<div class = "productrightinfo">
												<div class = "productrightinfomationmiddlecast">
													<div class ="productrightinfomationstate">
														상품상태
													</div>
													<div class ="productrightinfomationstateinput"><%= dto.getProductstate() %></div>	
												</div>
												<div class = "productrightinfomationmiddlecast">
													<div class = "productrightinfomationexchange">
														교환여부
													</div>
													<div class = "productrightinfomationexchangeinput"><%= dto.getExchange() %></div>
												</div>
												<div class = "productrightinfomationmiddlecast">
													<div class = "productrightinfomationdelivery">
														배송비
													</div>
													<div class = "productrightinfomationdeliveryinput"><%= dto.getDelivery_charge() %></div>
												</div>
												<div class = "productrightinfomationmiddlecast">
													<div class = "productrightinfomationarea">
														거래지역
													</div>
													<div class = "productrightinfomationareainput">
														<img src = "images/producttracingarea.png" width="12" height="15" alt = "지역 아이콘"/>
														<%= dto.getTrading_area() %>
													</div>
												</div>
											</div>
										</div>
									</div>
									<%
										if((dto.getNickname_fk()).equals(NICKNAME_PK)==false){
										
									%>
									<div class = "productrightbutton">
										<div class = "productrightbuttoncast">
											<%
												if(jjimDao.isJjim(productnumber_pk, NICKNAME_PK)==1) {
											%>
											<button class = "productrightbuttonjjimselect">
												<img src = "images/redheart.png" width ="16" height="16" alt = "찜 아이콘">
												<span>찜</span>
												<%-- <span><%= dto.getJjim_quantity() %></span> --%>
												<span><%=jjimDao.getJjimCount(productnumber_pk) %></span>
											</button>
											<%			
												} else {
											%>
											<button class = "productrightbuttonjjim">
												<img src = "images/whiteheart.png" width ="16" height="16" alt = "찜 아이콘">
												<span>찜</span>
												<%-- <span><%= dto.getJjim_quantity() %></span> --%>
												<span><%=jjimDao.getJjimCount(productnumber_pk) %></span>
											</button>
											<%
												}
											%>
											<div class = "productrightbuttonclick">
												<img src = "images/productcheck.png" width = "14" height = "14" alt = "찜 아이콘">
												<span class = "productrightbuttonclicktext">찜이 해제</span>
												되었습니다.
											</div>
										</div>
										<button class = "productrightbuttoncall purchasercall">
											연락하기
										</button>
										<!-- <button class = "productrightbuttonpurchase">
											바로구매
										</button> -->
									</div>
									<%
										} else if((dto.getNickname_fk()).equals(NICKNAME_PK)==true){
									%>
									<div class = "productrightbutton">
										<button class = "productbuttonstore">
											내 상점 관리
										</button>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class ="productrelation">
						<div class = "productrelationcast">
							<div class = "productrelationtitle">
								<div class = "productrelationtitleleft">
									연관상품
									<div class = "productrelationtitlelefttext">
										<div class = "productrelationtitleleftcast">
											AD
										</div>
										<img src = "images/productad.png" width="14" height="14" alt = "AD 가이드"/>
									</div>
								</div>
								<div class = "productrelationtitleright">
									1
									/
									4
								</div>
							</div>
							<div class = "productrelationproduct">
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/northfacepadding.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											노스페이스 익스플로링
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/n-qcr-st.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											나이키 퓨추라 반팔티
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/dedgers-st.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											마제스틱 다저스 류현진
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/desang_min.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											데상트 나시
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/aaa.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											몽클레어 이민/아이민
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/thisIs_LT.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											디스이즈네버댓
										</div>
									</a>
								</div>
								<div class = "productrelationproductcast">
									<a class = "productrelationproductmain" href = "#">
										<div class = "productrelationproductimg">
											<img src = "images/uni_min.png" width="155" height="155" alt = "상품 이미지"/>
											<div class = "productrelationproductimgcast"></div>
										</div>
										<div class = "productrelationproducttext">
											유니드론 슬리브
										</div>
									</a>
								</div>
							</div>
							<!-- <button class = "productrelationleftbutton">
								<img src = "images/categoriarrowleft.png" width = "9" height = "14" alt = "페이지 아이콘"/>
							</button>
							<button class = "productrelationrightbutton">
								<img src = "images/categoriarrowright.png" width = "9" height = "14" alt = "페이지 아이콘"/>
							</button> -->							
						</div>
					</div>
					<div class = "productinquiry">
						<div class = "productinquiryleftcast">
							<!-- <div class = "productinquirylefttitle">
								<button type = "button" class = "productinquiryleftinfotext">
									상품정보
									<span class = "productinpuirylefttext"></span>
								</button>
								<button type = "button" class = "productinquiryleftinquirytext">
									상품문의(0)
									<span class = "productinpuirylefttext"></span>
								</button>
							</div> -->
							<div class = "productinquiryleftmain">
								<div class = "productinquiryleftmaincast">
									<div class= "productinquiryleftmaintitle">상품정보</div>
									<div class= "productinquiryleftmaincontent">
										<div class = "productinquiryleftmaincontentcast">
										</div>
										<div class = "productinquiryleftmaincontenttext">
											<%= dto.getProduct_information() %>
										</div>
										<div class= "productinquiryleftmaincontentmiddlecast">
											<div class = "productinquiryleftmaincontentmiddle">
												<div class = "productinquiryleftmaincontentmiddleareaimg">
													<img src = "images/productarea.png" width="16" height="18" alt = "거래지역 아이콘"/>
													거래지역
												</div>
												<div class = "productinquiryleftmaincontentmiddleareatext">
													<span><%= dto.getTrading_area() %></span>
												</div>
											</div>
											<div class = "productinquiryleftmaincontentmiddle">
												<div class = "productinquiryleftmaincontentmiddlecategoriimg">
													<img src = "images/producttag.png" width="16" height="18" alt = "카테고리 아이콘"/>
													카테고리
												</div>
												<div class = "productinquiryleftmaincontentmiddlecategoritext">
													<a href = "#">
														<span class = "productinquiryleftmaincontentmiddlecategoritextcast">
														<%= category %>
														</span>
													</a>
												</div>
											</div>
											<div class = "productinquiryleftmaincontentmiddle">
												<div class = "productinquiryleftmaincontentmiddletagimg">
													<img src = "images/productcategori.png" width="15" height="18" alt = "상품태그 아이콘"/>
													상품태그
												</div>
												<div class = "productinquiryleftmaincontentmiddletaglinkcast">
													<a class = "productinquiryleftmaincontentmiddletaglink">
														#
														<%= dto.getTag() %>
													</a>	
													<a class = "productinquiryleftmaincontentmiddletaglink">
														#
														티셔츠
													</a>
													<a class = "productinquiryleftmaincontentmiddletaglink">
														#
														남성의류
													</a>											
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class = "productinquiryleftmaininquiry">
									<div class = "productinquiryleftmaininquirytitle">
										상품문의
										<span class = "productinquiryleftmaininquirytitletext">0</span>
									</div>
									<div class = "productinquiryleftmaininquirycomment">
										<div class = "productinquiryleftmaininquirycommenttext">
											<textarea placeholder ="상품문의 입력" class = "productinquiryleftmaininquirycommenttextarea"></textarea>
										</div>
										<div class = "productinquiryleftmaininquirycommentregist">
											<div class = "productinquiryleftmaininquirycommentregistcount">0 / 100</div>
											<button class = "productinquiryleftmaininquirycommentregistbutton">
												<img src = "images/productregist.png" width = "15" height="16" alt = "문의등록버튼 아이콘"/>
												등록
											</button>
										</div>
									</div>
									<div class = "productinquiryleftbottom">
									
									</div>
								</div>
							</div>
						</div>
						<%
						}
						%>
						<div class = "productinquiryrightcast">
							<div class = "productinquiryrighturl">
								<button type = "button" class = "productinquiryrighturlblog">
									<img src = "images/blog.png" width = "22" height = "18" alt = "블로그 아이콘">
								</button>
								<button type = "button" class = "productinquiryrighturlfacebook">
									<img src = "images/facebook.png" width = "8" height = "15" alt = "페이스북 아이콘">
								</button>
								<button type = "button" class = "productinquiryrighturltwitter">
									<img src = "images/twitter.png" width = "16" height = "13"  alt = "트위터 아이콘">
								</button>
								<button type = "button" class = "productinquiryrighturlsave">
									<img src = "images/url.png" width = "25" height = "25" alt = "url 아이콘">
									<span class = "productinquiryrighturltext">클릭하여 복사하기</span>
								</button>
							</div>
							<div class = "productinquiryrightmaincast">
								<div class = "productinquiryrightmain">
									<div class = "productinquiryrightmaintitle">상품정보</div>
									<div class = "productinquiryrightmaincontent">
										<div class = "productinquiryrightmaincontentusercast">
											<a class = "productinquiryrightmaincontentuserimg" href = "TM4.jsp">
												<img src = "images/yglogo.png" width = "48" height = "48" alt = "판매자 프로필 이미지"/>
											</a>
											<div class = "productinquiryrightmaincontentuser">
												<a class = "productinquiryrightmaincontentusernickname" href = "TM4.jsp">멋쟁이신사상점</a>
												<div class = "productinquiryrightmaincontentuserfollowcast">
													<a class = "productinquiryrightmaincontentuserfollow">
														상품
														1892
													</a>
													<a class = "productinquiryrightmaincontentuserfollow">
														팔로워
														6
													</a>
												</div>
											</div>
										</div>
										<!-- <button class = "productinquiryrightmaincontentfollowbutton">
											<img src = "images/follow.png" width = "20" height = "14" alt = "화이트 테마 언팔로우 버튼 아이콘"/>
											팔로우
										</button> -->
										<div class = "productinquiryrightmaincontentaddproductcast">
											<div class = "productinquiryrightmaincontentaddproductleftcast">
												<a class = "productinquiryrightmaincontentaddproductleft" href = "TM4.jsp">
													<img src = "images/blackout-st.png" width = "120" height = "96" alt = "상품 이미지"/>
													<div class = "productinquiryrightmaincontentaddproductleftprice">
														<span>30,000</span>	
														원
													</div>
													<div class = "productinquiryrightmaincontentaddproductleftpricebottom">
													</div>
												</a>
											</div>
											<div class = "productinquiryrightmaincontentaddproductrightcast">
												<a class = "productinquiryrightmaincontentaddproductright" href = "TM4.jsp">
													<img src = "images/sts-st.png" width = "120" height = "96" alt = "상품 이미지"/>
													<div class = "productinquiryrightmaincontentaddproductrightprice">
														<span>10,000</span>	
														원
													</div>
													<div class = "productinquiryrightmaincontentaddproductrightpricebottom">
													</div>
												</a>
											</div>
										</div>
										<div class = "productinquiryrightmaincontentuseraddproductcast">
											<a class = "productinquiryrightmaincontentuseraddproduct" href = "TM4.jsp">
												<span class = "productinquiryrightmaincontentuseraddproductcount">
													1890
													개
												</span>
												상품 더보기
											</a>
										</div>
										<div class = "productinquiryrightmaincontentreviewcast">
											<div class = "productinquiryrightmaincontentreviewtitle">
												상점후기
												<span class = "productinquiryrightmaincontentreviewtitlecount">6</span>
											</div>
											<div class = "productinquiryrightmaincontentreviewmain">
												<div class = "productinquiryrightmaincontentreviewmaintop">
													<a class = "productinquiryrightmaincontentreviewmaintopleft" href = "TM4.jsp">
														<img src = "images/maintalk.png" width = "32" height = "32" alt = "리뷰 쓴 사람 프로필 이미지"/>
													</a>
													<div class = "productinquiryrightmaincontentreviewmaintopright">
														<div class = "productinquiryrightmaincontentreviewmaintoprighttitle">
															<a class = "productinquiryrightmaincontentreviewmaintoprightnickname" href = "TM4.jsp">
																상점77759342호
															</a>
															<div class = "productinquiryrightmaincontentreviewmaintoprightregisttime">1주 전</div>
														</div>
														<div class = "productinquiryrightmaincontentreviewmaintoprightstarcast">
															<!-- <div class = "productinquiryrightmaincontentreviewmaintoprightstar">
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
															</div> -->
														</div>
														<div class = "productinquiryrightmaincontentreviewmaintoprightcomment">잘 받았습니다.^^</div>
													</div>
												</div>
												<div class = "productinquiryrightmaincontentreviewmainbottom">
													<a class = "productinquiryrightmaincontentreviewmainbottomleft" href = "TM4.jsp">
														<img src = "images/maintalk.png" width = "32" height = "32" alt = "리뷰 쓴 사람 프로필 이미지"/>
													</a>
													<div class = "productinquiryrightmaincontentreviewmainbottomright">
														<div class = "productinquiryrightmaincontentreviewmainbottomrighttitle">
															<a class = "productinquiryrightmaincontentreviewmainbottomrightnickname" href = "TM4.jsp">
																아가를델고가세요
															</a>
															<div class = "productinquiryrightmaincontentreviewmainbottomrightregisttime">5달 전</div>
														</div>
														<div class = "productinquiryrightmaincontentreviewmainbottomrightstarcast">
															<!-- <div class = "productinquiryrightmaincontentreviewmainbottomrightstar">
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
																<img src = "" width="15" height = "14" alt = "작은 별점 2점 이미지"/>
															</div> -->
														</div>
														<div class = "productinquiryrightmaincontentreviewmainbottomrightcomment">너무 친절하세요!</div>
													</div>
												</div>
											</div>
											<div class = "productinquiryrightmaincontentreviewaddreview">
												<a class = "productinquiryrightmaincontentreviewaddreviewtext" href = "TM4.jsp">
													상점후기 더보기
												</a>
											</div>
										</div> 
									</div>
								</div>
								<div class = "productinquiryrightbottom">
									<button class = "productinquiryrightbottomcall purchasercall">연락하기</button>
									<!-- <button class = "productinquiryrightbottompurchase">바로구매</button> -->
								</div>
							</div>
						</div>
					</div>
					<div class = "productinquiryhiddenmain">
						<div class = "productinquiryhiddencast">
							<!-- <button class = "productinquiryhiddenexitbutton">
								<img src = "" width = "16" height ="17" alt = "닫기 버튼 아이콘"/>
							</button>
							<img class = "" src = "" width = "82" height = "82" alt = "연락하기 프로필 이미지"/>
							<div class = "">
								<div class = "">굿오브케이스</div>
							</div>
							<div class = "">
								<div class = "">
									<div class = "">연락가능시간</div>
									<div class = "">
										<span class = "">10시 ~ 12시</span>
									</div>
								</div>
								<div class = "">
									<div class = "">상점별점후기</div>
									<div class = "">
										<div class = "">
											<img src = "" width = "20" height = "19" alt = "큰 별점 2점 이미지"/>
											<img src = "" width = "20" height = "19" alt = "큰 별점 2점 이미지"/>
											<img src = "" width = "20" height = "19" alt = "큰 별점 2점 이미지"/>
											<img src = "" width = "20" height = "19" alt = "큰 별점 2점 이미지"/>
											<img src = "" width = "20" height = "19" alt = "큰 별점 2점 이미지"/>
										</div>
									</div>
								</div>
								<div class = "">
									<div class = "">상점연락처</div>
									<div class = "">연락처 비공개</div>
								</div>
							</div>
							<div class = "">
								<div class = "">
									<span class = "">안전한 거래를 위해 번개톡으로 연락해주세요.</span>
									(번개톡 > 사기내역조회필수!)
								</div>
							</div>
							<div class = "">
								<a class = "">
									<img src = "" width = "20" height = "19" alt = "번개톡 버튼 아이콘"/>
									번개톡
								</a>
								<a class = "">
									<img src = "" width = "13" height = "20" alt = "연락처확인 버튼 아이콘"/>
									연락처확인
								</a> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>