<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bunge.dao.*" %>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.util.*" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/slick.css"/>
<script src="js/jquery-3.6.0.min.js"></script>	
<script type="text/javascript" src="js/slick.min.js"></script>
<link rel = "stylesheet" href = "css/mainheader.css"/>
<link rel="stylesheet" href="css/TM4.css"/>
<link rel="shortcut icon" href="images/favicon.ico">

<%
	String category = request.getParameter("category");
	if(category==null ) {	/* || "전체".equals(category) */
		category="분류 선택";
	}
	String order = request.getParameter("order"); 
	if(order==null) {
		order = "최신순";
	}
	/* System.out.println("category: " + category); */
%>
<%
	ProductDao pDao = new ProductDao();
	StoreDao sDao = new StoreDao();
	JjimCountDao jDao = new JjimCountDao();
	CommentDao cDao = new CommentDao();
	FollowDao fDao = new FollowDao();
	FollowerDao foDao = new FollowerDao();
	ReviewDao rDao = new ReviewDao();
	ImageDao iDao = new ImageDao();
	
	String NICKNAME_PK = null;
	
	if(request.getParameter("NICKNAME_PK")==null) {
		NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	} else {
		NICKNAME_PK = request.getParameter("NICKNAME_PK");
	}
	sDao.getvisitsUpdate(NICKNAME_PK);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 nickname_pk : <%=NICKNAME_PK %></title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/jquery.cookie-1.4.1.min.js"></script>
	<link rel="stylesheet" href="css/TM4.css"/>
	<script>
		
		 function c1(){
			if ($('#table1').css('display')=='block') {
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
			} else if ($('#table1').css('display') == 'none') {
				$('#table1').css('display','block');
				$('#btn1').css('color','black');
				$('#btn2').css('color','#888888');
				$('#btn3').css('color','#888888');
				$('#btn4').css('color','#888888');
				$('#btn5').css('color','#888888');
				$('#btn6').css('color','#888888');
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
				$('#btn1').css('border','1px solid black');
				$('#btn1').css('border-bottom','none');
				$('#btn2').css('border','none');				
				$('#btn2').css('border-bottom','1px solid black');
				$('#btn3').css('border','none');
				$('#btn3').css('border-bottom','1px solid black');
				$('#btn4').css('border','none');
				$('#btn4').css('border-bottom','1px solid black');
				$('#btn5').css('border','none');
				$('#btn5').css('border-bottom','1px solid black');
				$('#btn6').css('border','none');
				$('#btn6').css('border-bottom','1px solid black');
			} 
		};
		function c2(){
			if ($('#table2').css('display')=='block') {
				$('#table1').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
			} else if ($('#table2').css('display') == 'none') {
				$('#table2').css('display','block');
				$('#btn1').css('color','#888888');
				$('#btn2').css('color','black');
				$('#btn3').css('color','#888888');
				$('#btn4').css('color','#888888');
				$('#btn5').css('color','#888888');
				$('#btn6').css('color','#888888');
				$('#table1').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
				$('#btn2').css('border','1px solid black');
				$('#btn2').css('border-bottom','none');
				$('#btn1').css('border','none');				
				$('#btn1').css('border-bottom','1px solid black');
				$('#btn3').css('border','none');
				$('#btn3').css('border-bottom','1px solid black');
				$('#btn4').css('border','none');
				$('#btn4').css('border-bottom','1px solid black');
				$('#btn5').css('border','none');
				$('#btn5').css('border-bottom','1px solid black');
				$('#btn6').css('border','none');
				$('#btn6').css('border-bottom','1px solid black');
			} 
		};
		function c3(){
			if ($('#table3').css('display')=='block') {
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
			} else if ($('#table3').css('display') == 'none') {
				$('#table3').css('display','block');
				$('#btn1').css('color','#888888');
				$('#btn2').css('color','#888888');
				$('#btn3').css('color','black');
				$('#btn4').css('color','#888888');
				$('#btn5').css('color','#888888');
				$('#btn6').css('color','#888888');
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
				$('#btn3').css('border','1px solid black');
				$('#btn3').css('border-bottom','none');
				$('#btn1').css('border','none');				
				$('#btn1').css('border-bottom','1px solid black');
				$('#btn2').css('border','none');
				$('#btn2').css('border-bottom','1px solid black');
				$('#btn4').css('border','none');
				$('#btn4').css('border-bottom','1px solid black');
				$('#btn5').css('border','none');
				$('#btn5').css('border-bottom','1px solid black');
				$('#btn6').css('border','none');
				$('#btn6').css('border-bottom','1px solid black');
			} 
		};
		function c4(){
			if ($('#table4').css('display')=='block') {
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
			} else if ($('#table4').css('display') == 'none') {
				$('#table4').css('display','block');
				$('#btn1').css('color','#888888');
				$('#btn2').css('color','#888888');
				$('#btn3').css('color','#888888');
				$('#btn4').css('color','black');
				$('#btn5').css('color','#888888');
				$('#btn6').css('color','#888888');
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table5').css('display','none');
				$('#table6').css('display','none');
				$('#btn4').css('border','1px solid black');
				$('#btn4').css('border-bottom','none');
				$('#btn1').css('border','none');				
				$('#btn1').css('border-bottom','1px solid black');
				$('#btn3').css('border','none');
				$('#btn3').css('border-bottom','1px solid black');
				$('#btn2').css('border','none');
				$('#btn2').css('border-bottom','1px solid black');
				$('#btn5').css('border','none');
				$('#btn5').css('border-bottom','1px solid black');
				$('#btn6').css('border','none');
				$('#btn6').css('border-bottom','1px solid black');
			} 
		};
		function c5(){
			if ($('#table5').css('display')=='block') {
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table6').css('display','none');
			} else if ($('#table5').css('display') == 'none') {
				$('#table5').css('display','block');
				$('#btn1').css('color','#888888');
				$('#btn2').css('color','#888888');
				$('#btn3').css('color','#888888');
				$('#btn4').css('color','#888888');
				$('#btn5').css('color','black');
				$('#btn6').css('color','#888888');
				$('#table1').css('display','none');
				$('#table2').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table6').css('display','none');
				$('#btn5').css('border','1px solid black');
				$('#btn5').css('border-bottom','none');
				$('#btn1').css('border','none');				
				$('#btn1').css('border-bottom','1px solid black');
				$('#btn3').css('border','none');
				$('#btn3').css('border-bottom','1px solid black');
				$('#btn4').css('border','none');
				$('#btn4').css('border-bottom','1px solid black');
				$('#btn2').css('border','none');
				$('#btn2').css('border-bottom','1px solid black');
				$('#btn6').css('border','none');
				$('#btn6').css('border-bottom','1px solid black');
			} 
		};
		function c6(){
			if ($('#table6').css('display')=='block') {
				$('#table1').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table2').css('display','none');
			} else if ($('#table6').css('display') == 'none') {
				$('#table6').css('display','block');
				$('#btn1').css('color','#888888');
				$('#btn2').css('color','#888888');
				$('#btn3').css('color','#888888');
				$('#btn4').css('color','#888888');
				$('#btn5').css('color','#888888');
				$('#btn6').css('color','black');
				$('#table1').css('display','none');
				$('#table3').css('display','none');
				$('#table4').css('display','none');
				$('#table5').css('display','none');
				$('#table2').css('display','none');
				$('#btn6').css('border','1px solid black');
				$('#btn6').css('border-bottom','none');
				$('#btn1').css('border','none');				
				$('#btn1').css('border-bottom','1px solid black');
				$('#btn3').css('border','none');
				$('#btn3').css('border-bottom','1px solid black');
				$('#btn4').css('border','none');
				$('#btn4').css('border-bottom','1px solid black');
				$('#btn5').css('border','none');
				$('#btn5').css('border-bottom','1px solid black');
				$('#btn2').css('border','none');
				$('#btn2').css('border-bottom','1px solid black');
			} 
		}
		
