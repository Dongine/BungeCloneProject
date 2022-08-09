<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link rel="shortcut icon" href="images/favicon.ico">
<%
    String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbID = "bg";
	String dbPW = "1234";
	
	Connection conn = null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, dbID, dbPW);
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet"href="css/TM_QNA_NEW.css">
	<script>
		$(function(){
			$('#sel').on('change',function(){
				if((this.value)=="거래신고"){
					$('#1').css('display','block');
					$('#2').css('display','block');
					$('#3').css('display','none');
					$('#4').css('display','none');
					$('#5').css('display','none');
					$('#6').css('display','none');
				}
			});
			$('#sel').on('change',function(){
				if((this.value)=="회원/계정"){
					$('#3').css('display','block');
					$('#1').css('display','none');
					$('#2').css('display','none');
					$('#4').css('display','none');
					$('#5').css('display','none');
					$('#6').css('display','none');
				}
			});
			$('#sel').on('change',function(){
				if((this.value)=="기타 서비스"){
					$('#4').css('display','block');
					$('#1').css('display','none');
					$('#2').css('display','none');
					$('#3').css('display','none');
					$('#5').css('display','none');
					$('#6').css('display','none');
				}
			});
			$('#sel').on('change',function(){
				if((this.value)=="판매광고"){
					$('#5').css('display','block');
					$('#1').css('display','none');
					$('#2').css('display','none');
					$('#4').css('display','none');
					$('#3').css('display','none');
					$('#6').css('display','none');
				}
			});
			$('#sel').on('change',function(){
				if((this.value)=="오류/신고/제안"){
					$('#6').css('display','block');
					$('#1').css('display','none');
					$('#2').css('display','none');
					$('#4').css('display','none');
					$('#5').css('display','none');
					$('#3').css('display','none');
				}
			});
		});
	</script>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<a href="Controller?command=GoQna"><!-- ../TM_QNA.jsp -->
				<img src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			</a>
			<div class="font14 ch">
				<a href="Controller?command=GoQna">취소</a>
			</div>
		</div>
		<form action="Controller?command=GoNewFormAction"id="detailForm"  method="post"><!-- NEW_ACTION.jsp -->
			<div class="main tl box width">
				<div class="fl box1 font28 width">1:1문의하기</div>
				<div class="fl box2 width">
					<div class="fl font14"style="margin-bottom: 10px;">유형 선택</div>
					<div class="fl width"> <!-- 거래신고 -->
						<select id="sel"name="typeSelect" class="box2-1 width font16" >
							<option value=""disabled selected>유형을 선택해 주세요</option>
							<option value="거래신고">거래신고</option>
							<option value="회원/계정">회원/계정</option>
							<option value="기타 서비스">기타 서비스</option>
							<option value="판매광고">판매광고</option>
							<option value="오류/신고/제안">오류/신고/제안</option>
						</select>
					</div>
				</div>
				<div class="fl box2 width hidden"id="1">
					<div class="fl font14"style="margin-bottom: 10px;">
						상세 유형 선택
					</div>
					<div class="fl width">
						<select name="detailsTypeSelect" class="box2-1 width font16">
							<option value="" disabled selected>상세 유형을 선택해 주세요</option>
							<option>판매자 신고</option>
							<option>상태불량</option>
							<option>구매자 신고</option>
							<option>허위매물</option>
						</select>
					</div>
				</div>
				<div class="fl box2 width hidden"id="2">
					<div class="fl font14"style="margin-bottom: 10px;">
						상점명
					</div>
					<div class="fl width">
						<input name="reportedNicknameFk" type="text" class="box2-1 width font16"placeholder="신고할 상점명을 입력해 주세요.">
					</div>
				</div>
				<div class="fl box2 width hidden"id="3">	<!-- 회원 계정 -->
					<div class="fl font14"style="margin-bottom: 10px;">
						상세 유형 선택
					</div>
					<div class="fl width">
						<select name="detailsTypeSelect"class="box2-1 width font16" >
							<option value="" disabled selected>상세 유형을 선택해 주세요</option>
							<option>로그인/본인 인증</option>
							<option>계정차단</option>
							<option>기타</option>
						</select>
					</div>
				</div>
				<div class="fl box2 width hidden"id="4">	<!-- 기타 서비스 -->
					<div class="fl font14"style="margin-bottom: 10px;">
						상세 유형 선택
					</div>
					<div class="fl width">
						<select name="detailsTypeSelect"class="box2-1 width font16">
							<option value="" disabled selected>상세 유형을 선택해 주세요</option>
							<option>내폰시세</option>
							<option>택배서비스</option>
							<option>판매 대행 서비스</option>
							<option>판매 대행 서비스</option>
							<option>정품 검수 서비스</option>
							<option>프로모션</option>
							<option>기타</option>
						</select>
					</div>
				</div>
				<div class="fl box2 width hidden"id="5">	<!-- 판매 광고 -->
					<div class="fl font14"style="margin-bottom: 10px;">
						상세 유형 선택
					</div>
					<div class="fl width">
						<select name="detailsTypeSelect"class="box2-1 width font16">
							<option value="" disabled selected>상세 유형을 선택해 주세요</option>
							<option>광고 이용방법</option>
							<option>광고 심사</option>
							<option>광고포인트</option>
							<option>UP하기</option>
							<option>기타</option>
						</select>
					</div>
				</div>
				<div class="fl box2 width hidden"id="6">	<!-- 오류 신고 제안 -->
					<div class="fl font14"style="margin-bottom: 10px;">
						상세 유형 선택
					</div>
					<div class="fl width">
						<select name="detailsTypeSelect"class="box2-1 width font16">
							<option value="" disabled selected>상세 유형을 선택해 주세요</option>
							<option>서비스제안</option>
							<option>장애신고</option>
							<option>기타신고</option>
						</select>
					</div>
				</div>
				<div class="fl box3 width">
					<div class="fl font14"style="margin-bottom: 10px;">
						문의 내용
					</div>
					<textarea name="inquiryContent" class="width box3-1 font16"placeholder="문의 내용을 자세히 입력해주세요."></textarea>
				</div>
				<div class="fl box4 width">
					<div class="fl box4-1 width">
						<div class="fl font14 picture width">
							사진 첨부(0/6)
						</div>
						<div class="fl picture1 font13">
							사진을 첨부하면 정확한 답변을 받을 수 있습니다.
						</div>
					</div>
					<div class="fl width">
						<div class="fl width"style="margin-top:12px">
							<div class="fl box5">
								<label for="imgbtn1">
									<img src=images/plus.svg>
									<input id="imgbtn1"type="file"name="photoAttachment1"style="display:none">
								</label>
							</div>
							<div class="fl box5">
								<label for="imgbtn2">
									<img src=images/plus.svg>
									<input id="imgbtn2"type="file"name="photoAttachment2"style="display:none">
								</label>
							</div>
							<div class="fl box5">
								<label for="imgbtn3">
									<img src=images/plus.svg>
									<input id="imgbtn3"type="file"name="photoAttachment3"style="display:none">
								</label>
							</div>
							<div class="fl box5">
								<label for="imgbtn4">
									<img src=images/plus.svg>
									<input id="imgbtn4"type="file"name="photoAttachment4"style="display:none">
								</label>
							</div>
						</div>
						<div class="fl width"style="margin-top:12px">
							<div class="fl box5">
								<label for="imgbtn5">
									<img src=images/plus.svg>
									<input id="imgbtn5"type="file"name="photoAttachment5"style="display:none">
								</label>
							</div>
							<div class="fl box5">
								<label for="imgbtn6">
									<img src=images/plus.svg>
									<input id="imgbtn6"type="file"name="photoAttachment6"style="display:none">
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="fl box6">
					<button class="fl width">문의하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>