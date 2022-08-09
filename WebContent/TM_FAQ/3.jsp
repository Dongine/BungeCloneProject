<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="shortcut icon" href="images/favicon.ico">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
			.main{
				margin:0 auto;
				text-align:center;
				box-sizing:border-box;
				vertical-align: baseline;
			}
			.hidden{
				display:none;
			}
			.fl{
				float:left;
			}
			.fr{
				float:right;
			}
			.tc{
				text-align:center;
			}
			.tl{
				text-align:left;
			}
			.width{
				width:100%;
			}
			.w90{
				width:90%;
			}
			.w10{
				width:10%;
			}			
			.height{
				height:100%;
			}
			.flex{
				display:flex;
				align-items:center;
			}
			.box{
				width:100%;
				max-width:640px;
			}
			.box1{
				margin: 0px 20px 140px;
			}
			.box2{
				width: 100%;
			    height: 12px;
			    background-color: rgb(246, 246, 246);
			}
			.box3{
				margin: 40px 20px 60px;
			}
			.font14{
				font-size:14px;
				margin:12px 20px;
				font-weight: 500;
			}
			.font15{
				font-size:17px;
			}
			.font20{
				font-size: 20px;
			    font-weight: bold;
			    line-height: 1;
			    color: rgb(25, 25, 25);
			}
			.font22{
				margin: 0px 20px;
			    font-size: 22px;
			    font-weight: bold;
			    line-height: 1.36;
			    color: rgb(25, 25, 25);
			}
			.pd{
				padding:18px 0px 16px;
			}
			hr{
				border-width: 1px 0px 0px;
			    border-style: solid none none;
			    border-color: rgb(244, 244, 250);
			    border-image: initial;
			    height: 1px;
			    margin: 30px 20px;
			}
			p{
				width:100%;
				margin:0px;
			}
			ul{
				margin: 30px 0px;
				list-style: none;
			}
			li{
				padding:18px 0px 16px;
			}
			li::before{
				content: "Q";
			    margin: 0px 10px 0px 0px;
			    font-size: 18px;
			    font-weight: 500;
			    color: rgb(0, 165, 135);
			}
			.span{
				width: 100%;
			    height: 100%;
			    padding: 18px 0px 16px;
			    font-size: 16px;
			    font-weight: 500;
			    line-height: 1.5;
			    color: rgb(25, 25, 25);
			    text-decoration: none;
			    cursor:pointer;
			}
	</style>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<a href="Controller?command=GoFaq">
				<img src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			</a>
		</div>
		<div class="main box tl">
			<div class="fl width">
				<div class="fl font14 width">거래사기</div>
			</div>
			<div class="fl width">
				<div class="fl font22 width">[분쟁해결절차] 사기꾼의 주요 사기패턴 유형이 궁금해요.</div>
			</div>
			<div class="fl width"style="padding:0 0 60px">
				<hr/>
				<div class="fl width box1 font15">
					<p><strong style="color:red">주요사기 패턴을 알려드려요!</strong></p>
					<strong>#최근 빈번하게 발생하는 사기유형</strong>
					<p>★아래의 계좌유형(가상계좌)의 경우 사기 가능성이 높아 입금유도 시 주의가 필요합니다!</p>
					<p style="color:#993300"> 카카오뱅크 3355 로 시작하는 계좌</p>
					<p style="color:#993300"> 신한은행 562 또는 270으로 시작하는 계좌</p>
					<p style="color:#993300"> 케이뱅크 7001로 시작하는 계좌</p>
					<strong>&nbsp;</strong>
					<p>★무료나눔 링크로 유도하여 벌어지는 개인정보 도용 주의 </p>
					<p style="color:#993300">나이키 무료나눔, 아이폰 무료나눔 등의 게시글에 포함된 네이버 블로그, 카카오 오픈채팅 링크를 주의하세요.<br/>
					링크 유도 후, 개인정보 유출 신고가 다수 접수되고 있습니다.</p>
					<strong>&nbsp;</strong>
					<p>★외부채널 (문자, 카카오톡 등) 에서 대화유도 시 응대하지 말아주세요!</p>
					<p style="color:#993300">번개장터의 감지 시스템을 피하기 위해 먼저 번호를 요구하거나 번호를 주고 대화를 이어가길 원하는 판매자의 경우,<br/>
					거래에 주의하여 주시고 전달받은 번호/계좌번호의 피해사실이 없는지 확인 해 주세요..</p>
					<strong>&nbsp;</strong>
					<p>★최근 이미 사용한 기프티콘 또는 모바일 상품권을 전송하거나, 미전송하는 거래 사기가 증가하고 있어요!</p>
					<p style="color:#993300">기프티콘/모바일상품권 과 같이 실물이 없는 상품을 안전하게 거래하는 TIP!</p>
					<p>① 번개페이-택배거래 로 결제 진행<br/> 
					   ② 판매상점의 거래 승인 후, 판매상점은 송장 입력을 '직접전달' 로 진행<br/> 
					   (이미 승인된 주문은 구매자가 바로 취소 할 수 없고, 판매자의 승인이 필요하니 안심하세요!)<br/> 
					   ③ 기프티콘 또는 모바일 상품권 수령/확인 후, 구매확정!</p>
					<strong>&nbsp;</strong>
					<p><strong>거래 전, 아래와 같이 행동하는 상점이 있다면 즉시 신고해 주세요!</strong><br/>
					패턴1. "번개장터 앱 잘 안봐요, 카톡이나 문자 주세요"<br/>
					패턴2. "급처하는 거라 번개페이 안 해요"<br/>
					패턴3. 기괴한 문자 조합, 이미지로 카톡유도<br/>
					패턴4. "번개페이 거래할게요. 대신 구매확정 먼저 해주세요"<br/>
					패턴5. 계좌 번호를 분리해서 보내거나 일부로 누락하는 사례<br/>
					패턴6. "안전거래 가능합니다." 후 피싱 링크 전달<br/>
					패턴7. "친구가 이계정으로 사기 쳐서 차단됐어요"<br/>
					패턴8. 추가 입금을 요구하는 사례<br/>
					패턴9. 시세보다 현저하게 낮은 가격의 상품<br/>
					패턴10. '인증번호삽니다'글을 통해 인증번호를 요청하는 경우(계정 도용의 위험↑)<br/>
					※거래 전, 상품의 실물인증을 필수로 확인하여 더욱 안전한 거래를 부탁드립니다.</p>
					
				</div>
			</div>
			<div class="fl width box2"></div>
			<div class="fl width box3">
				<div class="fl width font20">연관 질문</div>
				<ul class="fl width"style="padding:0px">
					<span class="span">
						<a href="Controller?command=GoFaq_3_1">
							<li class="fl w90">[분쟁해결절차] 사기를 당하면 어떻게 처리해야 되나요?</li>
							<img class="fr pd" src=images/TM_RIGHT.svg>
						</a>
					</span>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>