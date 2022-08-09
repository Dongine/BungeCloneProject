<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="com.bunge.dto.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>배송지 보내기</title>
	<link rel="stylesheet" href="css/AddressSend.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		String addressName = (String)(request.getAttribute("addressName"));
		String phoneNumber = (String)(request.getAttribute("phoneNumber"));
		String address = (String)(request.getAttribute("address"));
		String detailedAddress = (String)(request.getAttribute("detailedAddress"));
		String nicknameFk = (String)(request.getAttribute("nicknameFk"));
		String imagename = (String)(request.getAttribute("imagename"));
		String productname = (String)(request.getAttribute("productname"));
		int price = (Integer)(request.getAttribute("price"));
		String deliveryCharge = (String)(request.getAttribute("deliveryCharge"));
		if((addressName==null) || (phoneNumber==null) || (address==null) || (detailedAddress==null)) { // 주소정보가 없다면
	%>	
			<script>
				$(function() {
					$("#addressContentCt2").css("display","block");
					$("#addressDoneCt").css("display","none");
					$("#addressInputButton1").css("display","block");
					$("#addressInputButton2").css("display","none");
				});
			</script>	
		
	<% 	
		} else { // 값이 있다면
	%>
			<script>
				$(function() {
					$("#addressContentCt2").css("display","none");
					$("#addressDoneCt").css("display","block");
					$("#addressInputButton1").css("display","none");
					$("#addressInputButton2").css("display","block");
				});
			</script>	
	<%		
		}
	%>
	<style>
		
	</style>
	<script>
		// 상품선택 선택시 상품선택화면 블럭
		function product_select_open() {
			$("#productCt1").css("display","block");
		}
		// 상품선택 뒤로가기
		function product_select_close() {
			$("#productCt1").css("display", "none");
		}
		
		// 가격 변경하기 모달창 블록
		function price_change_open() {
			$("#priceChangeBg").css("display","block");
			$("#priceChangeCt").slideDown("fast");
		}
		// 가격 변경하기 모달창 숨기기, 가격변경
		function price_change_close() {
			$("#priceChangeBg").css("display","none");
			$("#priceChangeCt").slideUp("fast");
			$("#sellarDealCt4 > span:first-child").html('<b>' + $("#priceChangeInputConsumer").val()+'</b>');
			$("#address_now_price").html('<span>' + $("#priceChangeInputConsumer").val()+'</span>'); 
		}
		
		$(function() {
			// 배송비 포함 체크여부
			$("#delivery_include").on("click", function() {
				if($("#delivery_include").is(':checked')) {
					$(".deliveryChargeInclude").text("배송비 포함");
				} else {
					$(".deliveryChargeInclude").text("배송비 별도");
				}
			});
			
			// 주소변경
			$("#addressChangeButton").click(function() {
				location.href="Controller?command=GoAddressManagement&productnumber_pk=<%=productnumber_pk%>";
			});
			// 주소정보, 배송비여부, 상품정보, 가격  주소보내기 액션페이지로 이동
			$("#addressInputButton2").click(function() {
				var sellerFk = $(".dealProfileInquiryButton").text();
				var productName = $("#sellarDealCt5").text();
				var price = $("#price").text();
				var address = $("#address").text();
				var detailedAddress = $("#detailedAddress").text();
				var addressName = $("#addressName").text();
				var imagename = $("#sellarDealCt2 > img").attr('src').substr(7); // images/다음값부터 가져옴
				var deliveryCharge = $("#deliveryChargeInclude").text().trim();
			 	location.href='Controller?command=AddressSendAction&productnumber_pk=' +<%=productnumber_pk%>+ '&sellerFk='+sellerFk+'&productName='+productName+'&price='+price+'&address='+address+'&detailedAddress='+detailedAddress+'&addressName='+addressName+'&imagename='+imagename+'&deliveryCharge='+deliveryCharge;
			}); 
			$("#addressInputButton1").click(function() {
				location.href="Controller?command=GoAddressManagement&productnumber_pk=<%=productnumber_pk%>";
				//opener.location.reload();
			});
		});
	</script> 