/* 	    function showRecentlyProducts() {
	    	var arrPN = new Array();
	    	var arrImg = new Array();
			//var pno = $(this).parent().parent().attr("pno");
			arrPN[0]=1;
			arrPN[1]=2;
			arrPN[2]=3;
			arrImg[0]='rb_min.png';
			arrImg[1]='born_min.png';
			arrImg[2]='bin_min.png';
			//alert(arrPN.length + " / " + arrImg.length);
			
			$(".JS_img").each(function(index, item) {
				$(item).find("img").attr('src', 'images/'+arrImg[index]);					
			});
	    	//alert(arrPN);
	    	//arr.push(pno);
	    }
 */
	    
		$(function() {
			/* showRecentlyProducts(); */			
			
			/*top버튼*/
			$('#btn7').click(function(){
				var offset = $('#TOP').offset();
			$('html').animate({scrollTop : offset.top}, 10);
			});

		/* 	/*로그인, 로그아웃, 회원가입
			$('#login').click(function(){
				location.href="Controller?command=GoLogin";/* TM_LOGIN.jsp 
			})
			$('#logout').click(function(){
				location.href="Controller?command=GoLogout";/* TM_LOGOUT_ACTION.jsp 
			})
			$('#register').click(function(){
				location.href="Controller";/* TM_REGISTER.jsp 
			}) */

			/*내 상점*/
		/* 	$('.mp1').mouseenter(function(){
				$('.mp2').css('display','block');
			})
			$('.mp2').mouseleave(function(){
				$('.mp2').css('display','none');
			});
			$('.mp').mouseleave(function(){
				$('.mp2').css('display','none');
			});
			$('#go4').click(function(){
				location.href="Controller?command=GoCenter";
			})
			$('#go1').click(function(){
				location.href="Controller?command=GoTM4";
			})
			$('#go2').click(function(){
				location.href="Controller?command=GoTM4";
			})
			$('#go3').click(function(){
				location.href="Controller?command=GoSetting";/* TM_SETTINGS.jsp 
			})

			$('.alarm1').mouseenter(function(){
				$('.alarm2').css('display','block');
			})
			$('.alarm1').mouseleave(function(){
				$('.alarm2').css('display','none');
			}); */
			
			$("#sel_cat").change(function() {
				//alert(this.value);
				location.href = "Controller?command=GoTM4&category=" + this.value;
			});
			
			$(".box12-1").click(function() {	
				var selected = $(this).text();
				var url = "TM4.jsp?order="+selected;
				if('<%=category%>'!='') {
					url += "&category=<%=category%>";
				}
				location.href = url;	
			});
			$('.button').click(function(){
				$('.box6').css('display','none');
				$('.box7').css('display','none');
				$('.box6-1').css('display','block');
			})
			$('.buttonsize').click(function(){
				$('.box6').css('display','block');
				$('.box7').css('display','block');
				$('.box6-1').css('display','none');
			})
			$('.buttonsize').click(function(){
				var writing = $(this).parent().find(".textarea2").val();	//find : 자손들 중에서 bno인 애들을 찾는다
				//alert("writing:"+writing);
				//alert(bno + "번 게시글을 클릭했습니다.");
				
				//Angular, React, Vue 프레임 워크
				$.ajax({
					type:'post',
					url: 'WriteServlet',
					data: {"writing":writing,"nickname":"<%=NICKNAME_PK%>"},	//제이슨 데이터: 값을 여러개 담을 수 있고 값의 이름을 일일이 정해줄 수 있다
					datatype: "json",
					success : function(data) {
//						alert("응답받음");
						$(".box6 > p").text(writing);
//						alert("서버로부터 받음! data.result=1이면 성공 ---> "+data.result);
					},
					error: function(r,s,e){
						alert("에러!");
					}
				});
			})
			$('.btn3').click(function(){
				var content = $(this).parents().find(".textarea").val();
				var nickname="<%=NICKNAME_PK%>";
				//var bno =$(this).parents().attr("bno");
				//alert("bno : " + bno);
				$.ajax({
					type:'post',
					url: 'CommentServlet',
					data:{"content":content,"nickname":"<%=NICKNAME_PK%>"},
					datatype:"json",
					success : function(data){
						//prepend append 공부하기
						//$('#nick').append(nickname); 
						//alert("응답받음");
						$('#cnt').text(data.cnt);
						var str = '<div class="JS_box7" bno="'+data.bno+'">' 
						+'<div class="JS_box7-1" id="find">'
						+	'<div class="fl">'			
						+		'<img src="images/TM_PROFILE.svg" width="48" height="48">'
						+	'</div>'
						+	'<div class="fl JSFont14" id="nick">'
						+		'<span>'+nickname+'</span>'
						+	'</div>'
						+	'<div class="fl JScontent" id="name">'
						+		'<span>'+content+'</span>'
						+	'</div>'
						+	'<div class="fl delete">'
						+		'<img class="deleteimg" src="images/delete.png"> 삭제하기'
						+	'</div>'
						+'</div>'
						+'</div>'
						
						$('#respone').append(str);
						$('.textarea').val('');
						},
						error: function(r,s,e){
							alert("에러");
						}
				})
			});
			//$('.delete').click(function(){
			$(document).on('click', '.delete', function() {
				var bno = $(this).parent().parent().attr("bno");
				
				//alert("bno: "+ bno);
				
				$.ajax({
					type:'post',
					url:'DeleteServlet',
					data:{"bno":bno},
					datatype:"json",
					success : function(data){
						//alert("삭제되었습니다");
						location.href="Controller?command=GoTM4";
						//$(".JS_box7").remove();
						//$('.JS_box7').empty();
						
						},
						error: function(r,s,e){
							alert("에러");
					}
				});
			});
			$('.unfollow').click(function(){
				var nickname_opponet = $(this).parent().parent().attr("nickname_opponet");
				//alert(nickname_opponet);
				
				$.ajax({
					type:'post',
					url:'DeleteFollowServlet',
					data:{"nickname_opponet":nickname_opponet},
					datatype:"json",
					success: function(data){
						location.href="Controller?command=GoTM4";/* TM4.jsp */
					},
					error:function(r,s,e){
						alert("error");
					}
				});
			});
		    $('#ta').on('keyup', function() {
		        $('#reCount').html(""+$(this).val().length+" / 100");
		 
		         if($(this).val().length > 100) {
		            $(this).val($(this).val().substring(0, 100));
		            $('#reCount').html("100 / 100");
		          }
		    });
		    $('.pnofinder').click(function(){
		    	var pno = $(this).parent().parent().attr("pno");
		    	location.href="Controller?command=GoProduct&productnumber_pk="+pno;
		    })
		});
	</script>
