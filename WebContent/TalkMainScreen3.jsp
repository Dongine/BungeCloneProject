<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>

<%
	String NICKNAME_PK = "";
	ProductDao pDao = new ProductDao();
	StoreDao sDao = new StoreDao();
	JjimCountDao jDao = new JjimCountDao();
	CommentDao cDao = new CommentDao();
	ChatDao crDao = new ChatDao();
	DealingDao dlDao = new DealingDao();
	int rnO = 0; // 임시 채팅창번호 = 0 (초기값일 뿐)
	
	ArrayList<ChatRoomDto> listChatRoom = null;
	ArrayList<RealTimeChatDto> listRealTimeChat = null;
	String getPurchaseFk;
	int productnumber_pk = 0;
	String category1 = "";
	String nicknameFk = "";
	String imagename = "";
	String productname = ""; 
	int price = 0;
	String deliveryCharge = "";
	
	int countDealDone = 0;
	int countReview = 0;
	int countProducts = 0;
	
	if(session.getAttribute("NICKNAME_PK")==null) { // 닉네임값이 없다면
%>
	<script>
		alert("로그인을 해주세요");
		location.href = "Controller?command=Main";
	</script>
<%
	} else {
		NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		rnO = crDao.getRnoLast(NICKNAME_PK);

		try {
			rnO = Integer.parseInt(request.getParameter("rno"));
		} catch(Exception e) { } 

		listChatRoom = crDao.getChatRoomSelect(NICKNAME_PK);
		listRealTimeChat = crDao.getRealTimeChatSelect(rnO);
		try {
	 		productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
			category1 = request.getParameter("category1");
		} catch(NumberFormatException e) { }
		
		
	 	if(productnumber_pk==0) {   // 메인 - [번개톡] 클릭한 상황.
	 		if(crDao.countRno(NICKNAME_PK)==0) {
				%>
					<script>
						alert("채팅내역이 없습니다. 상품페이지의 연락하기 버튼을 통해 채팅을 시작해주세요");
						location.href="Controller?command=Main";
					</script>
				<%
	 		} else {
	 		
		   		String strRealChatProductInfo = crDao.getRealChatProductInfo(rnO);
		 		String[] arrRealChatProductInfo = strRealChatProductInfo.split("/");
		  		int cDno = Integer.parseInt(arrRealChatProductInfo[0]);
		 		String sellerFk = arrRealChatProductInfo[1]; // 판매자
		 		String consumerFk = arrRealChatProductInfo[2]; // 구매자
		 		int dDno = Integer.parseInt(arrRealChatProductInfo[3]);
		 		productname = arrRealChatProductInfo[4]; // 상품명
		 		price = Integer.parseInt(arrRealChatProductInfo[5]); // 가격
		 		imagename = arrRealChatProductInfo[6]; // 상품이미지 
		 		productnumber_pk = Integer.parseInt(arrRealChatProductInfo[7]); // 상품번호
		  		
		 		if(NICKNAME_PK == sellerFk) {
		 		 	// 후기내역 (횟수) 조회
		 		 	countReview = dlDao.countReview(consumerFk);
	
		 		 	// 판매상품 (갯수) 조회
		 		 	countProducts = dlDao.countProducts(consumerFk);
		 		 	
					//판매내역 (횟수) 조회
					countDealDone = dlDao.countDealDone(consumerFk);
		 		} else {
		 		 	// 후기내역 (횟수) 조회
		 		 	countReview = dlDao.countReview(sellerFk);
	
					//판매상품 (갯수) 조회
					countProducts = dlDao.countProducts(sellerFk);
		 		 	
		 			// 판매내역 (횟수) 조회
		 		 	countDealDone = dlDao.countDealDone(sellerFk);
		 		}
	 		}
		} else {	// [연락하기] 클릭한 상황.
			String strProductSelect = pDao.getSellerProduct(productnumber_pk);
			String[] arrStrProductSelect = strProductSelect.split("/"); // 구분자
		
			nicknameFk = arrStrProductSelect[0];
			imagename = arrStrProductSelect[1]; // 에러
			productname = arrStrProductSelect[2];
			price = Integer.parseInt(arrStrProductSelect[3]);
			deliveryCharge = arrStrProductSelect[4];
			
	 		 	// 판매내역 (횟수) 조회
	 		 	countDealDone = dlDao.countDealDone(nicknameFk);

				// 판매상품 (갯수) 조회
				countProducts = dlDao.countProducts(nicknameFk);
	 		 	
	 		 	// 후기내역 (횟수) 조회
	 		 	countReview = dlDao.countReview(nicknameFk);
		}
	}
