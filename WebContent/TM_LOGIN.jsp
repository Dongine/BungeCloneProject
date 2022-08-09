<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/getUrlParams.js"/></script>
	<link rel="stylesheet" href="css/TM_LOGIN.css"/>
	
	<script>
		$(function(){	//전체 체크박스
			$('#check-all').on('click',function(){
				if ($('#check-all').is(':checked')){
					$('.check').prop('checked',true);
					$('#JS_border').css('border','1.4px solid rgb(216, 12, 24)');
				} else {
					$('.check').prop('checked',false);	
					$('#JS_border').css('border','1.4px solid rgb(229, 229, 229)');
				}
			});
		
			/* $("#btn_test").click(function() {
				var nickname = "WEFW";
				var name = "DI";
				var birthdate = "001231";
				var birthdate2 = "1"
				var email = "D";
				var phone = "E";
				
				$("#input_nickname").val(nickname);
				$("#input_name").val(name);
				$("#input_birthdate").val(birthdate);
				$("#input_birthdate2").val(birthdate2);
				$("#input_email").val(email);
				$("#input_phone").val(phone);
				$('.check').prop('checked',true);
			});
			$("#btn_test2").click(function() {
				var nickname = "HSK137";
				var name = "홍성권";
				var birthdate = "001231";
				var birthdate2 = "1"
				var email = "D";
				var phone = "E";
				
				$("#input_nickname").val(nickname);
				$("#input_name").val(name);
				$("#input_birthdate").val(birthdate);
				$("#input_birthdate2").val(birthdate2);
				$("#input_email").val(email);
				$("#input_phone").val(phone);
				$('.check').prop('checked',true);
			}); */
		});
		 function numberMaxLength(e){	//number 글자 수 제한
		        if(e.value.length > e.maxLength){
		            e.value = e.value.slice(0, e.maxLength);
		        }
		   	}
	</script>
</head>
<body>

	<div class="main background">
		<div class="pd">
			<div class="box main white">
				<div class=""style="padding:60px;text-align:left">
					<form action="Controller?command=LoginAction" method = "post">  <!-- 나중에 post방식으로 변경 권장. --><!-- TM_LOGIN_ACTION.jsp -->
						<h1 class="font30">본인 정보를 입력해 주세요</h1> <!-- <button type="button" id="btn_test">WEFW</button><button type="button" id="btn_test2">HSK137</button> -->
						<div class="cb">
							<input type="text" id="input_nickname" placeholder="닉네임" class="input"name="NICKNAME_PK"required>
						</div>
						<div class="cb">
							<input type="text" id="input_name" placeholder="이름" class="input"name="NAME"required>
						</div>
						<div class="fl" style="width:212.5px;height:60;margin-bottom:20px">
							<input type="number" id="input_birthdate" placeholder="생년월일"class="input"maxlength="6"oninput="numberMaxLength(this);"required/>
						</div>
						<div class="fl font18">
							<p>-</p>
						</div>
						<div class="fl" style="width:212.5px;height:60px;margin-bottom:20px">
							<input type="number" id="input_birthdate2"placeholder="●●●●●●●"class="input"maxlength="1"oninput="numberMaxLength(this);"required/>
						</div>
						<div class="fl cb">
							<input type="text" id="input_email" placeholder="이메일"class="input"required>
						</div>
						<div class="fl cb">
							<input type="text" id="input_phone" placeholder="핸드폰 번호"class="input"required>
						</div>
						<div class="white JS_border fl"id="JS_border">
							<input class="fl" type="checkbox"style="margin-right:16px"id="check-all">
							<div class="fl font14">전체동의</div>
						</div>
						<div class="fl"style="width:100%;padding:7px">
							<div class="fl"style="margin:20px 0 20px 0;width:100%">
								<label class="fl font14"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">번개장터 이용약관(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">개인정보 수집 이용 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">휴대폰 본인확인서비스(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">휴면 개인정보 분리보관 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">위치정보 이용약관 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">개인정보 수집 이용 동의(선택)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">마케팅 수신 동의(선택)</span>
							</div>
							<div class="fl width"style="margin-bottom:40px">
								<label class="fl font4" style="margin-right:13px">
									<input type="checkbox"class="check">
								</label>
								<span class="color">개인정보 광고활용 동의(선택)</span>
							</div>
						</div>
						<div class="fl main width"style="height:72px">
							<input type="submit" value="다음" class="color2 font18" style="width:100%;height:72px;border-radius:6px">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>