</head>
<body>
<div id = "header">
	<%@ include file="mainheader.jspf" %>
	<%@ include file="mainfloating.jspf" %>	<!-- 플로팅 네비게이터 -->
	<div class="div1 margin2">
		<div class="box fl">
			<div class="font2"> <!-- TM_PROFILE.svg -->
				<img src="images/<%=iDao.getImageName(NICKNAME_PK)%>"style="margin-top:50px;width:150px;height:150px">
					<p><%=NICKNAME_PK%></p>
					<div class="box2"style="margin-left:88px">
						<!-- <form action = "서블릿파일.java" class="basicinfomation" enctype="multipart/form-data" method = "post"> -->
							<a href="Controller?command=GoManagement" class="link1">내상품 관리</a>
							<!-- <input type="file"id="imageinput" name="image"style="height:200px" accept="image/jpg, image/jpeg, image/png" multiple> -->
						<!-- </form> -->
					</div>
			</div>
		</div>
		<div class="box3 fl bottom_line right_line top_line">
			<div class="box4">
				<div class="font3 fl">
					<b><%=NICKNAME_PK%></b>
				</div>
				<!-- <button class="fl button">상점명 수정</button> -->
			</div>
			<div class="box5"> 
				<img src="images/opening.png" width="14" height="13"> 상점오픈일 <span
					style="color: black"><%=sDao.getOpeningDay(NICKNAME_PK)%> 일 전</span> <img src="images/VISIT.png"
					width="14" height="13" style="margin-left: 15px"> 상점방문수 <span
					style="color: black"><%=sDao.getVisits(NICKNAME_PK)%></span> <img src="images/SELL.png"
					width="14" height="13" style="margin-left: 15px"> 상품판매 <span
					style="color: black"><%=sDao.getSell(NICKNAME_PK)%></span> <img src="images/DELIVERY.png"
					width="14" height="13" style="margin-left: 15px"> 택배발송 <span
					style="color: black"><%=sDao.getDelivery(NICKNAME_PK)%></span>
			</div>
			<div class="box6">
				<p><%=sDao.getWriting(NICKNAME_PK)%></p>
			</div>
			<div class="box6-1 hidden">
				<textarea class="textarea2 fl"></textarea>
				<button class="buttonsize fl">확인</button>
			</div>
			<div class="box7">
				<button class="button">소개글 수정</button>
			</div>
		</div>
		<div class="fl">
			<a id="btn1" class="box8 fl none"onclick="c1()">상품</a>
			<a id="btn2" class="box9 fl none"onclick="c2()">상점문의</a>
			<a id="btn3" class="box9 fl none"onclick="c3()">찜</a>
			<a id="btn4" class="box9 fl none"onclick="c4()">상점후기</a>
			<a id="btn5" class="box9 fl none"onclick="c5()">팔로잉</a>
			<a id="btn6" class="box9 fl none"onclick="c6()">팔로워</a>
		</div>
		<div class="fl" id="table1">
			<!-- 상품 -->
			<div class="box10 bottom_line fl">
				<div class="fl">
					상품 <span style="color: rgb(247, 47, 51);"><%=pDao.getProductCnt(category, NICKNAME_PK) %></span>
				</div>
				<div class="fr box11">
					<div>
						<select id="sel_cat" class="font4">
							<option><%=category%></option>
							<option value="전체">전체</option>
							<option value="남성의류">남성의류</option>
						</select>
					</div>
				</div>
			</div>
			<div class="fl" style="width: 1024px">
				<div class="fl box12" style="font-size: 16px;">
					전체<span style="color: rgb(136, 136, 136); margin-left: 15px;"><%=pDao.getProductCnt(category, NICKNAME_PK) %>개</span>
				</div>
				<div class="fr box12" style="font-size: 13px">
					<a class="box12-1"id="red">최신순</a> <a class="box12-1"id="red2">인기순</a> <a
						class="box12-1"id="red3">저가순</a> <a class="box12-1"id="red4">고가순</a>
				</div>
			</div>
			<div class="fl" style="width: 1024px">
			<%
			//sql = "select NICKNAME_FK, IMAGENAME, PRODUCTNAME, PRICE, TRADING_AREA from product WHERE NICKNAME_FK=?";
			// 카테고리 있는 경우 : select * from product where NICKNAME_FK=? and category like '%' || (select identification_value from category where product_name=?) || '%' order by registration_date desc;
			// 물음표#1 에 로그인식별값, 물음표#2 에 카테고리(ex. 남성의류) 
			// 카테고리 없는 경우(전체선택) : select * from product where NICKNAME_FK=? order by registration_date desc;
			// 물음표#1 에 로그인식별값.
				
				ArrayList<ProductViewDto> listProduct = pDao.getProductListOrdered(category, NICKNAME_PK, order);  
				for(ProductViewDto dto : listProduct) {	
					String date1 = dto.getRegistrationDate();
					date1 = date1.substring(0,10).replace("-","/");
			%>
				<div class="box13 fl" pno="<%=dto.getProductNumber()%>">
					<div class="fl width">
						<div class="pnofinder" style="width:100%; height:194px">
							<img src="images/<%=dto.getImageName()%>"style="width:195.99px;heigth:193.99">
						</div>
					</div>
					<div class="box13-1 fl">
						<div style="font-size:14px;height:40px;padding-bottom:20px"><%=dto.getProductName()%></div>
						<div class="fl" style="width: 170px">
							<div class="fl" style="font-size: 16px; color: #212121"><%=dto.getPrice()%>원</div>
							<div class="fr" style="font-size: 12px; color: #888888"><%=CommonUtil.makeStringDateDifference(date1, null) %></div>
						</div>
					</div>
					<div class="fl box13-2">
						<div class="fl margin13-2">
							<img src="images/위치.png"width="15"height="17"><span style="margin-left:10px"><%=dto.getTradingArea()%></span>
						</div>
					</div>
				</div>
			<%
				}
			%>
				<div class="fl JS_margin"></div>
			</div>
		</div>
		<div class="fl hidden" id="table2">
			<!-- 상점문의 -->
			<div class="box10 bottom_line fl">
				<div class="fl">
					상점문의<span id="cnt"style="color: rgb(247, 47, 51);"><%=cDao.getCommentCount(NICKNAME_PK)%></span>
				</div>
			</div>
			<div class="fl" style="border: 1px solid rgb(238, 238, 238);; width: 1024px; height: 131px">
				<div style="padding: 20px; width: 96%; height: 28%;">
					<textarea id="ta"name="ta" class="textarea"></textarea>
				</div>
				<div class="fl top_line" style="width: 1024px">
					<div class="JS_box5">
						<div class="fl" id="reCount">0 / 100</div>
						<button class="fr btn3">
							<img src="images/TM_PEN.png" width="15" height="16">등록
						</button>
					</div>
				</div>
			</div>
			<div id="respone">
				<%
					ArrayList<CommentDto> listComment = cDao.getCommentLiST(NICKNAME_PK);  
					for(CommentDto dto : listComment) {	
				%>
				<div class="JS_box7" bno="<%=dto.getBno()%>">	<!-- 댓글 -->
					<div class="JS_box7-1"id="find">
						<div class="fl">			
							<img src="images/TM_PROFILE.svg"width="48"height="48">
						</div>
						<div class="fl JSFont14"id="nick">
							<%=dto.getNicknameFk()%>
						</div>
						<div class="fl JScontent"id="name">
							<%=dto.getContent()%>
						</div>
						<div class="fl delete">
							<img class="deleteimg"src="images/delete.png"/> 삭제하기
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>	
		<div class="fl hidden" id="table3">
			<!-- 찜 -->
			<div class="box10 bottom_line fl">
				<div class="fl">
					찜<span style="color: rgb(247, 47, 51);"><%=jDao.getJjimcount(NICKNAME_PK)%></span>
				</div>
			</div>
				<div style="width: 1024px">
					<div class="fr box12" style="font-size: 13px">
						<a class="box12-1">최신순</a> <a class="box12-1">인기순</a> <a
							class="box12-1">저가순</a> <a class="box12-1">고가순</a>
					</div>
				</div>
				<div style="clear:both;"></div>
				<div style="width: 1024px">
				<%
					ArrayList<ProductViewDto> listJjim = pDao.getProductJjimList(NICKNAME_PK);
					for(ProductViewDto dto : listJjim) {			
						String date1 = dto.getRegistrationDate();
						date1 = date1.substring(0,10).replace("-","/");
						//System.out.println(date1);
				%>
					<div class="fl top_line right_line bottom_line" pno="<%=dto.getProductNumber() %>" style="width: 501px; margin-bottom: 20px">
						<div class="fl">
							<img src="images/<%=dto.getImageName()%>" width="139" height="138">
						</div>
						<div class="fl bottom_line" style="padding: 0 20px 0 20px">
							<p style="font-size: 14px">
								<%=dto.getProductName() %><br /> <%=dto.getPrice()%>원<br /> 
								<%=CommonUtil.makeStringDateDifference(date1, null) %>
							</p>
						</div>
						<div class="fl middle" style="width: 360px; height: 49px">
							<div class="fl font1" style="padding-left: 20px;">
								<img src="images/위치.png" width="15" height="17"
									style="margin-right: 5px;"><%=dto.getTradingArea() %>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				<%						
					}
				%>
				</div>
		</div>
		<div class="fl hidden"id="table4">
			<!-- 상점후기 -->
		<div class="box10 bottom_line fl">
			<div class="fl">
				상점후기<span style="color: rgb(247, 47, 51);"><%=rDao.getReviewCount(NICKNAME_PK)%></span>
			</div>
		</div>
			<%
				ArrayList<ReviewDto> ReviewList = rDao.getReviewList(NICKNAME_PK);
				for(ReviewDto dto : ReviewList){
			%>
			<div class="fl" style="width: 1024px">
				<div class="fl">
					<img src="images/TM_PROFILE.svg" width="75px" height="75px"style="padding: 20px">
				</div>
				<div class="fl" style="margin-top: 8px">
					<P style="font-size:14px;color:#888888"><%=dto.getWriting()%><br/></P>
					<p style="font-size:14px"><%=dto.getNickname_opponent()%></p>	<!-- 화면에 닉네임과 내용이 반대로 나와서 반대로 작성함 -->
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="fl hidden"id="table5">	<!-- 팔로잉 -->
			<div class="box10 bottom_line fl">
				<div class="fl">
					팔로잉<span style="color: rgb(247, 47, 51)"><%=fDao.getFollowCount(NICKNAME_PK)%></span> 
				</div>
			</div>
			<%
				ArrayList<FollowDto> Followlist = fDao.getFollowList(NICKNAME_PK);  
				for(FollowDto dto : Followlist) {	
			%>
			<div class="fl bottom_line"style="width:1024px" nickname_opponet="<%=dto.getNickname_opponet()%>">
				<div class="fl tc"style="width:254px;height:254px;">
					<div class="fl"style="width:254px">
						<img src=images/TM_PROFILE.svg width="60"height="60"style="margin-top:40px">
					</div>
					<div class="fl"style="width:254px">
						<a class="font14" style="margin-bottom:10px"><%=dto.getNickname_opponet()%></a>
					</div>
					<div class="fl"style="width:254px;margin-left:20px">
						<div class="fl font12 tr"style="width:108px;">
							<div class="fr"style="border-right:1px solid black;padding-right:10px">상품<%=dto.getGoodsQty()%></div>
						</div>
						<div class="fl font12 tl" style="width:100px;padding-left:10px">팔로워<%=dto.getFollowing()%></div>
					</div>
					<button class="unfollow"style="border:1px solid red;font-size:12;background:white;width:150px;height:40px; margin-top:10px;text-align: center;">
						<img src=images/TM_FOLLOW.png width="21"height="14">팔로잉
					</button>
					<button class="hidden follow" style="border:1px solid rgb(238,238,238);font-size:12;background:white;width:150px;height:40px; margin-top:10px">
						<img src=images/follow.png width="21"height="14">팔로우
					</button>
				</div>
				<div class="fl"style="margin:20px 0 0 20px;width:190px;height:190px">
					<img style="width:150px;" src="images/<%=fDao.getImageNameByPno(dto.getArrProductNumber()[0])%>"/>
				</div>
				<div class="fl"style="margin:20px 0 0 20px;width:190px;height:190px">
					<img style="width:150px;" src="images/<%=fDao.getImageNameByPno(dto.getArrProductNumber()[1])%>"/>
				</div>
				<div class="fl"style="margin:20px 0 0 20px;width:190px;height:190px">
					<img style="width:150px;" src="images/<%=fDao.getImageNameByPno(dto.getArrProductNumber()[2])%>"/>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="fl hidden"id="table6">	<!-- 팔로워 -->
			<div class="box10 bottom_line fl">
				<div class="fl">
					팔로워<span style="color: rgb(247, 47, 51);"><%=foDao.getFollowerCount(NICKNAME_PK)%></span>
				</div>
			</div>
			<div class="fl" style="width:1024px">
				<%
					ArrayList<FollowerDto> FollowerList = foDao.getFollowerList(NICKNAME_PK);  
					for(FollowerDto dto : FollowerList) {
				%>
				<div class="fl"style="width:341px;height:387px;">
					<div class="fl tc"style="padding:60px 0;width:341px;height:288px;">
						<div class="fl"style="width:341px;height:140px;">
							<img src=images/TM_PROFILE.svg width="120"height="120"style="margin-bottom:20px"><br/>
						</div>
						<div class="fl"style="width:341px;height:26px;margin-bottom:10px">
							<%=dto.getNickname_opponet()%>
						</div>
						<div class="fl"style="width:341px;height:12px;margin-bottom:10px;margin-left:70px">
							<div class="fl font12 tr"style="width:100px;">
								<div class="fr"style="border-right:1px solid black;padding-right:10px">상품<%=dto.getGoodsQty()%></div>
							</div>
							<div class="fl font12 tl" style="width:100px;padding-left:10px">팔로워<%=dto.getFollowing()%></div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="fl top_line" style="margin-top:20px; width:100%">
		<div class="div1" style="margin-top:10px; margin-bottom:10px">
			<a style="border-right:1px solid rgb(238, 238, 238); padding-right:25px; font-size:13px">회사소개</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">이용약간</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">운영정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">개인정보처리방침</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">광고운영정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">청소년보호정책</a>
			<a style="border-right:1px solid rgb(238, 238, 238); padding:0 25px; font-size:13px">위치기반서비스 이용약관</a>
		</div>
	</div>
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
</div>
	<div style="clear:both;"></div>
</body>
</html>
<%
//	pDao.close();
%>

