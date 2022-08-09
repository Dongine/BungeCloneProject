<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "css/tradelist.css"/>
<meta charset="UTF-8">
<title>거래내역</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	/* function b1(){
		if ($("#purchasebutton").css(".mainbody")=="block"){
			$("#salebutton").css(".mainbody1","none");
			$("#tradelistbutton").css(".mainbody2","none");
		} else if ($("#purchasebutton").css(".mainbody")=="none"){
			$("#purchasebutton").css(".mainbody","block");
			$("#salebutton").css(".mainbody1","none");
			$("#tradelistbutton").css(".mainbody2","none");
		}
	}
	function b2(){
		if ($("#salebutton").css(".mainbody1")=="block"){
			$("#purchasebutton").css(".mainbody","none");
			$("#tradelistbutton").css(".mainbody2","none");
		} else if ($("#salebutton").css(".mainbody1")=="none"){
			$("#salebutton").css(".mainbody1","block");
			$("#purchasebutton").css(".mainbody","none");
			$("#tradelistbutton").css(".mainbody2","none");
		}
	}
	function b3(){
		if ($("#tradelistbutton").css(".mainbody2")=="block"){
			$("#purchasebutton").css(".mainbody","none");
			$("#salebutton").css(".mainbody1","none");
		} else if ($("#tradelistbutton").css(".mainbody2")=="none"){
			$("#tradelistbutton").css(".mainbody2","block");
			$("#purchasebutton").css(".mainbody","none");
			$("#salebutton").css(".mainbody1","none");
		}
	} */
	function b1(){
		if ($(".mainbody").css("display")=="block"){
			$(".mainbody1").css("display","none");
			$(".mainbody2").css("display","none");
		} else if ($(".mainbody").css("display")=="none"){
			$(".mainbody").css("display","block");
			$(".mainbody1").css("display","none");
			$(".mainbody2").css("display","none");
		}
	}
	function b2(){
		if ($(".mainbody1").css("display")=="block"){
			$(".mainbody").css("display","none");
			$(".mainbody2").css("display","none");
		} else if ($(".mainbody1").css("display")=="none"){
			$(".mainbody1").css("display","block");
			$(".mainbody").css("display","none");
			$(".mainbody2").css("display","none");
		}
	}
	function b3(){
		if ($(".mainbody2").css("display")=="block"){
			$(".mainbody").css("display","none");
			$(".mainbody1").css("display","none");
		} else if ($(".mainbody2").css("display")=="none"){
			$(".mainbody2").css("display","block");
			$(".mainbody").css("display","none");
			$(".mainbody1").css("display","none");
		}
	}
