<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계좌 추가</title>
	<link rel="stylesheet" href="css/AccountAdd.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
	%>
	<script>
		// 은행 선택 모달창 블록
		function bank_select_open() {
			$("#modalBg").css("display","block");
			$("#modalBankList").slideDown("fast");
		};
		// 은행 선택 모달창 숨기기
		function bank_select_close() {
			$("#modalBg").css("display","none");
			$("#modalBankList").slideUp("fast");
		}
		// 활성화할 조건 판단 후 활성화 또는 비활성화.
		function activateAccountButton() {
			if($("#account_name").val()=='' || 
					$(".bankDone").text()=='' || 
					$("#account_number").val()==''  ) { // (비활성화될 조건)
				$("#doneAccountButton").attr("disabled",true); // 버튼 비활성화
				$("#doneAccountButtonCt").css("background-color","rgb(251, 231, 232)");
			} else { // 값이 있으면
				$("#doneAccountButton").attr("disabled",false); // 버튼활성화
				$("#doneAccountButtonCt").css("background-color","rgb(216, 12, 24)");
				$("#doneAccountButton").css("cursor","pointer");
			} 
		}
		$(function() {
			// 은행 선택 모달창에서 은행선택시 은행명 보이기
			$(".bankListCt").click(function() {
				var bank_name = $(this).text().trim();
				$("#bankSelectCt label").css("display", "none");
				$("#bankSelectCt span").html(bank_name);
 				activateAccountButton();
			})

			// 계좌정보 입력시 완료버튼 활성화
			$("#account_name").on("input",function(){ 
 				activateAccountButton();
 			});
 			$("#account_number").on("input",function(){ 
 				activateAccountButton();
 			}); 
			
			// 은행 선택완료시 은행선택 모달창 숨기기
			$(".bankListCt").click(function(){
				$("#modalBg").css("display","none");
				$("#modalBankList").slideUp("fast");
			});
 			
 			// 은행명 보내기
 			$("#doneAccountButton").click(function() {
 				var bank_name_add = $("#bankSelectCt > span").text();
 				$("#input_bank_name").val(bank_name_add);
 				return true;
 			});
		});
	</script> 
</head>
<body>
	<form action="Controller?command=AccountAddAction" method="post">
		<input type="hidden" name="rno" value="<%=rno%>"/>
		<input type="hidden" name="dno" value="<%=dno%>"/>
		<div id="accountAddCt1">
			<div id="accountAddCt2">
				<!-- 은행 선택 모달창 -->
				<div id="modalBg" onclick="bank_select_close()"></div>
				<div id="modalBankList">
					<div id="modalBankList2">
						<div id="modalBankList3">
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_KB.png"/>
								국민은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_woori.png"/>
								우리은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_shinhan.png"/>
								신한은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_hana.png"/>
								KEB하나은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_kakao.png"/>
								카카오뱅크
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_nh.png"/>
								농협은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_ibk.png"/>
								기업은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_toss.png"/>
								토스뱅크
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_post.png"/>
								우체국
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_sc.png"/>
								SC제일은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_suhyup.png"/>
								수협중앙회
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_K.png"/>
								케이뱅크
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_nh (1).png"/>
								지역농축협
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_city.png"/>
								한국씨티은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_shinhan.png"/>
								신협중앙회
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_sanUp.png"/>
								산업은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_sanlimjohap.pngs"/>
								산림조합중앙회
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_sangho.png"/>
								상호저축은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_semaul.png"/>
								새마을금고중앙회
							</div>
							<div class="bankListCt">	
								<img class="iconSize" src="BankImages/img_account_degu.png"/>
								대구은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_busan.png"/>
								부산은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_kwangju.png"/>
								광주은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_jounbukpng.png"/>
								전북은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_gyungnam.png"/>
								경남은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_jeju.png"/>
								제주은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_hsbc.png"/>
								HSBC은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_jpmogan.png"/>
								제이피모간체이스은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_doichi.png"/>
								도이치은행
							</div>
							<div class="bankListCt">	
								<img class="iconSize" src="BankImages/img_account_bnpipa.png"/>
								비엔피파리바은행
							</div>
							<div class="bankListCt">
								<img class="iconSize" src="BankImages/img_account_boa.png"/>
								BOA은행
							</div>
						</div>
					</div>
				</div>
				<div id="accountAddCt3">
					<svg onclick="history.back()" class="fl" style="padding-left:20px; padding-top: 9.5px; cursor:pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M14.265 19.537a.9.9 0 1 0 1.27-1.274l-8.362-8.34 8.365-8.387A.9.9 0 0 0 14.263.264l-9 9.024a.902.902 0 0 0 .002 1.273l9 8.976z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
				</div>
				<div id="accountAddCt4">
					<div id="accountAddCt5">
						<h1 id="accountAddCt5Font" class="fl"><b>계좌 추가</b></h1>
					</div>
					<div style="clear:both;"></div>
					<div id="accountAddCt6">
						<div class="writeCt">
							<input type="text" class="fl bold inputAccountText contentFont" name="accountHolder" id="account_name" placeholder="예금주">
						</div>
						<div style="clear:both;"></div>
	 					<div id="bankSelectCt" onclick="bank_select_open()">
							<label class="fl bold" id="labelBankSelect" style="color: rgb(189, 189, 189); font-size: 15px; margin-top: 22px;">은행 선택</label>
							<span class="fl bankDone"></span>
						</div>  
						<div style="clear:both;"></div>
						<div class="writeCt">
							<input type="text" placeholder="계좌번호" name="accountNumber" class="fl bold inputAccountText contentFont" id="account_number">
						</div> 
						<div style="clear:both;"></div>
					</div>
					<div id="done">
						<div id="doneAccountButtonCt">
							<input type="hidden" id="input_bank_name" name="bankName"/>
							<button disabled="true" id="doneAccountButton"><b>완료</b></button> <!-- onclick="gotoBankName() -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>