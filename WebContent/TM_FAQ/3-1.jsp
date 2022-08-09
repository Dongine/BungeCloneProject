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
					<p><strong style="color:red">사기거래 발생 시 수사기관 접수</strong></p>
					&nbsp;
					<p>사기거래 발생 시 즉시 수사기관을 통해 신고 접수해 주시기 바라며, 아래의 접수 방법 참고를 부탁드립니다.<p>
					&nbsp;
				    <strong>[수사기관 접수 채널 및 신고 방법]</strong>
					<p> 1. 상대방과 거래한 내용에 대해 증거자료 수집 (대화내용, 입금내역)</p>
					&nbsp;
					<p> 2. 경찰청 사이버안전지킴이 신고<br/>
   						※ 다중 피해 사건의 피해자 중 1명이라도 신고한 사실이 있다면, 다른 피해자들은 온라인 신<br/>
   						고만으로 정식 수사 진행이 가능합니다.</p>
   					&nbsp;
					<p> 3. 경찰청 민원실 신고(내방 접수)<br/>
					    ① 경찰서 민원봉사실 방문<br/>
					    ② 고소장 작성<br/>
					    ③ 사건사실확인서 발급 요청<br/>
					    ④ 계좌를 통해 인출된 경우 은행 방문하여 계좌지급정지 신청(사건사실확인서 제출)</p>
					&nbsp;
					<p>4. 추가 필요자료 : 피해자 인적사항, 피해일시, 해당사이트, ID 또는 상점명, 거래내역<br/>
 						※ 개인정보보호법에 따라 상대방의 개인정보는 신고인에게 직접 제공은 불가하며, 수사기
 						관 공문(영장 or 통신자료)을 통해 전달이 가능한 점 양해 부탁드립니다.</p>
				</div>
			</div>
			<div class="fl width box2"></div>
			<div class="fl width box3">
				<div class="fl width font20">연관 질문</div>
				<ul class="fl width"style="padding:0px">
					<span class="span">
						<a href="Controller?command=GoFaq_3_2">
							<li class="fl w90">[분쟁해결절차] 상품금액 입금 후, 판매자가 상품을 발송하지 않아요.</li>
							<img class="fr pd" src=images/TM_RIGHT.svg>
						</a>
					</span>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>