</script>
</head>
<body>
	<div id="root">
		<div class="pageoverflow">
			<div class="tradelistcast">
				<header class="tradelistheader">
					<h1>거래내역</h1>
				</header>
				<div class="main">
					<nav class="mainnavi">
						<ul class="mainstates">
							<li class="purchase">
								<button type="button" onclick="b1()" id="purchasebutton" data-index="0">구매</button>
							</li>
							<li class="sale">
								<button type="button" onclick="b2()" id="salebutton" data-index="1">판매</button>
							</li>
							<li class="tradelist">
								<button type="button" onclick="b3()" id="tradelistbutton" data-index="2">정산</button>
							</li>
							<!-- <li class="line" role="presentation"></li> -->
						</ul>
						<div class="mainbody">
							<nav class="mainbodystates">
								<div>
									<button data-filter="{'key':'all','label':'전체상태'}" class="mainbodystatesselect">전체 상태</button>
									<button data-filter="{'key':'on_progress','label':'진행중'}" class="mainbodystatesnosel">진행중</button>
									<button data-filter="{'key':'completed','label':'완료'}" class="mainbodystatesnosel">완료</button>
									<button data-filter="{'key':'cancelled','label':'취소/환불'}" class="mainbodystatesnosel">취소/환불</button>
								</div>
								<div>
									<div class="mainbodystatelistcast">
										<svg width="20" height="20" xmlns="" fill="#fffef" viewBow="0 0 20 20">
											<path d="M 0 3 a 1 1 0 0 1 1 -1 h 3.185 A 2.995 2.995 0 0 1 7 0 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 0 2 H 9.815 A 2.995 2.995 0 0 1 7 6 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 -1 -1 Z m 20 14 a 1 1 0 0 1 -1 1 H 9.815 A 2.995 2.995 0 0 1 7 20 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 0 -2 h 3.185 A 2.995 2.995 0 0 1 7 14 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 1 1 Z m 0 -7 a 1 1 0 0 1 -1 1 h -3.185 A 2.995 2.995 0 0 1 13 13 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 0 -2 h 9.185 A 2.995 2.995 0 0 1 13 7 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 1 1 Z M 6 3 a 1 1 0 1 0 2 0 a 1 1 0 0 0 -2 0 Z m 2 14 a 1 1 0 1 0 -2 0 a 1 1 0 0 0 2 0 Z m 6 -7 a 1 1 0 1 0 -2 0 a 1 1 0 0 0 2 0 Z"
											fill ="#fffef" fill-rule ="evenodd"></path>
										</svg>
									</div>
								</div>
							</nav>
							<div class="mainproduct">
								<div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="https://media.bunjang.co.kr/product/187075471_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													거래완료
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">젠북14 ux425ea</span>
												<span class="mainproductrightprice"><strong>600,000</strong>원</span>
												<span class="mainproductrightnickname">wjkskwkw
												/ 번개페이 안전결제</span>
												<span class="mainproductrighttime"><div>2022.05.17 (오후 06:22)</div></span>
											</aside>
										</div>
									</div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="https://media.bunjang.co.kr/product/187339229_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													거래완료
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">물하나</span>
												<span class="mainproductrightprice"><strong>1,000</strong>원</span>
												<span class="mainproductrightnickname">HSK137</span>
												<span class="mainproductrighttime"><div>2022.05.14 (오후 04:31)</div></span>
											</aside>
										</div>
									</div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="https://media.bunjang.co.kr/product/187339321_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													거래완료
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">키보드</span>
												<span class="mainproductrightprice"><strong>1,000</strong>원</span>
												<span class="mainproductrightnickname">HSK137</span>
												<span class="mainproductrighttime"><div>2022.05.09 (오전 11:57)</div></span>
											</aside>
										</div>
									</div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="	https://media.bunjang.co.kr/product/184363055_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													합의취소
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">마우스</span>
												<span class="mainproductrightprice"><strong>100</strong>원</span>
												<span class="mainproductrightnickname">HSK137</span>
												<span class="mainproductrighttime"><div>2022.05.09 (오전 09:06)</div></span>
											</aside>
										</div>
									</div>
								</div>
							</div>
						</div><!-- ------------------------------------------------------------------------------------------------ -->
						<div class="mainbody1">
							<nav class="mainbodystates">
								<div>
									<button data-filter="{'key':'all','label':'전체상태'}" class="mainbodystatesselect">전체 상태</button>
									<button data-filter="{'key':'on_progress','label':'진행중'}" class="mainbodystatesnosel">진행중</button>
									<button data-filter="{'key':'completed','label':'완료'}" class="mainbodystatesnosel">완료</button>
									<button data-filter="{'key':'cancelled','label':'취소/환불'}" class="mainbodystatesnosel">취소/환불</button>
								</div>
								<div>
									<div class="mainbodystatelistcast">
										<svg width="20" height="20" xmlns="" fill="#fffef" viewBow="0 0 20 20">
											<path d="M 0 3 a 1 1 0 0 1 1 -1 h 3.185 A 2.995 2.995 0 0 1 7 0 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 0 2 H 9.815 A 2.995 2.995 0 0 1 7 6 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 -1 -1 Z m 20 14 a 1 1 0 0 1 -1 1 H 9.815 A 2.995 2.995 0 0 1 7 20 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 0 -2 h 3.185 A 2.995 2.995 0 0 1 7 14 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 1 1 Z m 0 -7 a 1 1 0 0 1 -1 1 h -3.185 A 2.995 2.995 0 0 1 13 13 a 2.995 2.995 0 0 1 -2.815 -2 H 1 a 1 1 0 0 1 0 -2 h 9.185 A 2.995 2.995 0 0 1 13 7 a 2.995 2.995 0 0 1 2.815 2 H 19 a 1 1 0 0 1 1 1 Z M 6 3 a 1 1 0 1 0 2 0 a 1 1 0 0 0 -2 0 Z m 2 14 a 1 1 0 1 0 -2 0 a 1 1 0 0 0 2 0 Z m 6 -7 a 1 1 0 1 0 -2 0 a 1 1 0 0 0 2 0 Z"
											fill ="#fffef" fill-rule ="evenodd"></path>
										</svg>
									</div>
								</div>
							</nav>
							<div class="mainproduct">
								<div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="https://media.bunjang.co.kr/product/187339229_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													거래완료
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">물하나</span>
												<span class="mainproductrightprice"><strong>1,000</strong>원</span>
												<span class="mainproductrightnickname">WEFW</span>
												<span class="mainproductrighttime"><div>2022.05.14 (오후 04:31)</div></span>
											</aside>
										</div>
									</div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="https://media.bunjang.co.kr/product/187339321_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													거래완료
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">키보드</span>
												<span class="mainproductrightprice"><strong>1,000</strong>원</span>
												<span class="mainproductrightnickname">WEFW</span>
												<span class="mainproductrighttime"><div>2022.05.09 (오전 11:57)</div></span>
											</aside>
										</div>
									</div>
									<div class="mainproductcast">
										<div class="mainproductphotocast"> <!-- data-order-id="35599225" -->
											<div class="mainproductphoto">
												<img src="	https://media.bunjang.co.kr/product/184363055_1_0_230.jpg" alt ="상품이미지">
												<span class="mainproductphotostates">
													<img src="https://assets.bunjang.co.kr/img/trade/ic-circle-tick@3x.png">
													합의취소
												</span>
											</div>
											<aside class="mainproductright">
												<span class="mainproductrightname">마우스</span>
												<span class="mainproductrightprice"><strong>100</strong>원</span>
												<span class="mainproductrightnickname">WEFW</span>
												<span class="mainproductrighttime"><div>2022.05.09 (오전 09:06)</div></span>
											</aside>
										</div>
									</div>
								</div>
							</div>
						</div><!-- ------------------------------------------------------------------------------------------------- -->
						<div class="mainbody2">
							<a href="#">
								<mark class="tradelistmark">
									정산계좌
									<div class="tradelistresist">
										정산계좌를등록하세요.
									</div>
								</mark>
							</a>
							<section class="tradelistsection">
								<div class="tradelistsectioncast">
									<div>
										<div class="tradelistsectiontext">
										 	정산 내역이 없습니다.
										</div>
									</div>
								</div>
							</section>
							<div class="tradelistbottom">
								판매대금은 등록한계좌번호로 정산일에 지급됩니다.<br/>
								정산일 이후 미지급 상태인 경우 계좌번호를 다시 한 번 확인해주세요.								
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
</html>