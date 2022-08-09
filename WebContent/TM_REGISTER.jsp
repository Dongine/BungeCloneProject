<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/getUrlParams.js"/></script>
	<link rel="stylesheet" href="css/TM_REGISTER.css"/>		
	<script>
		$(function(){
			$('#check-all').on('click',function(){
				if ($('#check-all').is(':checked')){
					$('.check').prop('checked',true);	//true 체크됨
					$('#hiddenCheck').val('1');
					$('#hiddenCheck2').val('1');
					$('#hiddenCheck3').val('1');
				} else {
					$('.check').prop('checked',false);	//false 체크안됨			
					$('#hiddenCheck').val('0');
					$('#hiddenCheck2').val('0');
					$('#hiddenCheck3').val('0');
				}
			})
			$('#check').change(function(){
				if($('#check').is(':checked')){
					$('#hiddenCheck').val('1');
				} else {
					$('#hiddenCheck').val('0');					
				}
			})
			$('#check2').change(function(){
				if($('#check2').is(':checked')){
					$('#hiddenCheck2').val('1');
				} else {
					$('#hiddenCheck2').val('0');					
				}
			})
			$('#check3').change(function(){
				if($('#check3').is(':checked')){
					$('#hiddenCheck3').val('1');
				} else {
					$('#hiddenCheck3').val('0');					
				}
			})
			 
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
					<form action="Controller?command=RegisterAction" method="post" > <!-- Controller?command=RegisterAction --> <!-- method = "post" -->
						<h1 class="font30">본인 정보를 입력해 주세요</h1>
						<div style="width:100%;height:60px;margin-bottom:20px">
							<input type="text" placeholder="닉네임" class="input"name="NICKNAME_PK"required>
						</div>
						<div style="width:100%;height:60px;margin-bottom:20px">
							<input type="text" placeholder="이름" class="input"name="NAME"required>
						</div>
						<div class="fl" style="width:212.5px;height:60;margin-bottom:20px">
							<input type="number"placeholder="생년월일"class="input"name="BIRTH_DATE1"maxlength="6"oninput="numberMaxLength(this);"required>
						</div>
						<div class="fl font18">
							<p>-</p>
						</div>
						<div class="fl" style="width:212.5px;height:60px;margin-bottom:20px">
							<input type="number"placeholder="●●●●●●●"class="input"name="BIRTH_DATE2"maxlength="1"oninput="numberMaxLength(this);"required>
						</div>
						<div class="fl" style="width:100%;height:60px;margin-bottom:20px">
							<input type="text" placeholder="이메일" class="input"name="EMAIL"required>
						</div>
						<div class="fl" style="width:100%;height:60px;margin-bottom:20px">
							<input type="text" placeholder="핸드폰 번호" class="input"name="PHONE_NUMBER"required>
						</div>
						<div class="white JS_border fl">
							<input class="fl" type="checkbox"style="margin-right:16px"id="check-all">
							<div class="fl font14">전체동의</div>
						</div>
						<div class="fl"style="width:100%;padding:7px">
							<div class="fl"style="margin:20px 0 20px 0;width:100%">
								<label class="fl font14"style="margin-right:13px">
									<input type="checkbox"class="check"name="AGREE1"value='1'required>
									<!-- <input type="hidden"class="check"name="check"value='0'id="check_hidden"> -->
								</label>
								<span class="color">번개장터 이용약관(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="AGREE2"value='1'required>
								</label>
								<span class="color">개인정보 수집 이용 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="AGREE3"value='1'required>
								</label>
								<span class="color">휴대폰 본인확인서비스(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="AGREE4"value='1'required>
								</label>
								<span class="color">휴면 개인정보 분리보관 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="AGREE5"value='1'required>
								</label>
								<span class="color">위치정보 이용약관 동의(필수)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="hiddenAGREE6"id="check">
									<input type="hidden"id="hiddenCheck"name="AGREE6">
								</label>
								<span class="color">개인정보 수집 이용 동의(선택)</span>
							</div>
							<div class="fl width m">
								<label class="fl font4"style="margin-right:13px">
									<input type="checkbox"class="check"name="hiddenAGREE7"id="check2">
									<input type="hidden"id="hiddenCheck2"name="AGREE7">
								</label>
								<span class="color">마케팅 수신 동의(선택)</span>
							</div>
							<div class="fl width"style="margin-bottom:40px">
								<label class="fl font4" style="margin-right:13px">
									<input type="checkbox"class="check"name="hiddenAGREE8"id="check3">
									<input type="hidden"id="hiddenCheck3"name="AGREE8">
								</label>
								<span class="color">개인정보 광고활용 동의(선택)</span>
							</div>
						</div>
						<div class="fl main width"style="height:72px">
							<input type="submit" value="다음" class="color2 font18" style="width:100%;height:72px">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>