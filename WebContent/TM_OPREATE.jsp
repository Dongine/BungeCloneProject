<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<link rel="stylesheet" href="css/TM_OPERATE.css"/>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$('#move').click(function(){
				history.back();
			})
		});
	</script>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<img id="move"src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			<div class="fl hidden"style="margin-left:10px;">
				<h1 class="font18">운영정책</h1>
			</div>
		</div>
		<div class="main box tl">
			<div class="fl box1">
				<div class="fl box2 font28 width">
					운영정책
				</div>
				<div style="margin: 20px 20px 80px;">
					<div class="fl width"style="padding-top:20px">
						<div class="fl">
							<h1 class="fl font28 width">
								번개장터 이용시<br/>
								이것만은 지켜주세요.
							</h1>
							<p class="fl font16 width"style="margin:8px 0 0 0">지키지 않을시 3아웃 정책에 의해 제재받을 수 있어요.</p>
						</div>
						<div class="fl box3 width">
							<img src=images/TM_WARNING.png width="150px"height="150px">
						</div>
						<ul class="fl width">
							<li>금지품목 거래시 제재 받을 수 있습니다.</li>
							<hr/>
							<li>적절하지 않은 상품명, 이미지, 가격 등록 시 제재를 받을 수 있어요</li>
							<hr/>
							<li>외부 채널로의 연락 유도, 타사이트로의 결제 유도시 제재 받을 수 있어요.</li>
							<hr/>
							<li>욕설 등 비매너 행위는 타인을 불쾌하게 해요.</li>
							<hr/>
							<li>상품, 댓글, 번개톡에 도배는 안돼요.</li>
							<hr/>
						</ul>
						<div class="fl width"style="padding:20px 10px 0">
							<h1 clsas="fl width font28">3아웃 정책이란?</h1>
							<p class="fl font16 width"style="margin:8px 0 0 0">번개장터의 커뮤니티 가이드라인을 지키지 않을시 받게 되는 경고예요.</p>
							<div class="fl width"style="margin:20px 0">
								<div class="fl width">
									<div class="fl font14 w33"style="color: rgb(25, 25, 25);">3아웃 정책</div>
									<div class="fl font14 w66"style="color: rgb(25, 25, 25);">제재 내용</div>
								</div>
								<div class="fl width">
									<div class="fl font14 w33"style="color: rgb(25, 25, 25);">1차 아웃</div>
									<div class="fl font14 w66"style="color: rgb(25, 25, 25);">상품이 삭제되고,<br/>3일동안 이용정지돼요</div>
								</div>
								<div class="fl width">
									<div class="fl font14 w33"style="color: rgb(25, 25, 25);">2차 아웃</div>
									<div class="fl font14 w66"style="color: rgb(25, 25, 25);">상품이 삭제되고,<br/>15일동안 이용정지돼요</div>
								</div>
								<div class="fl width">
									<div class="fl font14 w33"style="color: rgb(25, 25, 25);">3차 아웃</div>
									<div class="fl font14 w66"style="color: rgb(25, 25, 25);">상품이 삭제되고,<br/>30일동안 이용정지돼요</div>
								</div>
							</div>
							<div class="fl width lastfont">
								・ 항목에 따라 사전 안내 없이 상점 이용이 영구 제한될 수 있어요.
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</body>
</html>