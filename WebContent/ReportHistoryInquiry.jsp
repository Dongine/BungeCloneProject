<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 | 판매자 정보 조회</title>
	<link rel="stylesheet" href="css/ReportHistoryInquiry.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script>
		// 더치트 준비중 알림창
		$(function(){
			$(".theChit").click(function(){
				alert("준비중입니다");
			});
		
			// 계좌번호입력시 조회버튼 활성화
			$(".accountN").on('input',function(){
				if($(".accountN").val()=='') { // 값이 없으면
					$(".accountB").attr("disabled",true); // 버튼 비활성화
					$(".accountB").css('background-color','rgb(253, 212, 212)');
				} else { // 값이 있으면
					$(".accountB").attr("disabled",false); // 버튼활성화
					$(".accountB").css('background-color','red');
					$(".accountB").css('cursor','pointer');
				} 
			});
		
			// 휴대폰번호입력시 조회버튼 활성화
			$(".phoneN").on('input',function(){
				if($(".phoneN").val()=='') { // 값이 없으면
					$(".phoneB").attr("disabled",true); // 버튼 비활성화
					$(".phoneB").css('background-color','rgb(253, 212, 212)');
				} else { // 값이 있으면
					$(".phoneB").attr("disabled",false); // 버튼 활성화
					$(".phoneB").css('background-color','red');
					$(".phoneB").css('cursor','pointer');
				} 
			});
		
			// 카카오톡ID입력시 조회버튼 활성화
			$(".kakaoN").on('input',function(){
				if($(".kakaoN").val()=='') { // 값이 없으면
					$(".kakaoB").attr("disabled",true); // 버튼 비활성화
					$(".kakaoB").css('background-color','rgb(253, 212, 212)');
				} else { // 값이 있으면
					$(".kakaoB").attr("disabled",false); // 버튼활성화
					$(".kakaoB").css('background-color','red');
					$(".kakaoB").css('cursor','pointer');
				}
			});
			
			// 계좌번호로 신고 조회하기
			$(".accountB").click(function() {
				var account = $(".accountN").val();
				$.ajax({
					type: 'post',
					url: 'AccountServlet',
					data: { "account":account },
					datatype: "json",
					success: function(data) {
						button_account_open();
						if(data.result>=1) {
							$("#history1").text("기록있음");
						} else if(data.result==0) {
							$("#history1").text("기록없음");
						}
					},
					error: function(r, s, e) {
						alert("에러!");
					}
				});
			});
			
			// 핸드폰번호로 신고 조회하기
			$(".phoneB").click(function() {
				var phone_number = $(".phoneN").val();
				$.ajax({
					type: 'post',
					url: 'PhoneNumberServlet',
					data: { "phoneNumber":phone_number },
					datatype: "json",
					success: function(data) {
						button_phone_open();
						if(data.result>=1) {
							$("#history2").text("기록있음");
						} else if(data.result==0) {
							$("#history2").text("기록없음");
						}
					},
					error: function(r, s, e) {
						alert("에러!");
					}
				});
			});
			
			// 카카오ID로 신고 조회하기
			$(".kakaoB").click(function() {
				var kakao_id = $(".kakaoN").val();
				$.ajax({
					type: 'post',
					url: 'KakaoIDServlet',
					data: { "kakaoId":kakao_id }, 
					datatype: "json",
					success: function(data) {
						button_kakao_open();
						if(data.result>=1) {
							$("#history3").text("기록있음");
						} else if(data.result==0) {
							$("#history3").text("기록없음");
						}
					},
					error: function(r, s, e) {
						alert("에러!");
					}
				});
			});
		});
		
  		// 계좌번호 값이 있을경우 버튼 선택시 모달창 활성화
  		function button_account_open() {
			$(".contentCt2Result1").css('display','block');
		}   
  		// 휴대전화 값이 있을경우 버튼 선택시 모달창 활성화
 		function button_phone_open() {
			$(".contentCt2Result2").css('display','block');
		}
  		// 카카오톡ID 값이 있을경우 버튼 선택시 모달창 활성화
 		function button_kakao_open() {
			$(".contentCt2Result3").css('display','block');
		}  
	</script>
</head>
<body>
	<div id="reportCt1">
		<h2 id="reportTitleFont"><b>신고이력 조회</b></h2>
		<p id="reportInfoFont">신고로 차단된 사용자 외에는 <strong>기록없음</strong>으로 표시됩니다. 기록이 없는 경우에도 신중한 거래가 필요합니다.</p>
		<div class="contentCt1" id="borderB1">
			<div class="contentCt2">
				<div class="contentLeftCt2">
					<label class="ct2FirstFont">계좌번호</label>
					<input class="fl input accountN" name="accountNumberInput" style="width: 100%;" placeholder="계좌번호 입력">
				</div>
				<div class="contentRightCt2">
					<button disabled="true" class="buttonFont accountB">조회</button>
				</div>
			</div>
			
			<div class="contentCt2Result1">
				<div class="contentCt2Result1_1">
					<span class="contentCt2ResultLFont">번개장터</span>
					<span class="contentCt2ResultRFont" id="history1"><%-- <%=dto.result()%> --%></span><!-- 기록없음 -->
				</div>
				<div class="contentCt2Result1_1" style="margin: 16px 0 0;">
					<span class="contentCt2ResultLFont">더치트</span>
					<form class="contentCt2ResultRFont2 theChit">확인하기</form>
				</div>
				<div class="contentCt2Result1_1" style="margin: 16px 0 0;">
					<span class="contentCt2ResultLFont">경찰청</span>
					<a href="https://cyberbureau.police.go.kr/prevention/sub7.jsp?mid=020600" class="contentCt2ResultRFont2" target="_blank">확인하기</a>
				</div>
			</div>
			<div style="height: 1rem;"></div>
		</div>
		<div class="contentCt1" id="borderB2">
			<div class="contentCt2">
				<div class="contentLeftCt2">
					<label class="ct2FirstFont">휴대전화</label>
					<input class="fl input phoneN" style="width: 100%;" placeholder="휴대폰번호 입력">
				</div>
				<div class="contentRightCt2">
					<button disabled="true" class="buttonFont phoneB">조회</button>
				</div>
			</div>
			<div class="contentCt2Result2">
				<div class="contentCt2Result1_1">
					<span class="contentCt2ResultLFont">번개장터</span>
					<span class="contentCt2ResultRFont" id="history2"></span>
				</div>
				<div class="contentCt2Result1_1" style="margin: 16px 0 0;">
					<span class="contentCt2ResultLFont">더치트</span>
					<form class="contentCt2ResultRFont2 theChit">확인하기</form>
				</div>
				<div class="contentCt2Result1_1" style="margin: 16px 0 0;">
					<span class="contentCt2ResultLFont">경찰청</span>
					<a href="https://cyberbureau.police.go.kr/prevention/sub7.jsp?mid=020600" class="contentCt2ResultRFont2" target="_blank">확인하기</a>
				</div>
			</div>
			<div style="height: 1rem;"></div>
		</div>
		<div class="contentCt1">
			<div class="contentCt2">
				<div class="contentLeftCt2">
					<label class="ct2FirstFont">카카오톡</label>
					<input class="fl input kakaoN" style="width: 100%;" type="text" placeholder="카카오톡ID 입력">
				</div>
				<div class="contentRightCt2">	
					<button disabled="true" class="buttonFont kakaoB">조회</button>
				</div>
			</div>
			<div class="contentCt2Result3">
				<div class="contentCt2Result1_1">
					<span class="contentCt2ResultLFont">번개장터</span>
					<span class="contentCt2ResultRFont" id="history3"></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>