%>

	<meta charset="UTF-8">
	<title>번개톡 메인화면</title>
	<link rel="stylesheet" href="css/TM4.css"/>
	<link rel="stylesheet" href="css/TalkMainScreen3.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		// Setup WebSocket.
		var webSocket = new WebSocket("ws://localhost:9090/Bunge5/broadcasting");
		webSocket.onmessage = function(e) {
			location.reload();
		}
		webSocket.onopen = function(e) { }
		webSocket.onerror = function(e) { }
		webSocket.onclose = function(e) { }
		
		// 번개톡 채팅화면 우측상단 점3개 아이콘 선택시 모달창 블록, 숨기기 
		function icon5Modal_open() {
			if($(".rightName3DotIconModalBg").css("display")=="none") {
				$(".rightName3DotIconModalBg").css("display","block");
				$(".rightName3DotIconModal1").slideDown("fast");
				$(".rightNameModalBg").css("display", "none");
				$(".rightNameModal1").css("display","none"); 
			} else if ($(".rightName3DotIconModalBg").css("display")=="block") {
				$(".rightName3DotIconModalBg").css("display","none");
				$(".rightName3DotIconModal1").slideUp("fast"); 
			}
		};
		$(function(){
			// 번개톡 아이콘 선택시 번개장터 메인화면으로 이동
			$('#bungeTalkIcon').click(function() {
				location.href='Controller?command=GoMainTalk';
			});
			
			// 점
			$(".rightName3DotIconModalBg").click(function() {
				$(".rightName3DotIconModalBg").css("display","none");
				$(".rightName3DotIconModal1").slideUp("fast"); 
			});
			
			
			// 백그라운드 선택시 모달창 숨기기 
			$(".rightNameModalBg").click(function(){
				$(".rightNameModalBg").css("display","none");
				$(".rightNameModal1").slideUp("fast"); 
			});
			
			// 택배거래요청 
			$("#addressSendButton").click(function() {
				window.open("Controller?command=GoAddressSend&productnumber_pk=<%=productnumber_pk%>");
			});
			
			// 직거래요청 
			$("#directDealSendButton").click(function() {
				var productnumber_pk = <%=productnumber_pk%>;
 				var nicknameFk = $("#nicknameFkQ").text();
				var imagename = $("#selectedProductCt > img").attr('src').substr(7);
				var productname = $("#selectedProductName").text();
				var price = $("#selectedProductPrice").text();
				window.open("Controller?command=GoDirectDealSend&productnumber_pk="+productnumber_pk+'&nicknameFk='+nicknameFk+'&imagename='+imagename+'&productname='+productname+'&price='+price);
			});
			
			// 구매자에게 거래를 요청받았습니다 페이지로 이동 
			$("#getDealFromConsumer").click(function() {
				location.href="Controller?command=GoConsumerGetDealRequest";
			});
			
			
			// 미완성 알림 
			$(".notYet").click(function() {
				alert("준비중입니다");
			});

			//
			$(".indiInquiry").click(function() {
				location.href="Controller?command=GoTM_QNA";
			});
			
			// 왼쪽 채팅방 선택
			$(".listContent2").click(function() {
				var rno = $(this).parent().attr("rno");
				location.href="Controller?command=GoMainTalk&rno="+rno;
			});
			// 판매자에게 택배거래를 요청했습니다
			$(document).on('click', '.deliveryDealSendFromConsumerCt', function() {
				var rno = $(this).attr("rnoSendDeliveryFromConsumer");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoSellerToDealRequest&rno="+rno+'&dno='+dno);
			}); 
			
			// 구매자에게 택배거래를 요청받았습니다
			$(document).on('click', '.deliveryDealGetFromConsumerCt', function() {
				var rno = $(this).attr("rnoGetDeliveryFromConsumer");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoConsumerGetDealRequest&rno="+rno+'&dno='+dno);
			}); 
			
			// 구매자에게 택배거래를 요청했습니다
			$(document).on('click', '.deliveryDealSendFromSellerCt', function() {
				var rno = $(this).attr("rnoSendDeliveryFromSeller");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoConsumerToDealRequest&rno="+rno+'&dno='+dno);
			}); 
			
			// 판매자에게 택배거래를 요청받았습니다
			$(document).on('click', '.deliveryDealGetFromSellerCt', function() {
				var rno = $(this).attr("rnoGetDeliveryFromSeller");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoSellerGetDealRequest&rno="+rno+'&dno='+dno);
			}); 
			
			// 택배거래완료
			$(document).on('click', '.deliveryDealDoneCt', function() {
				var rno = $(this).attr("rnoDealDone");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoDealDone&rno="+rno+'&dno='+dno);
			}); 
			
			// 직거래 요청
			$(document).on('click', '.sendDirectDealCt', function() {
				var rno = $(this).attr("rnoDirectDealSend");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoDirectDealCheck&rno="+rno+'&dno='+dno);
			}); 
			
			// 직거래 요청확인
			$(document).on('click', '.sendDirectDealCheckCt', function() {
				var rno = $(this).attr("rnoDirectDealCheck");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoDirectDealCheck&rno="+rno+'&dno='+dno);
			});
			
			// 직거래 완료
			$(document).on('click', '.directDealDoneCt', function() {
				var rno = $(this).attr("rnoDirectDealDone");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				var nicknameFk = $("#nicknameFkQ").text();
				var imagename = $("#selectedProductCt > img").attr('src').substr(7);
				var productname = $("#selectedProductName").text();
				var price = $("#selectedProductPrice").text();
				window.open("Controller?command=GoDirectDealDone&rno="+rno+'&dno='+dno);
			});
			
			// 거래취소
			$(document).on('click', '.dealCancelCt', function() { 
				var rno = $(this).attr("rnoDealCancel");
				var dno = <%=crDao.getDnoFromRno(rnO)%>;
				window.open("Controller?command=GoDealCancel&rno="+rno+'&dno='+dno);
			});
			
			$(document).on('click',".chatProductInfoCt",function() {
				location.href="Controller?command=GoProduct&productnumber_pk=<%=productnumber_pk%>";
			});
			
			// 1:1문의하기로 이동
			$(".goInquiry").click(function(){
				location.href="Controller?command=GoTM_QNA";
			});
			
			// 파일 선택하면 다음페이지로 이동
			$("#input-file").change(function() {
				$(this).parent().submit();
			});
			
			// 대화창 맨 아래로 스크롤
			$(".rightInfoCt2").scrollTop($(document).height());
			
			// 채팅새로고침
			$("#btnSend").click(function() {
				webSocket.send("<%=NICKNAME_PK%>|||<%=rnO%>|||" + $(this).parent().find("textarea").val());
				location.reload();
			});
			
			// 사기신고조회로 이동
			$("#rightNameModalButtonL").click(function() {
				window.open("Controller?command=GoReportHistoryInquiry");		
			});
			
			// 상대상점관리이동
			$("#rightNameModalButtonR").click(function() {
				var otherName = $("#rightInfoCt1_2").find("span div b").text();				
				location.href="Controller?command=GoTM4&NICKNAME_PK="+otherName;
			});
			
		});
		
		// 번개톡 채팅화면 우측중앙 닉네임 선택시 모달창 블록, 숨기기 
		function nameModal_open() {
			if($(".rightNameModalBg").css("display")=="none") {
				$(".rightNameModalBg").css("display","block");
				$(".rightNameModal1").slideDown("fast"); 
				$(".rightName3DotIconModalBg").css("display","none");
				$(".rightName3DotIconModal1").css("display","none"); 
			} else if ($(".rightNameModalBg").css("display")=="block") {
				$(".rightNameModalBg").css("display","none");
				$(".rightNameModal1").slideUp("fast"); 
			}
		};
		
		// 누적 판매내역 모달창 블록  
		function sales_detail_open() {
			$("#rightNameModalSalesDetailsCt").css("display","block");
		};
		
		// 누적 판매내역 모달창 숨기기 
		function sales_detail_close() {
			$("#rightNameModalSalesDetailsCt").css("display","none");
		};
		
 		// 채팅창 +아이콘 선택시 모달창 블록 또는 숨기기
		function plus_icon_open() {
 			if($("#chatModalCt1").css("display")=="none") {
				$("#chatModalCt1").css("display","block");
				$(".rightInfoCt2").css("height","472px");
				$(".plusIconCt > svg").css("transform","rotate(45deg)");
				$(".plusIconCt > svg").css("transition","width 0.5s, height 0.5s, background-color 0.5s, transform 0.5s");
 			} else if($("#chatModalCt1").css("display")=="block") {
 				$("#chatModalCt1").css("display","none");
 				$(".rightInfoCt2").css("height","573px");
 				$(".plusIconCt > svg").css("transform","rotate(0deg)");
 				$(".plusIconCt > svg").css("transition","width 0.5s, height 0.5s, background-color 0.5s, transform 0.5s");
 			}
			
		}
		// 채팅창 +아이콘 선택시 모달창 숨기기  
		function plus_icon_close() {
			$("#chatModalCt1").css("display","none");
			$(".rightInfoCt2").css("height","573px");
			$(".plusIconCt > svg").css("transform","rotate(0deg)");
			$(".plusIconCt > svg").css("transition","width 0.5s, height 0.5s, background-color 0.5s, transform 0.5s");
		} 
		
		// 번개톡 타이틀 우측 아이콘 모달창 블록 또는 숨기기 
		function m1_open() {
			if($(".inquiryModalBg").css("display")=="none") {
				$(".inquiryModalBg").css("display","block");  
				$(".inquiryModalCt2").slideDown("fast");
			} else if ($(".inquiryModalBg").css("display")=="block") {
				$(".inquiryModalBg").css("display","none"); 
				$(".inquiryModalCt2").slideUp("fast");
			}
		};
		// 번개톡 타이틀 우측 아이콘 모달창 숨기기 
		function m1_close() {
			$(".inquiryModalBg").css("display","none");
			$(".inquiryModalCt2").slideUp("fast");
		};
		
		// 번개장터 수신채팅목록 우측 아이콘 모달창 블록 
		function m2_open() {
			$("#talkListBunModalCt").css("display","block");
		};
		// 번개장터 수신채팅목록 우측 아이콘 모달창 숨기기 
		function m2_close() { 
			$("#talkListBunModalCt").css("display","none");
		}; 
		
		// 채팅목록 우측 아이콘 모달창 블록 
		function m3_open() {
			$(".talkListModalCt").css("display","block");
		};
		// 채팅목록 우측 아이콘 모달창 숨기기 
		function m3_close() {
			$(".talkListModalCt").css("display","none");
		}; 
		
	</script>
