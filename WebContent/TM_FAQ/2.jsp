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
				font-size:13px;
				font-family: Arial, Helvetica, sans-serif;
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
				<div class="fl font14 width">운영정책</div>
			</div>
			<div class="fl width">
				<div class="fl font22 width">거래를 하면 안 되는 것들은 어떤 것이 있나요?</div>
			</div>
			<div class="fl width"style="padding:0 0 60px">
				<hr/>
				<div class="fl width box1 font15">
					<p><span style="color:red">거래금지품목은 이용약관 및 현행 법률에 따라 즉시 삭제 및 계정 차단</span>이 될 수 있으므로 운영정책을 참고하셔서 이용 부탁 드립니다.&nbsp;</p>
					<strong>&nbsp;</strong>
					<p><strong>개인정보 :</strong> 개인정보를 사고파는 행위와 면허증, 허가증, 등록증 등을 위, 변조하는 행위는 형법에 따라 처벌받을 수 있습니다.</p>
					<p style="color:blue">예시) 주민등록증, 여권, 학생증, 수험표, 운전면허증, 대포통장, 듀얼폰, 듀얼넘버 등 </p>
					<strong>&nbsp;</strong>
					<p><strong>온라인 개인 계정 :</strong> 개인 계정 및 인증번호를 통해 각종 피해가 발생되고 있어 번개장터 운영정책에 따라 제재 됩니다.</p>
					<p style="color:blue">예시) 카톡계정, 인스타 계정, 페이스북 계정, 네이버 계정, 카카오톡, 네이버, 페이스북 인증번호 등</p>
					<strong>&nbsp;</strong>
					<p><strong>불법현금융통 :</strong> 정보통신망 이용촉진 및 정보보호등의 관한 법률 제 72조 통신과금을 이용해 매입하는 행위는 불법현금융통으로 제재 됩니다. </p>
					<p style="color:blue">예시) 불법 현금융통을 목적으로 한 모든 상품 (불법대출, 돈구해요, 개인돈빌려요, 리니지M등)</p>
					<strong>&nbsp;</strong>
					<p><strong>사행성 :</strong> 불법 도박 및 사행성 상품은 번개장터 운영정책에 따라 제재 됩니다.</p>
					<p style="color:blue">예시)토토, 카지노, 바카라, 화투, 포커, 한게임, 섯다, 바둑이, 홀덤, 세븐등 머니쿠폰, 전용장비, 라이브스코어인증 등</p>
					<strong>&nbsp;</strong>
					<p><strong>성인용품 :</strong> 방송통신심의위원회의 정보통신에 관한 심의 규정에 따라 음란물로 구분되는 상품은 인터넷으로 유통이 불가하며, 성인 전용 상품 판매 시 운영정책에 따라 제재 됩니다.</p>
					<p style="color:blue">예시) 각종 성인용품, 특수콘돔 등 </p>
					<strong>&nbsp;</strong>
					<p><strong>청소년유해상품 :</strong> 청소년유해 매체물/약품/물건은 청소년 보호법에 따라 제재 됩니다.</p>
					<p style="color:blue">예시) 청소년불가 등급 및 선정적 매체 (잡지, DVD, 음반, 서적등), 레이져포인터, 캠핑용 나이프, 눈알젤리, 가스건, 공업용/산업용 강력접착제(본드) 등</p>
					<strong>&nbsp;</strong>
					<p><strong>반려동물/야생동물 :</strong> 반려동물 및 야생동물은 번개장터 운영정책에 따라 제재 됩니다.</p>
					<p style="color:blue">예시) 반려동물 판매/구매, 반려동물 무료나눔, 유/무료 분양, 박제품, 야생동물 수렵품(이빨, 뼈 등)</p>
					<strong>&nbsp;</strong>
					<p><strong>비인도적 거래(장난글 포함) :</strong> 타인의 명예를 훼손하는 사람거래 관련 게시글은 아동복지법 및 정신통신망법(명예훼손)에 따라 제재 됩니다.</p>
					<p style="color:blue">예시) 친구팔아요, 가족(아들, 딸 등) 팔아요 등 </p>
					<strong>&nbsp;</strong>
					<p><strong>주류 :</strong> 주세법에 따라 주류소매업 및 의제주류판매업 면허를 받은 자는 허가된 장소에서만 주류를 판매하여야 하고, 통신판매는 할 수 없도록 규정되어 있습니다.</p>
					<p style="color:blue">예시) 양주, 맥주, 소주, 와인, 사케, 막걸리, 위스키, 보드카, 무알콜 맥주, 무알콜 칵테일 등</p>
				</div>
			</div>
			<div class="fl width box2"></div>
			<div class="fl width box3">
				<div class="fl width font20">연관 질문</div>
				<ul class="fl width"style="padding:0px">
					<span class="span">
						<li class="fl w90">회원탈퇴 후 재가입이 가능한가요?</li>
						<img class="fr pd" src=images/TM_RIGHT.svg>
					</span>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>