</head>
<body>
	<div>
		<div id="addressSendCt1">
			<div id="addressSendCt2">
				<div id="addressSendCt3">
					<svg onclick="window.close()" class="fr" style="padding-top: 13px; padding-right: 13px; padding-bottom: 13px; cursor: pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="#1e1d29" viewBox="0 0 20 20"><path d="M11.414 10l6.293 6.292a.999.999 0 11-1.414 1.414L10 11.413l-6.293 6.293a1 1 0 01-1.414-1.414L8.586 10 2.293 3.707a1 1 0 111.414-1.414L10 8.585l6.293-6.292a1 1 0 011.414 1.414l-6.293 6.292z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
				</div>
				<div id="addressSendCt4">
					<div id="addressContentCt1">
						<div id="addressContentCt1_1" style="font-size:24px;"><b>판매자에게</br>거래를 요청합니다</b></div>
						<div style="width: 100%; height:37px;"></div>
						
						<!-- 거래할 상품을 선택했을 때 -->
						<div id="sellarDealCt1">
							<div id="sellarDealCt2">
								<img style="width: 44px; height: 44px;" src="images/<%=imagename%>"/> 
								<div id="sellarDealCt3">
									<div id="sellarDealCt4">
										<span id="price" style="font-size: 18px;"><b><%=price%></b></span><span>원</span><span class="deliveryChargeInclude" id="deliveryChargeInclude"><%=deliveryCharge%></span><!-- 배송비 포함 -->
										<span>
											<button class="changeButton" onclick="price_change_open()">
												<svg width="14" height="14" xmlns="http://www.w3.org/2000/svg" fill="#9b99a9" viewBox="0 0 20 20"><path d="M17.64 2.36a3.641 3.641 0 00-5.149 0L1.88 12.97a2 2 0 00-.586 1.415v2.321a2 2 0 002 2h2.333a2 2 0 001.415-.587l10.6-10.611.147-.156a3.641 3.641 0 00-.147-4.994zm-6.509 4.186l2.322 2.322-7.84 7.84h-1.82a.5.5 0 01-.5-.5v-1.822l7.838-7.84zm2.774-2.772a1.641 1.641 0 112.321 2.32l-1.358 1.359-2.322-2.322 1.36-1.357z" fill="#9b99a9" fill-rule="evenodd"></path></svg>
												<b>변경</b>
											</button>
										</span>
										<p id="sellarDealCt5"><%=productname%></p>
									</div>
								</div>
							</div>
							<div id="sellarDealCt6">
								<span>판매자:</span><button class="dealProfileInquiryButton"><%=nicknameFk%></button>
							</div>
						</div>
					</div>
					<div style="width:100%; height:8px; background-color: rgb(234, 233, 241)"></div>
					
					<!-- 배송지를 선택 안했을 때 -->
					<div id="addressContentCt2">
						<div id="addressInfoFont1" class="fl"><b>배송지정보</b></div> <br/>
						<div id="addressInfoFont2" class="fl">상품을 받을 배송지를 입력하세요</div>
						<div style="clear:both;"></div>
					</div>
					
					<!-- 배송지를 선택했을 때 -->
					<div id="addressDoneCt">
						<div id="addressDoneCt1">
							<p style="margin: 0px; font-size: 1rem;"><b>배송지정보</b></p>
							<p style="margin: 27px 0 3px 0; font-size: 15px;">
								<span id="address"><%=address%></span> &nbsp; <!-- 주소 -->
								<span id="detailedAddress"><%=detailedAddress%></span><!-- 상세주소 -->
								<button class="changeButton" id="addressChangeButton">
									<svg width="14" height="14" xmlns="http://www.w3.org/2000/svg" fill="#9b99a9" viewBox="0 0 20 20"><path d="M17.64 2.36a3.641 3.641 0 00-5.149 0L1.88 12.97a2 2 0 00-.586 1.415v2.321a2 2 0 002 2h2.333a2 2 0 001.415-.587l10.6-10.611.147-.156a3.641 3.641 0 00-.147-4.994zm-6.509 4.186l2.322 2.322-7.84 7.84h-1.82a.5.5 0 01-.5-.5v-1.822l7.838-7.84zm2.774-2.772a1.641 1.641 0 112.321 2.32l-1.358 1.359-2.322-2.322 1.36-1.357z" fill="#9b99a9" fill-rule="evenodd"></path></svg>
									<b>변경</b>
								</button>
							</p>
							<p style="margin: 0px; font-size: 0.875rem;">
								<span id="addressName"><%=addressName%></span><!-- 이름 -->
								<span id="phoneNumber"><%=phoneNumber%></span><!-- 010-1234-5678 -->
							</p>
						</div>
					</div>
					
					<div id="addressContentCt3">
						“BGZT Digital”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
					</div>
				</div> 
				
				<!-- 배송지 입력하기 -->
				<div id="addressInputButton1">
					<button class="addressInputButtonFont">배송지 입력하기</button>
				</div>
				
				<!-- 배송지 전송하기 -->
				<div id="addressInputButton2">
					<button class="addressInputButtonFont">배송지 전송하기</button>
				</div>
			</div>
		</div>
		
		<!-- 상품선택 -->
		<div id="productCt1">
			<div id="productCt2">
				<div id="productCt3">
					<div style="width: 43px; cursor: pointer; " onclick="product_select_close()">
						<svg style="margin-left: 22px; cursor: pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="#1e1d29" viewBox="0 0 20 20"><path d="M20 9.996a1 1 0 01-1 1H3.66l5.997 5.248a1 1 0 01-1.316 1.506l-8-7c-.008-.007-.01-.018-.019-.025a1.015 1.015 0 01-.177-.24c-.018-.03-.045-.054-.059-.087a.975.975 0 010-.802c.014-.033.041-.057.06-.087a.975.975 0 01.176-.24c.008-.007.011-.018.02-.025l8-7A1 1 0 019.656 3.75L3.66 8.996H19a1 1 0 011 1z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
					</div>
					<span style="padding-left: -23px;"><b>상품선택</b></span>
					<div style="width:43px;"></div>	
				</div>
				<div id="productCt4"><b>등록된 상품이 없습니다</b></div>
			</div>
		</div>
		
		<!-- 가격, 배송비여부 변경 -->
		<div id="priceChangeBg" onclick="price_change_close()"></div>
		<div id="priceChangeCt">
			<div class="priceChangeCtTop">
				<div id="priceChangeCtCloseButton" onclick="price_change_close()">
					<svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" fill="#1e1d29" viewBox="0 0 20 20"><path d="M11.414 10l6.293 6.292a.999.999 0 11-1.414 1.414L10 11.413l-6.293 6.293a1 1 0 01-1.414-1.414L8.586 10 2.293 3.707a1 1 0 111.414-1.414L10 8.585l6.293-6.292a1 1 0 011.414 1.414l-6.293 6.292z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
				</div>
			</div>
			<div class="priceChangeContentCt">
				<div class="priceChangeContent1">가격 변경하기</div>
				<div class="priceChangeContent2">
					<span>현재 가격</span>
					<span id="address_now_price"><%=price%></span><span>원</span>
<!-- 					::before -->
					<span class="deliveryChargeInclude" style="font-size: 14px; color: rgb(94, 92, 107);">배송비 포함</span><!-- 배송비 포함 -->
				</div>
				<div class="priceChangeContent3">
					<p><input type="checkbox" id="delivery_include" name="delivery_include" value="<%=deliveryCharge%>"><b style="color: rgb(102, 102, 102); margin-left: 5px;">배송비 포함</b></p>
					<input type="number" id="priceChangeInputConsumer" placeholder="가격 입력" name="change_price" value="<%=price%>">
				</div>
				<p class="priceChangeInfo">이번 거래에서만 적용되며, 기존 상품 가격은 변하지 않아요.</p>
			</div>
			<button id="priceChangeDoneButton" onclick="price_change_close()">확인</button>
		</div>
	</div>
</body>
</html>