</head>
<body>
<div id="header">
		<%@ include file="mainheader.jspf" %>
		<!-- 번개톡 메인화면 -->
		<div id="talkMainCt2">
			<div id="talkMainCt3">
			<!-- 번개톡 좌측화면 -->
			<div id="leftContainer" class="fl">
				<div class="fl listTitleCt">
					<div class="fl listTitleDiv1"></div>
					<div class="fl listTitleDiv2"><b>번개톡</b></div>
					<div class="fl listDot1" onclick="m1_open()">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"><g fill="#C3C2CC" fill-rule="evenodd"><circle cx="16" cy="9.2" r="1.8"></circle><circle cx="16" cy="16" r="1.8"></circle><circle cx="16" cy="22.8" r="1.8"></circle></g></svg>
					</div>
				</div>
				<div style="clear:both;"></div>
				<div class="fl listCt1">
					<!-- 채팅목록 번개톡 타이틀 우측 아이콘 모달창 -->
					<div class="inquiryModalBg" onclick="m1_close()"></div>
	 					<div class="inquiryModalCt2">
							<div class="inquiryModalCt3">
								<div class="storeManagement notYet" onclick="general_management_screen()">
									<div class="storeManagement2">
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g fill="none" fill-rule="evenodd" transform="translate(1 1)"><circle cx="10" cy="10" r="8.5" stroke="#C3C2CC" stroke-width="3"></circle><path fill="#C3C2CC" d="M15.05 3.405l2.021 2.02L4.95 17.547l-2.02-2.02z"></path></g></svg>
										<span style="margin-left: 15px; font-size: 16px;">차단 상점 관리</span>
									</div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#C3C2CC" fill-rule="evenodd" d="M4.07 15.528a.8.8 0 0 1 .133-.86L10.13 8 4.203 1.33A.8.8 0 1 1 5.398.269l6.4 7.2a.8.8 0 0 1 0 1.063l-6.4 7.2a.8.8 0 0 1-1.328-.203z"></path></svg>
								</div>
								<div class="indiInquiry">
									<div class="indiInquiry2">
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><path fill="#3F3E4B" fill-rule="nonzero" d="M10.4.02C5.62.33 2 4.52 2 9.31V16c0 1.66 1.34 3 3 3h1c1.1 0 2-.9 2-2v-4c0-1.1-.9-2-2-2H4V9.29C4 5.45 6.96 2.11 10.79 2A6.999 6.999 0 0 1 18 9v2h-2c-1.1 0-2 .9-2 2v4c0 1.1.9 2 2 2h2v1h-6c-.55 0-1 .45-1 1s.45 1 1 1h5c1.66 0 3-1.34 3-3V9c0-5.17-4.36-9.32-9.6-8.98z"></path></svg>
										<span class="goInquiry" style="margin-left: 15px; font-size: 16px;">1:1문의하기</span>
									</div>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="#C3C2CC" fill-rule="evenodd" d="M4.07 15.528a.8.8 0 0 1 .133-.86L10.13 8 4.203 1.33A.8.8 0 1 1 5.398.269l6.4 7.2a.8.8 0 0 1 0 1.063l-6.4 7.2a.8.8 0 0 1-1.328-.203z"></path></svg>
								</div>
							</div>
						</div> 
						<!-- 채팅목록 리스트 -->
						<ul class="listUl">
							<%
								for(ChatRoomDto dto : listChatRoom) {
									String strLastChat = crDao.getLastChat(dto.getRno());	// "아디다리도리다스의 거래가 취소되었어요."
									String strTemp = crDao.getLastChatTime(dto.getRno());
									String strLastChatDate = "";
									if(!"".equals(strTemp)) {
										SimpleDateFormat sdfDB = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
										SimpleDateFormat sdfDiv = new SimpleDateFormat("M.dd");
										java.util.Date date1 = sdfDB.parse(strTemp);
										strLastChatDate = sdfDiv.format(date1);    // "5.20";
									} 
									String displayName = "";
									if(dto.getPurchaseFk().equals(NICKNAME_PK)) {
										displayName = dto.getSellerFk();
									} else {
										displayName = dto.getPurchaseFk();
									}
							%>
								<li class="listContent1" rno="<%=dto.getRno()%>">
									<div class="imgCt">
				 						<img style="padding:1rem;" src="images/talkHumanIcon.png"/>
									</div>
									<div class="listContent2">
										<div class="listContent3">
											<span class="fl listNameFont"><b><%=displayName %></b></span>
											<span class="fr listTimeFont"><%=strLastChatDate %></span>
										</div>
				
										<div class="fl listContent4">
											<!-- <span class="fl listMeIcon">나</span> -->
											<%
												if(strLastChat.equals("/;/구매자의_거래요청/;/")) { 
													strLastChat="택배거래요청";
												} else if(strLastChat.equals("/;/판매자의_거래요청/;/")) {
													strLastChat="택배거래요청";
												} else if(strLastChat.equals("/;/택배거래완료/;/")) {
													strLastChat="택배거래완료";
												} else if(strLastChat.equals("/;/직거래요청/;/")) {
													strLastChat="직거래요청";
												} else if(strLastChat.equals("/;/직거래완료/;/")) {
													strLastChat="직거래완료";
												} else if(strLastChat.equals("/;/거래취소/;/")) {
													strLastChat="거래취소";
												} else if(strLastChat.equals("/;/상품상세보기/;/")) {
													strLastChat="상품";
												} else if(strLastChat.equals("/;/사진업로드/;/")) {
													strLastChat="사진";
												} 
													
											%>
											<span class="fl listContentFont"><%=strLastChat %></span>
											
										</div>
										<span style="clear:both;"></span>
									</div>
									<div class="listDot2" onclick="m3_open()">
										<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"><g fill="#C3C2CC" fill-rule="evenodd"><circle cx="16" cy="9.2" r="1.8"></circle><circle cx="16" cy="16" r="1.8"></circle><circle cx="16" cy="22.8" r="1.8"></circle></g></svg>
									</div>
								</li>
							<%
								}
							%>
						
					</ul>
				</div>
			</div>
			
			<!-- 번개톡 우측 화면 -->
			<div id="rightContainer" class="fl">
				<div id="rightInfoCt1">
					<div id="rightInfoCt1_1"></div>
					<div id="rightInfoCt1_2" onclick="nameModal_open()">
						<span style="margin-right: 6px; letter-spacing: -0.5px;">
							<%
								if((rnO!=0)&&(category1 == "")) { // DIDI
									String strGetChatOtherNickname = crDao.getChatOtherNickname(rnO);
									String[] arrGetChatOtherNickname = strGetChatOtherNickname.split("/");
									String purchaseFk = arrGetChatOtherNickname[0]; // 구매자 닉네임
									String sellerFk = arrGetChatOtherNickname[1]; // 판매자 닉네임
								
									if(NICKNAME_PK.equals(sellerFk)) {
							%>
										<div style="font-size: 18px;"><b><%=purchaseFk %></b></div>
							<%
									} else if(NICKNAME_PK.equals(purchaseFk)) {
							%>
										<div style="font-size: 18px;"><b><%=sellerFk %></b></div>
							<%
									}
							%>
							<%
								} else { // 방번호값이 있을 때 (상품상세보기에서 번개톡으로 넘어갔을 때)
									
								System.out.println("nicknameFkkkk 살아잇나 " + nicknameFk);
							%>
									<div style="font-size: 18px;"><b id="nicknameFkQ"><%=nicknameFk%></b></div>
							<%
								}
							%>
						</span>
						<span style="display: inline-block; transform: rotate(180deg);" >
							<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path fill="#3F3E4B" fill-rule="nonzero" d="M2.532 7.63L6.004 4.16 9.477 7.63a.891.891 0 1 0 1.261-1.262L6.631 2.262a.891.891 0 0 0-1.262 0L1.262 6.369a.891.891 0 0 0 0 1.262.91.91 0 0 0 1.27 0z"></path></svg>
						</span>
					</div>
					<div id="rightInfoCt1_3" onclick="icon5Modal_open()" style="cursor: pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"><g fill="#C3C2CC" fill-rule="evenodd"><circle cx="16" cy="9.2" r="1.8"></circle><circle cx="16" cy="16" r="1.8"></circle><circle cx="16" cy="22.8" r="1.8"></circle></g></svg>
					</div>
				</div>
				
				<!-- 선택한 상품 화면 -->
				<div id="selectedProductCt">
					<img id="selectedProductImage" class="fl" src="images/<%=imagename%>"/>
					<span id="selectedProductName" class="fl"><%=productname%></span>
					<span id="selectedProductPrice" class="fl"><%=price%></span><span>원</span>
				</div>
				
				<!-- 번개톡 우측상단 닉네임 선택시 모달창  -->
				<div class="rightNameModalBg"></div>
				<div class="rightNameModal1">
					<div class="rightNameModalList1">
						<div class="rightNameModalList1_1">
							<div class="rightNameModalList1_1L">상품후기</div>
							<div class="rightNameModalList1_1C">
								<strong style="margin-right: 8px;"><%=countReview%></strong>
							</div>
						</div>
						<div class="rightNameModalList1_1">
							<div class="rightNameModalList1_1L">판매상품</div>
							<div class="rightNameModalList1_1C">
								<strong style="margin-right: 8px;"><%=countProducts%></strong>
							</div>
						</div>
						<div class="rightNameModalList1_1">
							<div class="rightNameModalList1_1L">판매내역</div>
							<div class="rightNameModalList1_1C">
								<strong style="margin-right: 8px;"><%=countDealDone%></strong>
							</div>
						</div>
						<div class="rightNameModalList1_1">
							<div class="rightNameModalList1_1L">연락시간</div>
							<div class="rightNameModalList1_1C">
								<strong style="margin-right: 8px;">24시간 연락가능</strong>
							</div>
							<div class="rightNameModalList1_1R"></div>
						</div>
					</div>
					<div id="rightNameModalButtonCt">
						<div id="rightNameModalButtonL">
							사기신고조회
						</div>
						<div id="rightNameModalButtonR">
							상점바로가기
						</div>
					</div>
				</div>
				
				<!-- 번개톡 우측상단 아이콘 선택시 모달창 (알림끄기, 신고, 신고조회, 차단, 나가기) -->
				<div class="rightName3DotIconModalBg"></div>
				<div class="rightName3DotIconModal1">
					<div class="rightName3DotIconModal2">
						<div class="rightName3DotIconsCt notYet">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><path fill="#C3C2CC" fill-rule="evenodd" d="M11 2a7.5 7.5 0 0 1 7.5 7.5l-.001 4.596L20 15.333v1.819l-6.3-.001v.634a2.7 2.7 0 0 1-5.4 0v-.634H2v-1.818l1.499-1.188L3.5 9.5A7.5 7.5 0 0 1 11 2z"></path></svg>
							<div class="rightName3DotIconFont">알림 켜기</div>
						</div>
						<div class="rightName3DotIconsCt goInquiry">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><path fill="#C3C2CC" fill-rule="evenodd" d="M12.303 6c1.655 0 3.071 1.209 3.367 2.874L17.262 17h.271c.809 0 1.467.673 1.467 1.5v2c0 .276-.219.5-.489.5H3.49A.495.495 0 0 1 3 20.5v-2c0-.827.658-1.5 1.467-1.5h.32L6.38 8.876C6.675 7.209 8.091 6 9.747 6zm4.664-4.541a1 1 0 0 1 .366 1.366l-1 1.732a1 1 0 1 1-1.732-1l1-1.732a1 1 0 0 1 1.366-.366zM5 1.459a1 1 0 0 1 1.366.366l1 1.732a1 1 0 0 1-1.732 1l-1-1.732A1 1 0 0 1 5 1.459zM11 0a1 1 0 0 1 1 1v2a1 1 0 1 1-2 0V1a1 1 0 0 1 1-1z"></path></svg>
							<div class="rightName3DotIconFont">신고</div>
						</div>
						<div class="rightName3DotIconsCt">
							<a href='ReportHistroyInquiry.jsp' target='_blank'>
								<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g fill="none" fill-rule="evenodd"><rect width="18" height="20" x="2" y="1" fill="#C3C2CC" rx="2"></rect><rect width="12" height="2" x="5" y="5" fill="#FFF" rx="1"></rect><rect width="12" height="2" x="5" y="10" fill="#FFF" rx="1"></rect><path fill="#FFF" d="M6 15h6a1 1 0 0 1 0 2H6a1 1 0 0 1 0-2z"></path></g></svg>
								<div class="rightName3DotIconFont">신고조회</div>
							</a>
						</div>
						<div class="rightName3DotIconsCt notYet">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g fill="none" fill-rule="evenodd" transform="translate(1 1)"><circle cx="10" cy="10" r="8.5" stroke="#C3C2CC" stroke-width="3"></circle><path fill="#C3C2CC" d="M15.05 3.405l2.021 2.02L4.95 17.547l-2.02-2.02z"></path></g></svg>
							<div class="rightName3DotIconFont">차단</div>
						</div>
						<div class="rightName3DotIconsCt notYet">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g fill="none" fill-rule="evenodd"><rect width="18" height="20" x="2" y="1" fill="#C3C2CC" rx="2"></rect><path fill="#FFF" d="M10.119 5.265a1 1 0 0 1 .055.056l4.43 4.79a1.019 1.019 0 0 1 .074.072l.132.144a1 1 0 0 1 0 1.357l-4.616 4.995a1 1 0 0 1-1.469 0l-.133-.144a1 1 0 0 1 0-1.357l2.938-3.18L2 12V9.712h9.243l-2.67-2.89a1 1 0 0 1 0-1.357l.132-.144a1 1 0 0 1 1.414-.056z"></path></g></svg>
							<div class="rightName3DotIconFont">나가기</div>
						</div>
					</div>
				</div>
				
				<div class="rightInfoCt2" onclick="plus_icon_close()">
					<div class="rightInfoCt2_1">
						<br/>
						
						<!-- 채팅창 -->
						<%
							java.util.Date today = new java.util.Date();
							SimpleDateFormat sdfDB = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");
							String prevStrDateChat = "";	
							for(RealTimeChatDto dto : listRealTimeChat) {
								SimpleDateFormat sdfDiv = new SimpleDateFormat("yyyy. MM. dd. E요일");
								java.util.Date dateChat = sdfDB.parse(dto.getSayTime());
								String strDateChat = sdfDiv.format(dateChat);
								
								if(!strDateChat.equals(prevStrDateChat)) {
						%>
									<!-- 채팅이 적힌 날짜 -->
									<p class="rightInfoCtDate">
										<span class="rightInfoCtLine"></span>
										<span class="rightInfoCtDateFont"><%=strDateChat %></span>
										<span class="rightInfoCtLine"></span>
									</p>
						<%	
								}
								prevStrDateChat = strDateChat;
								
								SimpleDateFormat sdfAmPm = new SimpleDateFormat("a");
								String strAmPm = sdfAmPm.format(dateChat);
								SimpleDateFormat sdfKK = new SimpleDateFormat("KK");
								String strHour = sdfKK.format(dateChat);
								if("00".equals(strHour))
									strHour = "12";
								SimpleDateFormat sdfMM = new SimpleDateFormat("mm");
								String strMinute = sdfMM.format(dateChat);
								String strTimeChat = strAmPm + " " + strHour + ":" + strMinute;
								
						
								if("/;/구매자의_거래요청/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 구매자의 택배거래 요청 -->
										<div class="fr deliveryDealSendFromConsumerCt chatDivCt" rnoSendDeliveryFromConsumer="<%=dto.getRno()%>">
											<div class="fr infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>판매자에게 택배거래를 <br/>요청했습니다</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청확인</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 구매자에게 택배거래 요청받음-->
										<div class="deliveryDealGetFromConsumerCt chatDivCt" rnoGetDeliveryFromConsumer="<%=dto.getRno()%>">
											<div class="infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>구매자에게 택배거래를<br/>요청받았습니다</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청확인</button>
											</div>
											<div style="clear: both"></div>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%		
									}			
								
								} else if("/;/판매자의_거래요청/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 판매자의 택배거래  요청 -->
										<div class="fr deliveryDealSendFromSellerCt chatDivCt" rnoSendDeliveryFromSeller="<%=dto.getRno()%>">
											<div class="fr infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>구매자에게 택배거래를<br/>요청했습니다</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청확인</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
											<p style="clear: both"></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 판매자에게 택배거래 요청받음-->
										<div class="deliveryDealGetFromSellerCt chatDivCt" rnoGetDeliveryFromSeller="<%=dto.getRno()%>">
											<div class="infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>판매자에게 택배거래를<br/>요청받았습니다</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청확인</button>
											</div>
											<div style="clear: both"></div>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
											<p style="clear: both"></p>
										</div>
										<div style="clear: both"></div>
						<%		
									}			
								} else if("/;/택배거래완료/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 택배거래 완료 보냄 -->
										<div class="fr deliveryDealDoneCt chatDivCt" rnoDealDone="<%=dto.getRno()%>">
											<div class="fr infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>택배거래완료</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 택배거래 완료 받음-->
										<div class="deliveryDealDoneCt chatDivCt" rnoDealDone="<%=dto.getRno()%>">
											<div class="infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>택배거래완료</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%		
									}				
								} else if("/;/직거래요청/;/".equals(dto.getSay())) {	
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 직거래 요청 보냄 -->
										<div class="fr sendDirectDealCt chatDivCt" rnoDirectDealSend="<%=dto.getRno()%>">
											<div class="fr infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>직거래를 요청하였습니다.</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청보기</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 직거래 요청 받음 -->
										<div class="sendDirectDealCheckCt chatDivCt" rnoDirectDealCheck="<%=dto.getRno()%>">
											<div class="infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>직거래 요청을 받았습니다.</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래요청보기</button>
											</div>
											<div style="clear: both"></div>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%		
									}				
								} else if("/;/직거래완료/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 직거래 완료 보냄 -->
										<div class="fr directDealDoneCt chatDivCt" rnoDirectDealDone="<%=dto.getRno()%>">
											<div class="infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>직거래완료</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">직거래확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 직거래 완료 받음 -->
										<div class="directDealDoneCt chatDivCt" rnoDirectDealDone="<%=dto.getRno()%>">
											<div class="infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>직거래완료</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">직거래확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
										
						<%		
									}				
								} else if("/;/거래취소/;/".equals(dto.getSay())) {	
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 거래취소 보냄 -->
										<div class="fr dealCancelCt chatDivCt" rnoDealCancel="<%=dto.getRno()%>">
											<div class="fr infoChatSend">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>거래가 취소되었습니다.</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래취소확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 거래취소 받음 -->
										<div class="dealCancelCt chatDivCt" rnoDealCancel="<%=dto.getRno()%>">
											<div class="fl infoChatReceive">
												<div class="font2_1">
													<span style="padding-left: 8px;"><strong>거래가 취소되었습니다.</strong></span>
													<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FFF"" xlink:href="#a"></use><g mask="url(#b)" fill="#FF5058"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
												</div>
												<button class="infoChatCheckButton">거래취소확인하기</button>
											</div>
											<div style="clear: both"></div>
											<p class="fl rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear: both"></div>
						<%										
									}
								} else if("/;/상품상세보기/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
									// 오른쪽
						%>		
									<!-- 채팅이 시작될때 보내는 상품정보화면 --> 
									<div class="fr chatProductInfoCt chatDivCt">
										<div class="fr infoChatSend">
											<div class="font2_1">
												<span style="padding-left: 8px;"><strong><%=productname %></strong></span>
												<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
											</div>
											<img style="width:100px; height: 100px;" src = "images/<%=imagename %>"/><br/>
											<span><%=price %></span><span>원</span>
											<p style="clear: both"></p>
											<button class="infoChatCheckButton productDetailCheck">상품상세보기</button>
										</div>
										<div style="clear: both"></div>
										<p class="fr rightInfoCtTime"><%=strTimeChat %></p>  <%-- <%=strTimeChat %> --%>
									</div>
									<div style="clear: both"></div>
						<%
									} else { // 왼쪽
						%>
									<!-- 채팅이 시작될때 받는 상품정보화면 --> 
									<div class="chatProductInfoCt chatDivCt">
										<div class="infoChatSend">
											<div class="font2_1">
												<span style="padding-left: 8px;"><strong><%=productname %></strong></span>
												<svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><circle id="a" cx="16" cy="16" r="16"></circle></defs><g fill="none" fill-rule="evenodd"><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#FF5058" xlink:href="#a"></use><g mask="url(#b)" fill="#FFF"><path d="M22.982 19.346a8.411 8.411 0 0 0 .934-3.845c0-4.64-3.776-8.416-8.416-8.416-4.64 0-8.415 3.776-8.415 8.416 0 4.64 3.775 8.415 8.415 8.415a8.415 8.415 0 0 0 3.846-.934l3.618.91a.766.766 0 0 0 .928-.93l-.91-3.616z"></path></g></g></svg>
											</div>
											<img style="width:100px; height: 100px;" src = "images/<%=imagename %>"/><br/>
											<span><%=price %></span><span>원</span>
											<p style="clear: both"></p>
											<button class="infoChatCheckButton productDetailCheck">상품상세보기</button>
										</div>
										<div style="clear: both"></div>
										<p class="rightInfoCtTime"><%=strTimeChat %></p>  <%-- <%=strTimeChat %> --%>
									</div>
									<div style="clear: both"></div>
						<%										
									}
								} else if("/;/사진업로드/;/".equals(dto.getSay())) {
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
									// 오른쪽
						%>		
									<!-- 사진업로드하기 --> 
									<div class="fr uploadSendCt">
										<div class="infoPhotoUpload">
											<img style="width:100%; height: 250px; border-radius: 1rem;" src = "upload/<%=dto.getImageUrl()%>"/><br/>
											<p style="clear: both"></p>
										</div>
										<div style="clear: both"></div>
										<p class="fr rightInfoCtTime"><%=strTimeChat %></p>  <%-- <%=strTimeChat %> --%>
										<p style="clear: both"></p>
									</div>
									<div style="clear: both"></div>
						<%
									} else { // 왼쪽
						%>
									<!-- 업로드된 사진보기--> 
									<div class="uploadSendCt">
										<div class="infoGetPhoto">
											<img style="width:100%; height: 250px; border-radius: 1rem;" src = "upload/<%=dto.getImageUrl()%>"/><br/>
											<p style="clear: both"></p>
										</div>
										<div style="clear: both"></div>
										<p class="rightInfoCtTime"><%=strTimeChat %></p>  <%-- <%=strTimeChat %> --%>
										<p style="clear: both"></p>
									</div>
									<div style="clear: both"></div>
						<%				
									}
								} else {   // 채팅
									if(dto.getSayNicknameFk().equals(NICKNAME_PK)) {
										// 오른쪽
						%>
										<!-- 보낸채팅 -->
										<div class="chatSendCt">
											<p class="fr chatInputBoxSend"><%=dto.getSay() %></p>
											<div style="clear: both"></div>
											<p class="fr rightInfoCtTime"><%=strTimeChat %></p>
											<div style="clear: both"></div>
										</div>
										<div style="clear:both;"></div>
						<%
									} else {
										// 왼쪽
						%>
										<!-- 받은채팅 -->
										<div class="chatReceiveCt">
											<p class="chatInputBoxReceive"><%=dto.getSay() %></p>
											<p class="rightInfoCtTime"><%=strTimeChat %></p>
										</div>
										<div style="clear:both;"></div>
						<%									
									}
								}
						%>
						<%
							}
						%>
					</div>
				</div>

				<div class="chatInputCt1">
					<div>
						<div class="chatInputCt2">
								<%
								if(category1=="") {
								%>
									<div class="chatInputCt2_2">상대방을 배려하는 마음으로 대화를 나눠주세요</div>
								<%
									
								} else {
								%>
									<div style="border-right: 1px solid rgb(220, 219, 228);" class="chatInputCt2_1" id="addressSendButton"><button>택배거래요청</button></div>
									<div class="chatInputCt2_1" id="directDealSendButton"><button>직거래요청</button></div>
								<%
								}
							%>
						</div>
						
						<!-- 채팅 입력창 -->  
						<%
							if(rnO==0) {
						%>
							<div class="dealingInfoCt">
								<p><b>원하는 방식으로 거래를 요청해주세요</b></p>
							</div>
						<%
							} else {
						%>
							<div class="chatInputCt3" >
								<input type="hidden" name="rno" value="<%=rnO%>"/>
								<input type="hidden" name="dno" value="<%=crDao.getDnoFromRno(rnO)%>"/>
								<div class="plusIconCt" onclick="plus_icon_open()">
									<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26"><g fill="none" fill-rule="evenodd"><rect width="25" height="25" x="0.5" y="0.5" transform="rotate(0)" fill="#FF5058" stroke="#FF5058" rx="8"></rect><rect width="14" height="2" x="6" y="12" fill="#FFF" rx="1"></rect><rect width="14" height="2" x="6" y="12" fill="#FFF" rx="1" transform="rotate(90 13 13)"></rect></g></svg>
								</div>
								<div class="chatInput">
									<textarea placeholder="메시지를 입력하세요" name="chatInput" style="height: 45px;"></textarea>
									<button type="button" id="btnSend" class="imoticonCt">
										<svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M16.804 12.132a1.093 1.093 0 0 1-1.544.002l-2.17-2.162v6.696a1.093 1.093 0 1 1-2.183 0V9.974l-2.166 2.16A1.093 1.093 0 0 1 7.2 10.588l3.95-3.938c.111-.137.254-.247.423-.316.404-.17.874-.089 1.188.223l4.041 4.03c.427.426.428 1.117.003 1.545M20.49 3.51C15.808-1.17 8.192-1.17 3.51 3.51c-4.68 4.68-4.68 12.297 0 16.98A11.977 11.977 0 0 0 12 24c3.074 0 6.148-1.17 8.49-3.51 4.68-4.682 4.68-12.298 0-16.98" fill="#D80C18" fill-rule="evenodd"></path></svg>
									</button>
								</div>
							</div>
						<%
							}
						%>
						<!-- 채팅창 +버튼 선택시 모달창  -->
						<div>
							<div id="chatModalCt1">
								<div id="chatModalCt2">
									<div>
										<div class="chatModalIconCt notYet" onclick="product_select_modal_open()">
											<img style="width: 26px; height: 26px;"src="images/product_select_icon.png"/>
										</div>
										<div class="chatModalIconFont">상품선택</div>
									</div>
									<form action="Controller?command=RealTimeChatUploadAction" method="post" enctype="multipart/form-data"> 
										<label for="input-file" class="chatModalIconCt" id="photoSelect">
											<svg width="26" height="26" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M12.897.55c.336 0 .643.187.799.484l1.057 2.035H18.1a.9.9 0 0 1 .9.9V18.1a.9.9 0 0 1-.9.9H1.9a.9.9 0 0 1-.9-.9V3.97a.9.9 0 0 1 .9-.9h3.347l1.058-2.036A.902.902 0 0 1 7.104.55h5.793zm-.546 1.8H7.65L6.592 4.385a.9.9 0 0 1-.8.484h-2.99V17.2H17.2V4.87h-2.993a.903.903 0 0 1-.8-.485L12.352 2.35zM10 6.595a4.03 4.03 0 0 1 4.025 4.026A4.03 4.03 0 0 1 10 14.646a4.03 4.03 0 0 1-4.025-4.025A4.03 4.03 0 0 1 10 6.595zm0 1.8a2.228 2.228 0 0 0-2.225 2.226c0 1.227.998 2.226 2.225 2.226a2.227 2.227 0 0 0 2.225-2.226A2.228 2.228 0 0 0 10 8.395z" fill="#7f7f7f" fill-rule="evenodd"></path></svg>
										</label> 
										<input type="file" name="file" id="input-file" style="display: none;"/>
										<input type="hidden" name="rno" value="<%=rnO%>"/>
										<input type="hidden" name="dno" value="<%=crDao.getDnoFromRno(rnO)%>"/>
										<div class="chatModalIconFont">사진선택</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<%
				for(RealTimeChatDto dto : listRealTimeChat) {
			%>
					<!-- 채팅 목록 우측 아이콘 모달창 -->
					<div class="talkListModalCt">
						<div class="talkListModalBg" onclick="m3_close()"></div>
						<div class="listModalCt">
							<div class="listModalFont2Ct">
								<div class="listModalFont notYet">대화방 알림 끄기</div>
								<div class="listModalFont notYet">차단</div>
								<div class="listModalFont goInquiry">신고</div>
								<div class="listModalFont getOutChatRoom notYet" rnoGetOutChat="<%=dto.getRno()%>">대화방 나가기</div>
							</div>
						</div>
					</div>
			<%
				}
			%>
			
			<!-- 이용약관 -->
			<div class="fl top_line" style="margin-top:10px; width:100%">	
				<div class="div1" style="margin-top:20px">
					<div style="width:1024px"> 
						<div class="fl"style="width:512px">
							<div style="font-size:14px;color:rgb(102, 102, 102)">번개장터(주) 사업자정보</div>
								<div class="JS_box6">
									대표이사 : 홍성권   |   개인정보보호책임자 : 박종선<br/>
									사업자등록번호 : 113-86-45836   |   통신판매업신고 : 2019-서울서초-1126<br/>
									호스팅서비스 제공자 : Amazon Web Services (AWS)<br/>
									EMAIL : help@bunjang.co.kr   |   FAX : 02-598-8241<br/>
									주소 : 서울특별시 서초구 서초대로38길 12, 타워1 1층, 타워2 7층 지하1층<br/>
									(서초동, 마제스타시티)<br/>
									<a>사업자정보 확인</a>
								</div>
						</div>
						<div class="fl"style="width:512px">
							<div style="font-size:14px;color:rgb(102, 102, 102)">고객센터</div>
							<div style="font-size:25px;color:rgb(102, 102, 102)">1670-2910</div>
							<div style="font-size:12px;color:rgb(127, 127, 127);">
								운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 13시 - 14시)<br/>
								<a class="link2"href="TM_NOTICE.html">공지사항</a>
								<a class="link2"href="TM_QNA.html">1:1문의하기</a>
								<a class="link2"href="TM_FAQ.html">자주 묻는 질문</a>
							</div>
						</div>
					</div>
					<div class="fl"style="width:1024px; margin-top:16px">
						<div class="fl"style="width:512px">
							<div class="JS_box6">
								<p>번개장터(주)더현대서울점   |   김동인   |   365-85-01581<br/>
								서울특별시 영등포구 여의대로 108, 지하2층(여의도동, 파크원)<br/>
								번개장터(주)코엑스점   |   이재후   |   142-85-27412<br/>
								서울특별시 강남구 영동대로 513, 쇼핑몰동 B1층 C102호(삼성동, 코엑스)<br/>
								번개장터(주)센터필드점   |   이재후   |   808-85-01905<br/>
								서울특별시 강남구 테헤란로 231, 쇼핑몰동 1층 W124호(역삼동)(역삼동, 센터필드)<br/></p>
							</div>
						</div>
						<div class="fl"style="width:512px">
							<div style="font-size:14px;color:rgb(102, 102, 102)">
								우리은행 채무지급보증 안내
							</div>
							<div style="margin-top:0.5rem;font-size:12px;color:rgb(102, 102, 102)">
								번개장터㈜는 “BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점이 판매한<br/>
								상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증 계약을 체결하여 안전거래를 보장하<br/>
								고 있습니다.<br/>
								<a>서비스 가입사실 확인</a><br/>
								Ⓒ Bungaejangter. Inc All rights reserved.
							</div>
						</div>
					</div>
					<div class="fl top_line" style="width:1024px; padding-top:16px; margin-top:40px">
						<div class="fl"style="width:1024px">
							<div class="fl"style="width:512px">
								<img class="fl" src="images/TM_ISMS.png" width="31" height="28" style="margin-right:16px">
								<div class="fl" style="font-size:11px;color:rgb(102, 102, 102)">
								<p style="margin:0">
									[인증범위] 번개장터 중고거래 플랫폼 서비스 운영(심사받지 않은 물리적 인프라 제외)<br/>
									[유효기간] 2021.05.18 ~ 2024.05.17
								</p>
								</div>
							</div>
							<div class="fl"style="width:512px">
								<div class="fl" style="font-size:11px;color:rgb(102, 102, 102)">
								<p style="margin:0">
									“BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들<br/>
									에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상<br/>
									품정보 및 거래에 대해 책임을 지지 않습니다.
								</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>	
</div>
</body>
</html>