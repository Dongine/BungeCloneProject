<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
<%
	ProductDao pDao = new ProductDao();
	StoreDao sDao = new StoreDao();
	JjimCountDao jDao = new JjimCountDao();
	CommentDao cDao = new CommentDao();
	
%>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>
<%--
<!DOCTYPE html>
<html>
<head>
<!-- // Add the new slick-theme.css if you want the default styling -->
<!-- <link rel="stylesheet" type="text/css" href="js/slick-theme.css"/> -->
<!-- 	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
 -->
<meta charset="UTF-8">
<title>Insert title here</title>
 --%>
	<script>
		$(function() {
			/*top버튼*/
			$('#btn7').click(function(){
				var offset = $('#TOP').offset();
			$('html').animate({scrollTop : offset.top}, 10);
			});

			/*로그인, 로그아웃, 회원가입*/
			$('#login').click(function(){
				location.href="TM_LOGIN.jsp";
			})
			$('#logout').click(function(){
				location.href="TM_LOGOUT_ACTION.jsp";
			})
			$('#register').click(function(){
				location.href="TM_REGISTER.jsp";
			})

			/*내 상점*/
			$('.mp1').mouseenter(function(){
				$('.mp2').css('display','block');
			})
			$('.mp2').mouseleave(function(){
				$('.mp2').css('display','none');
			});
			$('.mp').mouseleave(function(){
				$('.mp2').css('display','none');
			});
			$('#go4').click(function(){
				location.href="TM_CENTER.html";
			})
			$('#go1').click(function(){
				location.href="TM4.jsp";
			})
			$('#go2').click(function(){
				location.href="TM4.jsp";
			})
			$('#go3').click(function(){
				location.href="TM_SETTINGS.jsp";
			})

			$('.alarm1').mouseenter(function(){
				$('.alarm2').css('display','block');
			})
			$('.alarm1').mouseleave(function(){
				$('.alarm2').css('display','none');
			});
			/*---------------------------------------------------------------------------------*/
			$("#bungetalkicon").click(function(){
				location.href = 'TalkMainScreen3.jsp';
			});
			/*-----------------------------------------------------------------------------------*/
			$(".headermainmiddlesearchbar").focus(function() {
				$(".headermainmiddlefunction").css('display','block');
				$(".headermainmiddlefunctioncast").css('display','block');
			});
			
			$(".headermainmiddlesearchbar").keyup(function() {
				$(this).attr("value", $(this).val());
			});
			
			$(".headermainmiddlefunctionbottombutton").click(function(){
				$(".headermainmiddlefunction").css('display','none');
				$(".headermainmiddlefunctioncast").css('display','none');
			});
		   
		   $("#categoributton").click(function() {		//카테고리 버튼 껏다 켰다
			   if($(".headercategoricast").css('display')=='none') {
				   $(".headercategoricast").css('display','block');
			   } else if($(".headercategoricast").css('display')=='block') {
				   $(".headercategoricast").css('display','none');
			   }
			   
		   });
		   		
		   $(".headercategori").mouseenter(function(){
			   $(".headercategoris").css("display","none");
		   }); 
		   
		    $("#l1").mouseenter(function(){
			   if($("#mwoman").css("display")=="block"){
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
			   }else if($("#mwoman").css("display")=="none"){
					  $("#mwoman").css("display","block");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  
				   }
			   });
		   $("#l2").mouseenter(function(){
			   if($("#mman").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mman").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","block");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l3").mouseenter(function(){
			   if($("#mshose").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mshose").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","block");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l4").mouseenter(function(){
			   if($("#mbag").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mbag").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","block");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l5").mouseenter(function(){
			   if($("#mwatch").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mwatch").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","block");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l6").mouseenter(function(){
			   if($("#mpassion").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mpassion").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","block");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l7").mouseenter(function(){
			   if($("#mdisital").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mdisital").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","block");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l8").mouseenter(function(){
			   if($("#msport").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#msport").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","block");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l9").mouseenter(function(){
			   if($("#mcar").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mcar").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","block");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l10").mouseenter(function(){
			   if($("#mgoods").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mgoods").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","block");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l11").mouseenter(function(){
			   if($("#mkidult").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mkidult").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","block");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l12").mouseenter(function(){
			   if($("#mart").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mart").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","block");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l13").mouseenter(function(){
			   if($("#mmusic").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mart").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mmusic").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","block");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l14").mouseenter(function(){
			   if($("#mbook").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mbook").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","block");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l15").mouseenter(function(){
			   if($("#mbeauty").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mcar").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mbeauty").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","block");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l16").mouseenter(function(){
			   if($("#minterior").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#minterior").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","block");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l17").mouseenter(function(){
			   if($("#mlife").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mlife").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","block");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l18").mouseenter(function(){
			   if($("#mbaby").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mbaby").css("display")=="none"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","block");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l19").mouseenter(function(){
			   if($("#mpet").css("display")=="block"){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mcar").css("display","none");
					  $("#metc").css("display","none");
				   }else if($("#mpet").css("display")=="none"){
					  $("#mmwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mshose").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","block");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
				   }
			   });
		   $("#l20").mouseenter(function(){
					  $("#mwoman").css("display","none");
					  $("#mman").css("display","none");
					  $("#mbag").css("display","none");
					  $("#mwatch").css("display","none");
					  $("#mpassion").css("display","none");
					  $("#mdisital").css("display","none");
					  $("#mshose").css("display","none");
					  $("#msport").css("display","none");
					  $("#mcar").css("display","none");
					  $("#mgoods").css("display","none");
					  $("#mkidult").css("display","none");
					  $("#mart").css("display","none");
					  $("#mmusic").css("display","none");
					  $("#mbook").css("display","none");
					  $("#mbeauty").css("display","none");
					  $("#minterior").css("display","none");
					  $("#mlife").css("display","none");
					  $("#mbaby").css("display","none");
					  $("#mpet").css("display","none");
					  $("#metc").css("display","none");
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
			   });
		   $("#mwoman1").mouseenter(function(){
			   if($("#swomanpadding").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanpadding").css("display")=="none"){
					  $("#swomanpadding").css("display","block");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   
		   $("#mwoman2").mouseenter(function(){
			   if($("#swomancoat").css("display")=="block"){
					  $("#swomanpadding").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomancoat").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","block");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   
		   $("#mwoman3").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   $("#mwoman4").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   $("#mwoman5").mouseenter(function(){
			   if($("#swomantshirt").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomantshirt").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","block");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman6").mouseenter(function(){
			   if($("#swomanblouse").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanblouse").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","block");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman7").mouseenter(function(){
			   if($("#swomanshirt").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanshirt").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","block");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman8").mouseenter(function(){
			   if($("#swomanpants").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanpants").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","block");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman9").mouseenter(function(){
			   if($("#swomanjeans").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanjeans").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","block");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman10").mouseenter(function(){
			   if($("#swomanshorts").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanshorts").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","block");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman11").mouseenter(function(){
			   if($("#swomanskirt").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanskirt").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","block");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman12").mouseenter(function(){
			   if($("#swomanonepiece").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanonepiece").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","block");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman13").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   $("#mwoman14").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   $("#mwoman15").mouseenter(function(){
			   if($("#swomanjacket").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanjacket").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","block");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman16").mouseenter(function(){
			   if($("#swomansuit").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomansuit").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","block");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman17").mouseenter(function(){
			   if($("#swomanvest").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomanvest").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","block");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman18").mouseenter(function(){
			   if($("#swomantraining").css("display")=="block"){
					  $("#swomancoat").css("display","none");
					  $("#swomanpadding").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }else if($("#swomantraining").css("display")=="none"){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","block");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
				   }
			   });
		   $("#mwoman19").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   $("#mwoman20").mouseenter(function(){
					  $("#swomanpadding").css("display","none");
					  $("#swomancoat").css("display","none");
					  $("#swomanmantoman").css("display","none");
					  $("#swomanhoody").css("display","none");
					  $("#swomantshirt").css("display","none");
					  $("#swomanblouse").css("display","none");
					  $("#swomanshirt").css("display","none");
					  $("#swomanpants").css("display","none");
					  $("#swomanjeans").css("display","none");
					  $("#swomanshorts").css("display","none");
					  $("#swomanskirt").css("display","none");
					  $("#swomanonepiece").css("display","none");
					  $("#swomancardigan").css("display","none");
					  $("#swomanknit").css("display","none");
					  $("#swomanjacket").css("display","none");
					  $("#swomansuit").css("display","none");
					  $("#swomanvest").css("display","none");
					  $("#swomantraining").css("display","none");
					  $("#swomanunder").css("display","none");
					  $("#swomanevent").css("display","none");
			   });
		   
		$("#mman1").mouseenter(function(){
			   if($("#smanpadding").css("display")=="block"){
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanpadding").css("display")=="none"){
					  $("#smanpadding").css("display","block");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			   });
		$("#mman2").mouseenter(function(){
			   if($("#smancoat").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smancoat").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","block");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			   }); 
		$("#mman3").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
					  
			   }); 
		$("#mman4").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
			   }); 
		$("#mman5").mouseenter(function(){
				   if($("#smantshirt").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smantshirt").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","block");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
		});
		$("#mman6").mouseenter(function(){
				   if($("#smanshirt").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanshirt").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","block");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
		});
			$("#mman7").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
			});
			$("#mman8").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
			});
			$("#mman9").mouseenter(function(){
				   if($("#smanpants").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanpants").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","block");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman10").mouseenter(function(){
				   if($("#smanjeans").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanjeans").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","block");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman11").mouseenter(function(){
				   if($("#smanshorts").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanshorts").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","block");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman12").mouseenter(function(){
				   if($("#smanjacket").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanjacket").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","block");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman13").mouseenter(function(){
				   if($("#smansuit").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smansuit").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","block");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman14").mouseenter(function(){
				   if($("#smanvest").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smanvest").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","block");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman15").mouseenter(function(){
				   if($("#smantraining").css("display")=="block"){
					  $("#smanpadding").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }else if($("#smantraining").css("display")=="none"){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","block");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
				   }
			});
			$("#mman16").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","none");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
			});
			$("#mman17").mouseenter(function(){
					  $("#smanpadding").css("display","none");
					  $("#smancoat").css("display","none");
					  $("#smanmantoman").css("display","none");
					  $("#smanhoody").css("display","none");
					  $("#smantshirt").css("display","none");
					  $("#smanshirt").css("display","block");
					  $("#smancardigan").css("display","none");
					  $("#smanknit").css("display","none");
					  $("#smanpants").css("display","none");
					  $("#smanjeans").css("display","none");
					  $("#smanshorts").css("display","none");
					  $("#smanjacket").css("display","none");
					  $("#smansuit").css("display","none");
					  $("#smanvest").css("display","none");
					  $("#smantraining").css("display","none");
					  $("#smanunder").css("display","none");
					  $("#smanevent").css("display","none");
			});
			$("#mshose1").mouseenter(function(){
				  $("#sshosesneakers").css("display","none");
				  $("#sshosemanshose").css("display","none");
				  $("#sshosewomanshose").css("display","none");
		});
		$("#mshose2").mouseenter(function(){
			if($("#sshosemanshose").css("display")=="block"){
				  $("#sshosesneakers").css("display","none");
				  $("#sshosewomanshose").css("display","none");
			   }else if($("#sshosemanshose").css("display")=="none"){
				  $("#sshosesneakers").css("display","none");
				  $("#sshosemanshose").css("display","block");
				  $("#sshosewomanshose").css("display","none");
			   }
		});
		$("#mshose3").mouseenter(function(){
			if($("#sshosewomanshose").css("display")=="block"){
				  $("#sshosesneakers").css("display","none");
				  $("#sshosemanshose").css("display","none");
			   }else if($("#sshosewomanshose").css("display")=="none"){
				  $("#sshosesneakers").css("display","none");
				  $("#sshosemanshose").css("display","none");
				  $("#sshosewomanshose").css("display","block");
			   }
		});
		$("#mbag1").mouseenter(function(){
			if($("#sbagwomanbag").css("display")=="block"){
				  $("#sbagmanbag").css("display","none");
				  $("#sbagsuitcase").css("display","none");
			   }else if($("#sbagwomanbag").css("display")=="none"){
				  $("#sbagwomanbag").css("display","block");
				  $("#sbagmanbag").css("display","none");
				  $("#sbagsuitcase").css("display","none");
			   }
		});
		$("#mbag2").mouseenter(function(){
			if($("#sbagmanbag").css("display")=="block"){
				  $("#sbagwomanbag").css("display","none");
				  $("#sbagsuitcase").css("display","none");
			   }else if($("#sbagmanbag").css("display")=="none"){
				  $("#sbagwomanbag").css("display","none");
				  $("#sbagmanbag").css("display","block");
				  $("#sbagsuitcase").css("display","none");
			   }
		});
		$("#mbag3").mouseenter(function(){
			if($("#sbagsuitcase").css("display")=="block"){
				  $("#sbagmanbag").css("display","none");
				  $("#sbagwomanbag").css("display","none");
			   }else if($("#sbagsuitcase").css("display")=="none"){
				  $("#sbagwomanbag").css("display","none");
				  $("#sbagmanbag").css("display","none");
				  $("#sbagsuitcase").css("display","block");
			   }
		});
		$("#mwatch1").mouseenter(function(){
			if($("#swatchwatch").css("display")=="block"){
				  $("#swatchjewel").css("display","none");
			   }else if($("#swatchwatch").css("display")=="none"){
				  $("#swatchwatch").css("display","block");
				  $("#swatchjewel").css("display","none");
			   }
		});
		$("#mwatch2").mouseenter(function(){
			if($("#swatchjewel").css("display")=="block"){
				  $("#swatchwatch").css("display","none");
			   }else if($("#swatchjewel").css("display")=="none"){
				  $("#swatchwatch").css("display","none");
				  $("#swatchjewel").css("display","block");
			   }
		});
		$("#mfansion1").mouseenter(function(){
			if($("#sfansionwallet").css("display")=="block"){
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionwallet").css("display")=="none"){
				  $("#sfansionwallet").css("display","block");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion2").mouseenter(function(){
			if($("#sfansionbelt").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionbelt").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","block");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion3").mouseenter(function(){
			if($("#sfansionhat").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionhat").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","block");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion4").mouseenter(function(){
			if($("#sfansionmuffler").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionmuffler").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","block");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion5").mouseenter(function(){
			if($("#sfansionscarf").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionscarf").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","block");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion6").mouseenter(function(){
			if($("#sfansionglasses").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionglasses").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","block");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion7").mouseenter(function(){
			if($("#sfansionsocks").css("display")=="block"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }else if($("#sfansionsocks").css("display")=="none"){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","block");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
			   }
		});
		$("#mfansion8").mouseenter(function(){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
		});
		$("#mfansion9").mouseenter(function(){
				  $("#sfansionwallet").css("display","none");
				  $("#sfansionbelt").css("display","none");
				  $("#sfansionhat").css("display","none");
				  $("#sfansionmuffler").css("display","none");
				  $("#sfansionscarf").css("display","none");
				  $("#sfansionglasses").css("display","none");
				  $("#sfansionsocks").css("display","none");
				  $("#sfansionumbrella").css("display","none");
				  $("#sfansionetc").css("display","none");
		});
		$("#mdisital1").mouseenter(function(){
			if($("#sdisitalmobile").css("display")=="block"){
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalmobile").css("display")=="none"){
				  $("#sdisitalmobile").css("display","block");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital2").mouseenter(function(){
			if($("#sdisitalelectronics").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalelectronics").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","block");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital3").mouseenter(function(){
			if($("#sdisitalaudio").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalaudio").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","block");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital4").mouseenter(function(){
			if($("#sdisitalpc").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalpc").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","block");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital5").mouseenter(function(){
			if($("#sdisitalgame").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalgame").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","block");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital6").mouseenter(function(){
			if($("#sdisitalcamera").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalpcparts").css("display","none");
			   }else if($("#sdisitalcamera").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","block");
				  $("#sdisitalpcparts").css("display","none");
			   }
		});
		$("#mdisital7").mouseenter(function(){
			if($("#sdisitalpcparts").css("display")=="block"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
			   }else if($("#sdisitalpcparts").css("display")=="none"){
				  $("#sdisitalmobile").css("display","none");
				  $("#sdisitalelectronics").css("display","none");
				  $("#sdisitalaudio").css("display","none");
				  $("#sdisitalpc").css("display","none");
				  $("#sdisitalgame").css("display","none");
				  $("#sdisitalcamera").css("display","none");
				  $("#sdisitalpcparts").css("display","block");
			   }
		});
		$("#msport1").mouseenter(function(){
			if($("#ssportgolf").css("display")=="block"){
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportgolf").css("display")=="none"){
				  $("#ssportgolf").css("display","block");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport2").mouseenter(function(){
			if($("#ssportcamping").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportcamping").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","block");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport3").mouseenter(function(){
			if($("#ssportfishing").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportfishing").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","block");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport4").mouseenter(function(){
			if($("#ssportsoccer").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportsoccer").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","block");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport5").mouseenter(function(){
			if($("#ssportbike").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportbike").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","block");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport6").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport7").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport8").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport9").mouseenter(function(){
			if($("#ssporthiking").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssporthiking").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","block");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport10").mouseenter(function(){
			if($("#ssporthealth").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssporthealth").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","block");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport11").mouseenter(function(){
			if($("#ssportbaseball").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportbaseball").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","block");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport12").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport13").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport14").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport15").mouseenter(function(){
			if($("#ssportbasketball").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportbasketball").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","block");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport16").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		$("#msport17").mouseenter(function(){
			if($("#ssportwinter").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportwinter").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","block");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport18").mouseenter(function(){
			if($("#ssportsummer").css("display")=="block"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportball").css("display","none");
			   }else if($("#ssportsummer").css("display")=="none"){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","block");
				  $("#ssportball").css("display","none");
			   }
		});
		$("#msport19").mouseenter(function(){
				  $("#ssportgolf").css("display","none");
				  $("#ssportcamping").css("display","none");
				  $("#ssportfishing").css("display","none");
				  $("#ssportsoccer").css("display","none");
				  $("#ssportbike").css("display","none");
				  $("#ssportskate").css("display","none");
				  $("#ssportkickboard").css("display","none");
				  $("#ssporttennis").css("display","none");
				  $("#ssporthiking").css("display","none");
				  $("#ssporthealth").css("display","none");
				  $("#ssportbaseball").css("display","none");
				  $("#ssportbowling").css("display","none");
				  $("#ssportbadminton").css("display","none");
				  $("#ssportpingpong").css("display","none");
				  $("#ssportbasketball").css("display","none");
				  $("#ssportbilliards").css("display","none");
				  $("#ssportwinter").css("display","none");
				  $("#ssportsummer").css("display","none");
				  $("#ssportball").css("display","none");
		});
		
		$(".headercategoris .headerbottomcategoril").click(function() {
			var category1 = "";
			$(".headercategorim").each(function(index, item) {
				if($(item).css('display')=='block') {
					category1 = $(item).find("div.headercategoriltitle").text().trim();
				}
			});
			var category2 = "";
			$(".headercategoris").each(function(index, item) {
				if($(item).css('display')=='block') {
					category2 = $(item).find("div.headercategoriltitle > span").text().trim();
				}
			});
			var category3 = $(this).find("button").text().replace(' ','');
			location.href = "ProductList.jsp?category1="+category1+"&category2="+category2+"&category3="+category3;
		});
		
		$(".headermainmiddlesearchbar").focus(function() {
			if($(".headermainmiddlefunction").css('display')=='none') {
				$(".headermainmiddlefunctioncast").css('display','block');
			}
			$(".headermainmiddlefunction").css('display','block');
		});
		
		$(".headermainmiddlesearchbar").keyup(function() {
			$(this).attr("value", $(this).val());
			$(".headermainmiddlefunctioncast").css('display', 'none');
			$(".heardermainmiddlefunctionmainsearchcast").css('display','block');
		});
		
		$(".headermainmiddlefunctionbottombutton").click(function(){
			$(".headermainmiddlefunction").css('display','none');
			$(".headermainmiddlefunctioncast").css('display','none');
		});
		
        $('.registerrightproductnamelefttextbar').on('keyup', function() {
            $('.registerrightproductnameright').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('.registerrightproductnameright').html("(100 / 100)");
            }
        });
        
        $(".headermainmiddleimg").click(function() {
        	alert("검색결과 페이지로 이동해야... 검색결과 페이지 미작업");
        })
		/*  // YGYGYGYG
		$("#smantshirt1").click(function(){
			location.href = "ProductList.jsp?categori=a2_b5,a2_b5_c1";
		});
		$("#smantshirt2").click(function(){
			location.href = "ProductList.jsp?categori=a2_b5,a2_b5_c2";
		});
		$("#smantshirt3").click(function(){
			location.href = "ProductList.jsp?categori=a2_b5,a2_b5_c3";
		});
		*/
		
	});
		   
	</script>
<%--
</head>
<body>
 --%>
 	<div class="bottom_line">
		<div class="flex"id="TOP">
			<div class="flex1">
				<div class="flex1-1">
					<a class="link" href=https://m.bunjang.co.kr/splash>
						<img src="images/TM_MARK.svg"width="16" height="17"class="mr">앱다운로드
					</a>
					<div class="button1 link" onclick="fun()">
						<img src="images/TM_STAR.svg"width="16" height="17"class="mr">즐겨찾기
					</div>
				</div>
				<div class="flex1-1">
					<%
						if(NICKNAME_PK == null){
					%>
						<div class="link button1"id="login">로그인</div>
						<div class="link">
							<div class="alarm"id="register">회원가입</div>
						</div>
					<%		
						} else {
					%>
						<div class="link button1"id="logout">로그아웃</div>
					<%	
						}
					%>
					<div class="link">
						<div class="alarm">
							<div class="alarm1">알림
								<div class="alarm2">
									<span>최근 알림이 없습니다</span>
								</div>
							</div>
						</div>
					</div>
					<div class="link">
						<div class="mp">
							<div class="mp1">내 상점
								<div class="mp2">
									<span id="go1">내 상점</span>
									<span id="go2">찜한상품</span>
									<span id="go3">계정설정</span>
									<span id="go4">고객센터</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class = "headercast">
		<div class = "header">
			<div class = "headermain">
				<a class = "headermainleft">
					<img src = "images/mainlogo.png" width ="136" height = "40" alt = "번개장터 로고" onclick="location.href ='main.jsp'">
				</a>
				<div class = "headermainmiddlecast">
					<div class = "headermainmiddle">
						<input type = "text" placeholder = "상품명, 지역명, @상점명 입력" class = "headermainmiddlesearchbar" value=""/>
						<button class = "headermainmiddlesearchbardelete">
							<img src = "images/searchbardelete.png" width = "10" height = "12" alt = "검색어 삭제 버튼 아이콘"/>
						</button>
						<a class = "headermainmiddleimg">
							<img src = "images/mainsearch.png" width = "16" height = "16" alt = "검색 버튼 아이콘"/>
						</a>
					</div>
					<div class = "headermainmiddlefunction">
						<div class = "headermainmiddlefunctioncast"> <!-- letkud -->
							<div class = "headermainmiddlefunctiontop">
								<a class = "headermainmiddlefunctiontoptitlelast">최근검색어</a>
								<a class = "headermainmiddlefunctiontoptitlepopular">인기검색어</a>
							</div>
							<div class = "headermainmiddlefunctionmain">
								<div class = "headermainmiddlefunctionmaincast1">
									<div class = "headermainmiddlefunctionmaincast2">
										<div class = "headermainmiddlefunctionmaincookiecast">
											<div class = "headermainmiddlefunctionmaincookie">
												<button type = "button">젠북</button>
												<button type = "button" class = "headermainmiddlefunctionmaincookiedelete">
													<img src = "images/searchbardelete.png" width = "10" height = "12" alt = "최근검색어 삭제 버튼 아이콘">
												</button>
											</div>
											<div class = "headermainmiddlefunctionmaincookie">
												<button type = "button">아디다리도리다스</button>
												<button type = "button" class = "headermainmiddlefunctionmaincookiedelete">
													<img src = "images/searchbardelete.png" width = "10" height = "12" alt = "최근검색어 삭제 버튼 아이콘">
												</button>
											</div>
										</div>
										<div class = "headermainmiddlefunctionmaincookienull">
											<img src = "images/lastsearchnull.png" width = "52" height = "45" alt = "검색어 없음 이미지"/>
											<div>최근 검색어가 없습니다.</div>
										</div>
									</div>
								</div>
								<div class = "headermainmiddlefunctionmainpopular">
									<div class = "headermainmiddlefunctionmainpopularcast">
										<div class = "headermainmiddlefunctionmainpopularleft">
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">1</span>
												애플펜슬
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">2</span>
												ㄴ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">3</span>
												ㄷ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">4</span>
												ㄹ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">5</span>
												ㅁ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">6</span>
												ㅂ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">7</span>
												ㅅ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">8</span>
												ㅇ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">9</span>
												ㅈ
											</a>
											<a class = "headermainmiddlefunctionmainpopularleftrank">
												<span class = "headermainmiddlefunctionmainpopularleftranktitle">10</span>
												ㅊ
											</a>
										</div>
										<div class = "headermainmiddlefunctionmainpopularright">
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">11</span>
												애플펜슬
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">12</span>
												ㅏ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">13</span>
												ㅑ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">14</span>
												ㅓ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">15</span>
												ㅕ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">16</span>
												ㅗ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">17</span>
												ㅛ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">18</span>
												ㅜ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">19</span>
												ㅠ
											</a>
											<a class = "headermainmiddlefunctionmainpopularrightrank">
												<span class = "headermainmiddlefunctionmainpopularrightranktitle">20</span>
												ㅡ
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class = "heardermainmiddlefunctionmainsearchcast">
							<div class = "heardermainmiddlefunctionmainsearchtop">
								<div class = "heardermainmiddlefunctionmainsearchcategoricast">
									<a class = "heardermainmiddlefunctionmainsearchcategori" href = "#">
										<img src = "images/productcategori.png" width = "15" height = "12" alt = "추천 카테고리 아이콘"/>
										신발 > 스니커즈
									</a>
								</div>
								<a class = "heardermainmiddlefunctionmainsearchstore" href = "#">
									<img src = "images/storesearch.png" width = "18" height = "14" alt = "추천 상점 아이콘"/>
									상점 검색 >
									<span class = "heardermainmiddlefunctionmainsearchstoretitle">신발</span>
									<span class = "heardermainmiddlefunctionmainsearchtext">상점명으로 검색</span>
								</a>
							</div>
							<div class = "heardermainmiddlefunctionmainsearchexamplecast">
								<a class = "heardermainmiddlefunctionmainsearch">
									<span class = "heardermainmiddlefunctionmainsearchtitle">xmax</span>
								</a>
								<a class = "heardermainmiddlefunctionmainsearch">
									<span class = "heardermainmiddlefunctionmainsearchtitle">xmb</span>
								</a>
								<a class = "heardermainmiddlefunctionmainsearch">
									<span class = "heardermainmiddlefunctionmainsearchtitle">xmc</span>
								</a>
								<a class = "heardermainmiddlefunctionmainsearch">
									<span class = "heardermainmiddlefunctionmainsearchtitle">xmd</span>
								</a>
								<a class = "heardermainmiddlefunctionmainsearch">
									<span class = "heardermainmiddlefunctionmainsearchtitle">xme</span>
								</a>
							</div>
						</div>
						<div class = "headermainmiddlefunctionbottom">
							<a class = "headermainmiddlefunctionbottombutton">닫기</a>
							<a class = "headermainmiddlefunctionbottomgarbage">
								<img src = "images/searchgarbage.png" width = "13" height = "15" alt = "쓰레기통 아이콘"/>
								검색어 전체삭제
							</a>
						</div>
					</div>
				</div>
				<div class = "headermainrightcast">
					<button class = "headermainrightpurchase" id = "bungetalkicon">
						<img src = "images/maintalk.png" width = "23" height = "24" alt = "번개톡버튼 이미지"/>
						번개톡
					</button>
					<a class = "headermainrightmystore" href = "TM4.jsp">
						<img src = "images/mainmystore.png" width = "23" height = "24" alt = "내상점버튼 이미지"/>
						내상점
					</a>
					<a class = "headermainrighttalk" href = "sale.jsp">
						<img src = "images/mainpurchase.png" width = "23" height = "26" alt = "판매하기버튼 이미지"/>
						판매하기
					</a>
				</div>
			</div>
			<div class = "headercategoributtoncast">
				<div class = "headercategoributton">
					<button id = "categoributton" class = "categoributton">
						<img src = "images/maincategori.png" width = "20" height = "16" alt = "메뉴 버튼 아이콘"/>
					</button>
					<div class = "headercategoricast">
						<div class = "headercategori">
							<div class = "headercategoriltitle">
								전체 카테고리
							</div>
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "l1">
									<button type ="button" class= "buttoncategori">여성의류</button>
								</li>
								<li class="headerbottomcategoril" id = "l2">
									<button type ="button" class= "buttoncategori">남성의류</button>
								</li>
								<li class="headerbottomcategoril" id = "l3">
									<button type ="button" class= "buttoncategori">신발</button>
								</li>
								<li class="headerbottomcategoril" id = "l4">
									<button type ="button" class= "buttoncategori">가방</button>
								</li>
								<li class="headerbottomcategoril" id = "l5">
									<button type ="button" class= "buttoncategori">시계/쥬얼리</button>
								</li>
								<li class="headerbottomcategoril" id = "l6">	
									<button type ="button" class= "buttoncategori">패션/액세사리</button>
								</li>
								<li class="headerbottomcategoril" id = "l7">
									<button type ="button" class= "buttoncategori">디지털/가전</button>
								</li>
								<li class="headerbottomcategoril" id = "l8">
									<button type ="button" class= "buttoncategori">스포츠/레저</button>
								</li>
								<li class="headerbottomcategoril" id = "l9">
									<button type ="button" class= "buttoncategori">차량/오토바이</button>
								</li>
								<li class="headerbottomcategoril" id = "l10">
									<button type ="button" class= "buttoncategori">스타굿즈</button>
								</li>
								<li class="headerbottomcategoril" id = "l11">
									<button type ="button" class= "buttoncategori">키덜트</button>
								</li>
								<li class="headerbottomcategoril" id = "l12">
									<button type ="button" class= "buttoncategori">예술/희귀/수집품</button>
								</li>
								<li class="headerbottomcategoril" id = "l13">
									<button type ="button" class= "buttoncategori">음반/악기</button>
								</li>
								<li class="headerbottomcategoril" id = "l14">
									<button type ="button" class= "buttoncategori">도서/티켓/문구</button>
								</li>
								<li class="headerbottomcategoril" id = "l15">
									<button type ="button" class= "buttoncategori">뷰티/미용</button>
								</li>
								<li class="headerbottomcategoril" id = "l16">
									<button type ="button" class= "buttoncategori">가구/인테리어</button>
								</li>
								<li class="headerbottomcategoril" id = "l17">
									<button type ="button" class= "buttoncategori">생활/가공식품</button>
								</li>
								<li class="headerbottomcategoril" id = "l18">
									<button type ="button" class= "buttoncategori">유아동/출산</button>
								</li>
								<li class="headerbottomcategoril" id = "l19">
									<button type ="button" class= "buttoncategori">반려동물용품</button>
								</li>
								<li class="headerbottomcategoril" id = "l20">
									<button type ="button" class= "buttoncategori">기타</button>
								</li>
								<li class="headerbottomcategoril" id = "l21">
									<button type ="button" class= "buttoncategori">지역서비스</button>
								</li>
								<li class="headerbottomcategoril" id = "l22">
									<button type ="button" class= "buttoncategori">원룸/함께살아요</button>
								</li>
								<li class="headerbottomcategoril" id = "l23">
									<button type ="button" class= "buttoncategori">번개나눔</button>
								</li>
								<li class="headerbottomcategoril" id = "l24">
									<button type ="button" class= "buttoncategori">구인구직</button>
								</li>
								<li class="headerbottomcategoril" id = "l25">
									<button type ="button" class= "buttoncategori">재능</button>
								</li>
								<li class="headerbottomcategoril" id = "l26">
									<button type ="button" class= "buttoncategori">커뮤니티</button>
								</li>
							</ul>
						</div>
<!-- -------------------------------------------------------------------------------------------------------------------------------------- -->
						<div class = "headercategorim" id = "mwoman">
							<div class = "headercategoriltitle">
								여성의류
							</div>
							<ul class="headerbottomcategoricast">	
								<li class="headerbottomcategoril" id = "mwoman1">
									<button type ="button" class="buttoncategori">패딩/점퍼</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman2">
									<button type ="button" class="buttoncategori">코트</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman3">
									<button type ="button" class="buttoncategori">맨투맨</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman4">
									<button type ="button" class="buttoncategori">후드티/후드집업</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman5">
									<button type ="button" class="buttoncategori">티셔츠</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman6">
									<button type ="button" class="buttoncategori">블라우스</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman7">
									<button type ="button" class="buttoncategori">셔츠</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman8">
									<button type ="button" class="buttoncategori">바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman9">
									<button type ="button" class="buttoncategori">창바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman10">
									<button type ="button" class="buttoncategori">반바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman11">
									<button type ="button" class="buttoncategori">치마</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman12">
									<button type ="button" class="buttoncategori">원피스</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman13">
									<button type ="button" class="buttoncategori">가디건</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman14">
									<button type ="button" class="buttoncategori">니트/스웨터</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman15">
									<button type ="button" class="buttoncategori">자켓</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman16">
									<button type ="button" class="buttoncategori">점프수트</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman17">
									<button type ="button" class="buttoncategori">조끼/베스트</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman18">
									<button type ="button" class="buttoncategori">트레이닝</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman19">
									<button type ="button" class="buttoncategori">언더웨어/홈웨어</button>
								</li>
								<li class="headerbottomcategoril" id = "mwoman20">
									<button type ="button" class="buttoncategori">테마/이벤트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mman">
							<div class = "headercategoriltitle">
								남성의류
							</div>							
							<ul class="headerbottomcategoricast">	
								<li class="headerbottomcategoril" id = "mman1">
									<button type ="button" class="buttoncategori">패딩/점퍼</button>
								</li>
								<li class="headerbottomcategoril" id = "mman2">
									<button type ="button" class="buttoncategori">코트</button>
								</li>
								<li class="headerbottomcategoril" id = "mman3">
									<button type ="button" class="buttoncategori">맨투맨</button>
								</li>
								<li class="headerbottomcategoril" id = "mman4">
									<button type ="button" class="buttoncategori">후드티/후드집업</button>
								</li>
								<li class="headerbottomcategoril" id = "mman5">
									<button type ="button" class="buttoncategori">티셔츠</button>
								</li>
								<li class="headerbottomcategoril" id = "mman6">
									<button type ="button" class="buttoncategori">셔츠</button>
								</li>
								<li class="headerbottomcategoril" id = "mman7">
									<button type ="button" class="buttoncategori">가디건</button>
								</li>
								<li class="headerbottomcategoril" id = "mman8">
									<button type ="button" class="buttoncategori">니트/스웨터</button>
								</li>
								<li class="headerbottomcategoril" id = "mman9">
									<button type ="button" class="buttoncategori">바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mman10">
									<button type ="button" class="buttoncategori">청바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mman11">
									<button type ="button" class="buttoncategori">반바지</button>
								</li>
								<li class="headerbottomcategoril" id = "mman12">
									<button type ="button" class="buttoncategori">자켓</button>
								</li>
								<li class="headerbottomcategoril" id = "mman13">
									<button type ="button" class="buttoncategori">정장</button>
								</li>
								<li class="headerbottomcategoril" id = "mman14">
									<button type ="button" class="buttoncategori">조끼/베스트</button>
								</li>
								<li class="headerbottomcategoril" id = "mman15">
									<button type ="button" class="buttoncategori">트레이닝</button>
								</li>
								<li class="headerbottomcategoril" id = "mman16">
									<button type ="button" class="buttoncategori">언더웨어/홈웨어</button>
								</li>
								<li class="headerbottomcategoril" id = "mman17">
									<button type ="button" class="buttoncategori">테마/이벤트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mshose">
							<div class = "headercategoriltitle">
								신발
							</div>
							<ul class="headerbottomcategoricast">	
								<li class="headerbottomcategoril" id = "mshose1">
									<button type ="button" class="buttoncategori">스니커즈</button>
								</li>
								<li class="headerbottomcategoril" id = "mshose2">
									<button type ="button" class="buttoncategori">남성화</button>
								</li>
								<li class="headerbottomcategoril" id = "mshose3">
									<button type ="button" class="buttoncategori">여성화</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mbag">
							<div class = "headercategoriltitle">
								가방
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mbag1">
									<button type ="button" class="buttoncategori">여성가방</button>
								</li>
								<li class="headerbottomcategoril" id = "mbag2">
									<button type ="button" class="buttoncategori">남성가방</button>
								</li>
								<li class="headerbottomcategoril" id = "mbag3">
									<button type ="button" class="buttoncategori">여행용</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mwatch">
							<div class = "headercategoriltitle">
								시계/쥬얼리
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mwatch1">
									<button type ="button" class="buttoncategori">시계</button>
								</li>
								<li class="headerbottomcategoril" id = "mwatch2">
									<button type ="button" class="buttoncategori">쥬얼리</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mpassion">
							<div class = "headercategoriltitle">
								패션/악세서리
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mfassion1">
									<button type ="button" class="buttoncategori">지갑</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion2">
									<button type ="button" class="buttoncategori">벨트</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion3">
									<button type ="button" class="buttoncategori">모자</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion4">
									<button type ="button" class="buttoncategori">목도리/장갑</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion5">
									<button type ="button" class="buttoncategori">스카프/넥타이</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion6">
									<button type ="button" class="buttoncategori">안경/선글라스</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion7">
									<button type ="button" class="buttoncategori">양말/스타킹</button>
								</li>
								<li class="headerbottomcategoril" id = "mfassion8">
									<button type ="button" class="buttoncategori">우산/양산</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mdisital">
							<div class = "headercategoriltitle">
								디지털/가전
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mdisital1">
									<button type ="button" class="buttoncategori">모바일</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital2">
									<button type ="button" class="buttoncategori">가전제품</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital3">
									<button type ="button" class="buttoncategori">오디오/영상/관련기기</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital4">
									<button type ="button" class="buttoncategori">PC/노트북</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital5">
									<button type ="button" class="buttoncategori">게임/타이틀</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital6">
									<button type ="button" class="buttoncategori">카메라/DSLR</button>
								</li>
								<li class="headerbottomcategoril" id = "mdisital7">
									<button type ="button" class="buttoncategori">PC부품/저장장치</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "msport">
							<div class = "headercategoriltitle">
								스포츠/레저
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "msport1">
									<button type ="button" class="buttoncategori">골프</button>
								</li>
								<li class="headerbottomcategoril" id = "msport2">
									<button type ="button" class="buttoncategori">캠핑</button>
								</li>
								<li class="headerbottomcategoril" id = "msport3">
									<button type ="button" class="buttoncategori">낙시</button>
								</li>
								<li class="headerbottomcategoril" id = "msport4">
									<button type ="button" class="buttoncategori">축구</button>
								</li>
								<li class="headerbottomcategoril" id = "msport5">
									<button type ="button" class="buttoncategori">자전거</button>
								</li>
								<li class="headerbottomcategoril" id = "msport6">
									<button type ="button" class="buttoncategori">인라인/스케이트보드</button>
								</li>
								<li class="headerbottomcategoril" id = "msport7">
									<button type ="button" class="buttoncategori">전동킥보드/전동힐</button>
								</li>
								<li class="headerbottomcategoril" id = "msport8">
									<button type ="button" class="buttoncategori">테니스</button>
								</li>
								<li class="headerbottomcategoril" id = "msport9">
									<button type ="button" class="buttoncategori">등산/클라이밍</button>
								</li>
								<li class="headerbottomcategoril" id = "msport10">
									<button type ="button" class="buttoncategori">헬스/요가/필라테스</button>
								</li>
								<li class="headerbottomcategoril" id = "msport11">
									<button type ="button" class="buttoncategori">야구</button>
								</li>
								<li class="headerbottomcategoril" id = "msport12">
									<button type ="button" class="buttoncategori">볼링</button>
								</li>
								<li class="headerbottomcategoril" id = "msport13">
									<button type ="button" class="buttoncategori">배드민턴</button>
								</li>
								<li class="headerbottomcategoril" id = "msport14">
									<button type ="button" class="buttoncategori">탁구</button>
								</li>
								<li class="headerbottomcategoril" id = "msport15">
									<button type ="button" class="buttoncategori">농구</button>
								</li>
								<li class="headerbottomcategoril" id = "msport16">
									<button type ="button" class="buttoncategori">당구</button>
								</li>
								<li class="headerbottomcategoril" id = "msport17">
									<button type ="button" class="buttoncategori">겨울스포츠</button>
								</li>
								<li class="headerbottomcategoril" id = "msport18">
									<button type ="button" class="buttoncategori">수상스포츠</button>
								</li>
								<li class="headerbottomcategoril" id = "msport19">
									<button type ="button" class="buttoncategori">기타구기스포츠</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mcar">
							<div class = "headercategoriltitle">
								차량/오토바이
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mcar1">
									<button type ="button" class="buttoncategori">국산차</button>
								</li>
								<li class="headerbottomcategoril" id = "mcar2">
									<button type ="button" class="buttoncategori">수입차</button>
								</li>
								<li class="headerbottomcategoril" id = "mcar3">
									<button type ="button" class="buttoncategori">차량 용품/부품</button>
								</li>
								<li class="headerbottomcategoril" id = "mcar4">
									<button type ="button" class="buttoncategori">오토바이/스쿠터</button>
								</li>
								<li class="headerbottomcategoril" id = "mcar5">
									<button type ="button" class="buttoncategori">오토바이 용품/부품</button>
								</li>
								<li class="headerbottomcategoril" id = "mcar6">
									<button type ="button" class="buttoncategori">산업용 차량/장비</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mgoods">
							<div class = "headercategoriltitle">
								스타굿즈
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mgoods1">
									<button type ="button" class="buttoncategori">보이그룹</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods2">
									<button type ="button" class="buttoncategori">걸그룹</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods3">
									<button type ="button" class="buttoncategori">솔로(남)</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods4">
									<button type ="button" class="buttoncategori">솔로(여)</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods5">
									<button type ="button" class="buttoncategori">배우(남)</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods6">
									<button type ="button" class="buttoncategori">배우(여)</button>
								</li>
								<li class="headerbottomcategoril" id = "mgoods7">
									<button type ="button" class="buttoncategori">방송/예능/캐릭터</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mkidult">
							<div class = "headercategoriltitle">
								키덜트
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mkidult1">
									<button type ="button" class="buttoncategori">피규어/인형</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult2">
									<button type ="button" class="buttoncategori">레고/블럭</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult3">
									<button type ="button" class="buttoncategori">프라모델</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult4">
									<button type ="button" class="buttoncategori">RC/드론</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult5">
									<button type ="button" class="buttoncategori">보드게임</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult6">
									<button type ="button" class="buttoncategori">서바이벌건</button>
								</li>
								<li class="headerbottomcategoril" id = "mkidult7">
									<button type ="button" class="buttoncategori">기타(키덜트)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mart">
							<div class = "headercategoriltitle">
								예술/희귀/수집품
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mart1">
									<button type ="button" class="buttoncategori">희귀/예술품</button>
								</li>
								<li class="headerbottomcategoril" id = "mart2">
									<button type ="button" class="buttoncategori">골동품</button>
								</li>
								<li class="headerbottomcategoril" id = "mart3">
									<button type ="button" class="buttoncategori">예술작품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mmusic">
							<div class = "headercategoriltitle">
								음반/악기
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mmusic1">
									<button type ="button" class="buttoncategori">CD/DVD/LP</button>
								</li>
								<li class="headerbottomcategoril" id = "mmusic2">
									<button type ="button" class="buttoncategori">악기</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mbook">
							<div class = "headercategoriltitle">
								도서/티켓/문구
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mbook1">
									<button type ="button" class="buttoncategori">도서</button>
								</li>
								<li class="headerbottomcategoril" id = "mbook2">
									<button type ="button" class="buttoncategori">문구</button>
								</li>
								<li class="headerbottomcategoril" id = "mbook3">
									<button type ="button" class="buttoncategori">기프티콘/쿠폰</button>
								</li>
								<li class="headerbottomcategoril" id = "mbook4">
									<button type ="button" class="buttoncategori">상품권</button>
								</li>
								<li class="headerbottomcategoril" id = "mbook5">
									<button type ="button" class="buttoncategori">티켓</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mbeauty">
							<div class = "headercategoriltitle">
								뷰티/미용
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mbeauty1">
									<button type ="button" class="buttoncategori">스킨케어</button>
								</li>
								<li class="headerbottomcategoril" id = "mbearty2">
									<button type ="button" class="buttoncategori">색조메이크업</button>
								</li>
								<li class="headerbottomcategoril" id = "mbeauty3">
									<button type ="button" class="buttoncategori">베이스메이크업</button>
								</li>
								<li class="headerbottomcategoril" id = "mbearty4">
									<button type ="button" class="buttoncategori">바디/헤어케어</button>
								</li>
								<li class="headerbottomcategoril" id = "mbeauty5">
									<button type ="button" class="buttoncategori">향수/아로마</button>
								</li>
								<li class="headerbottomcategoril" id = "mbearty6">
									<button type ="button" class="buttoncategori">네일아트/케어</button>
								</li>
								<li class="headerbottomcategoril" id = "mbeauty7">
									<button type ="button" class="buttoncategori">미용소품/기기</button>
								</li>
								<li class="headerbottomcategoril" id = "mbearty8">
									<button type ="button" class="buttoncategori">다이어트/이너뷰티</button>
								</li>
								<li class="headerbottomcategoril" id = "mbearty9">
									<button type ="button" class="buttoncategori">남성 화장품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "minterior">
							<div class = "headercategoriltitle">
								가구/인테리어
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "minterior1">
									<button type ="button" class="buttoncategori">인테리어</button>
								</li>
								<li class="headerbottomcategoril" id = "minterior2">
									<button type ="button" class="buttoncategori">가구</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mlife">
							<div class = "headercategoriltitle">
								생활/가공식품
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mlife1">
									<button type ="button" class="buttoncategori">주방용품</button>
								</li>
								<li class="headerbottomcategoril" id = "mlife2">
									<button type ="button" class="buttoncategori">생활용품</button>
								</li>
								<li class="headerbottomcategoril" id = "mlife3">
									<button type ="button" class="buttoncategori">식품</button>
								</li>
								<li class="headerbottomcategoril" id = "mlife4">
									<button type ="button" class="buttoncategori">산업용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mbaby">
							<div class = "headercategoriltitle">
								유아동/출산
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "mbaby1">
									<button type ="button" class="buttoncategori">베이비의류(0~2세)</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby2">
									<button type ="button" class="buttoncategori">여아의류(3~6세)</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby3">
									<button type ="button" class="buttoncategori">여주니어의류(7세~)</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby4">
									<button type ="button" class="buttoncategori">남아의류(3~6세)</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby5">
									<button type ="button" class="buttoncategori">남주니어의류(7세~)</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby6">
									<button type ="button" class="buttoncategori">유아동신발/잡화</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby7">
									<button type ="button" class="buttoncategori">교육/완구/인형</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby8">
									<button type ="button" class="buttoncategori">유아동용품</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby9">
									<button type ="button" class="buttoncategori">출산/임부용품</button>
								</li>
								<li class="headerbottomcategoril" id = "mbaby10">
									<button type ="button" class="buttoncategori">이유용품/유아식기</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "mpet">
							<div class = "headercategoriltitle">
								반려동물용품
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "metc1">
									<button type ="button" class="buttoncategori">강아지 용품</button>
								</li>
								<li class="headerbottomcategoril" id = "metc2">
									<button type ="button" class="buttoncategori">강아지 사료/간식</button>
								</li>
								<li class="headerbottomcategoril" id = "metc3">
									<button type ="button" class="buttoncategori">기타(강아지)</button>
								</li>
								<li class="headerbottomcategoril" id = "metc4">
									<button type ="button" class="buttoncategori">고양이 용품</button>
								</li>
								<li class="headerbottomcategoril" id = "metc5">
									<button type ="button" class="buttoncategori">고양이 사료/간식</button>
								</li>
								<li class="headerbottomcategoril" id = "metc6">
									<button type ="button" class="buttoncategori">기타(고양이)</button>
								</li>
								<li class="headerbottomcategoril" id = "metc7">
									<button type ="button" class="buttoncategori">기타(반려동물 용품)</button>
								</li>
								<li class="headerbottomcategoril" id = "metc8">
									<button type ="button" class="buttoncategori">기타(반려동물 사료/간식)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategorim" id = "metc">
							<div class = "headercategoriltitle">
								기타
							</div>	
							<ul class="headerbottomcategoricast">
								<li class="headerbottomcategoril" id = "metc8">
									<button type ="button" class="buttoncategori">기타(반려동물 사료/간식)</button>
								</li>
							</ul>
						</div>
<!-- -------------------------------------------------------------------------------------------------------------------->
						<div class = "headercategoris" id = "swomanpadding">
							<div class="headercategoriltitle"><span>패딩/점퍼</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanpadding1">
									<button type = "button" class = "buttoncategori">롱패딩</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpadding2">
									<button type = "button" class = "buttoncategori">숏패딩</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpadding3">
									<button type = "button" class = "buttoncategori">블루종/항공점퍼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpadding4">
									<button type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomancoat">
							<div class="headercategoriltitle"><span>코트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomancoat1">
									<button type = "button" class = "buttoncategori">겨울 코트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomancoat2">
									<button type = "button" class = "buttoncategori">봄/가을 코트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanmantoman">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomanmantoman">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanhoody">
							<div class="headercategoriltitle"><span></span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomanhoody">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomantshirt">
							<div class="headercategoriltitle"><span>티셔츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomantshirt1">
									<button type = "button" class = "buttoncategori">긴팔 티셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomantshirt2">
									<button type = "button" class = "buttoncategori">반팔 티셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomantshirt3">
									<button type = "button" class = "buttoncategori">민소매 티셔츠</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanblouse">
							<div class="headercategoriltitle"><span>블라우스</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanblouse1">
									<button type = "button" class = "buttoncategori">긴팔 블라우스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanblouse2">
									<button type = "button" class = "buttoncategori">반팔 블라우스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanblouse3">
									<button type = "button" class = "buttoncategori">민소매 블라우스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanblouse4">
									<button type = "button" class = "buttoncategori">기타 (블라우스)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanshirt">
							<div class="headercategoriltitle"><span>셔츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanshirt1">
									<button type = "button" class = "buttoncategori">솔리드(단색)셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshirt2">
									<button type = "button" class = "buttoncategori">스트라이프 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshirt3">
									<button type = "button" class = "buttoncategori">체크 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshirt4">
									<button type = "button" class = "buttoncategori">청/데님 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshirt5">
									<button type = "button" class = "buttoncategori">기타(셔츠)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanpants">
							<div class="headercategoriltitle"><span>바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanpants1">
									<button type = "button" class = "buttoncategori">면바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpants2">
									<button type = "button" class = "buttoncategori">슬랙스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpants3">
									<button type = "button" class = "buttoncategori">조거팬츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpants4">
									<button type = "button" class = "buttoncategori">레깅스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanpants5">
									<button type = "button" class = "buttoncategori">기타(바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanjeans">
							<div class="headercategoriltitle"><span>청바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanjeans1">
									<button type = "button" class = "buttoncategori">일자 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjeans2">
									<button type = "button" class = "buttoncategori">스키니진</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjeans3">
									<button type = "button" class = "buttoncategori">부츠컷 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjeans4">
									<button type = "button" class = "buttoncategori">배기 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjeans5">
									<button type = "button" class = "buttoncategori">기타(청바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanshorts">
							<div class="headercategoriltitle"><span>반바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanshorts1">
									<button type = "button" class = "buttoncategori">면 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshorts2">
									<button type = "button" class = "buttoncategori">밴딩 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshorts3">
									<button type = "button" class = "buttoncategori">데님 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanshorts4">
									<button type = "button" class = "buttoncategori">기타(반바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanskirt">
							<div class="headercategoriltitle"><span>치마</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanskirt1">
									<button type = "button" class = "buttoncategori">롱 스커트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanskirt2">
									<button type = "button" class = "buttoncategori">미디 스커트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanskirt3">
									<button type = "button" class = "buttoncategori">미니 스커트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanonepiece">
							<div class="headercategoriltitle"><span>원피스</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanonepiece1">
									<button type = "button" class = "buttoncategori">롱 원피스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanonepiece2">
									<button type = "button" class = "buttoncategori">미디 원피스</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanonepiece3">
									<button type = "button" class = "buttoncategori">미니 원피스</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomancardigan">
							<div class="headercategoriltitle"><span>가디건</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomancardigan">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanknit">
							<div class="headercategoriltitle"><span>니트/스웨터</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomanknit">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanjacket">
							<div class="headercategoriltitle"><span>자켓</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanjacket1">
									<button type = "button" class = "buttoncategori">가죽 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjacket2">
									<button type = "button" class = "buttoncategori">데님 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjacket3">
									<button type = "button" class = "buttoncategori">트위드 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjacket4">
									<button type = "button" class = "buttoncategori">야상자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjacket5">
									<button type = "button" class = "buttoncategori">바람막이</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanjacket6">
									<button type = "button" class = "buttoncategori">기타(자켓)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomansuit">
							<div class="headercategoriltitle"><span>점프수트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomansuit1">
									<button type = "button" class = "buttoncategori">정장 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomansuit2">
									<button type = "button" class = "buttoncategori">정장 치마</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomansuit3">
									<button type = "button" class = "buttoncategori">정장 세트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomansuit4">
									<button type = "button" class = "buttoncategori">기타(정장)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanvest">
							<div class="headercategoriltitle"><span>조끼/베스트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomanvest1">
									<button type = "button" class = "buttoncategori">니트 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanvest2">
									<button type = "button" class = "buttoncategori">브이넥 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanvest3">
									<button type = "button" class = "buttoncategori">청/데님 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanvest4">
									<button type = "button" class = "buttoncategori">패딩 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanvest5">
									<button type = "button" class = "buttoncategori">퍼 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomanvest6">
									<button type = "button" class = "buttoncategori">기타(조끼/베스트)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomantraining">
							<div class="headercategoriltitle"><span>트레이닝</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swomantraining1">
									<button type = "button" class = "buttoncategori">트레이닝 상의</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomantraining2">
									<button type = "button" class = "buttoncategori">트레이닝 하의</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomantraining3">
									<button type = "button" class = "buttoncategori">트레이닝 세트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swomantraining4">
									<button type = "button" class = "buttoncategori">기타(트레이닝)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanunder">
							<div class="headercategoriltitle"><span>언더웨어/홈웨어</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomannuder">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "swomanevent">
							<div class="headercategoriltitle"><span>테마/이벤트</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "swomanevent">소분류 선택</span>
							</ul>
						</div>
<!--  ----------------------------------------------------------------------------------------------------------------------->
						<div class = "headercategoris" id = "smanpadding">
							<div class="headercategoriltitle"><span>패딩/점퍼</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanpadding1">
									<button type = "button" class = "buttoncategori">롱패딩</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpadding2">
									<button type = "button" class = "buttoncategori">숏패딩</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpadding3">
									<button type = "button" class = "buttoncategori">블루종/항공점퍼</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpadding4">
									<button type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smancoat">
							<div class="headercategoriltitle"><span>코트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smancoat1">
									<button type = "button" class = "buttoncategori">겨울 코트</button>
								</li>
								<li class = "headerbottomcategoril" id = "smancoat2">
									<button type = "button" class = "buttoncategori">봄/가을 코트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanmantoman">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanmantoman">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanhoody">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanhoody">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "smantshirt">
							<div class="headercategoriltitle"><span>티셔츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smantshirt1">
									<button type = "button" class = "buttoncategori">긴팔 티셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smantshirt2">
									<button type = "button" class = "buttoncategori">반팔 티셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smantshirt3">
									<button type = "button" class = "buttoncategori">민소매 티셔츠</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanshirt">
							<div class="headercategoriltitle"><span>셔츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanshirt1">
									<button type = "button" class = "buttoncategori">솔리드(단색)셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshirt2">
									<button type = "button" class = "buttoncategori">스트라이프 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshirt3">
									<button type = "button" class = "buttoncategori">체크 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshirt4">
									<button type = "button" class = "buttoncategori">청/데님 셔츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshirt5">
									<button type = "button" class = "buttoncategori">기타(셔츠)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smancardigan">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smancardigan">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanknit">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanknit">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanpants">
							<div class="headercategoriltitle"><span>바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanpants1">
									<button type = "button" class = "buttoncategori">면바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpants2">
									<button type = "button" class = "buttoncategori">슬랙스</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpants3">
									<button type = "button" class = "buttoncategori">조거 팬츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanpants4">
									<button type = "button" class = "buttoncategori">기타(바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanjeans">
							<div class="headercategoriltitle"><span>청바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanjeans1">
									<button type = "button" class = "buttoncategori">일자 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjeans2">
									<button type = "button" class = "buttoncategori">스키니진</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjeans3">
									<button type = "button" class = "buttoncategori">부츠컷 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjeans4">
									<button type = "button" class = "buttoncategori">배기 청바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjeans5">
									<button type = "button" class = "buttoncategori">기타(청바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanshorts">
							<div class="headercategoriltitle"><span>반바지</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanshorts1">
									<button type = "button" class = "buttoncategori">면 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshorts2">
									<button type = "button" class = "buttoncategori">데님 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshorts3">
									<button type = "button" class = "buttoncategori">밴딩 반바지</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanshorts4">
									<button type = "button" class = "buttoncategori">기타(반바지)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanjacket">
							<div class="headercategoriltitle"><span>자켓</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanjacket1">
									<button type = "button" class = "buttoncategori">가죽 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjacket2">
									<button type = "button" class = "buttoncategori">데님 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjacket3">
									<button type = "button" class = "buttoncategori">블레이저</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjacket4">
									<button type = "button" class = "buttoncategori">바람막이</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjacket5">
									<button type = "button" class = "buttoncategori">야상자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanjacket6">
									<button type = "button" class = "buttoncategori">기타(자켓)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smansuit">
							<div class="headercategoriltitle"><span>정장</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smansuit1">
									<button type = "button" class = "buttoncategori">기타(정장)</button>
								</li>
								<li class = "headerbottomcategoril" id = "smansuit2">
									<button type = "button" class = "buttoncategori">정장 자켓</button>
								</li>
								<li class = "headerbottomcategoril" id = "smansuit3">
									<button type = "button" class = "buttoncategori">정장 베스트</button>
								</li>
								<li class = "headerbottomcategoril" id = "smansuit4">
									<button type = "button" class = "buttoncategori">정장 세트</button>
								</li>
								<li class = "headerbottomcategoril" id = "smansuit5">
									<button type = "button" class = "buttoncategori">정장 바지</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanvest">
							<div class="headercategoriltitle"><span>조끼/베스트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smanvest1">
									<button type = "button" class = "buttoncategori">니트 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanvest2">
									<button type = "button" class = "buttoncategori">브이넥 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanvest3">
									<button type = "button" class = "buttoncategori">청/데님 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanvest2">
									<button type = "button" class = "buttoncategori">패딩 조끼</button>
								</li>
								<li class = "headerbottomcategoril" id = "smanvest3">
									<button type = "button" class = "buttoncategori">기타(조끼/베스트)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smantraining">
							<div class="headercategoriltitle"><span>트레이닝</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "smantraining1">
									<button type = "button" class = "buttoncategori">트레이닝 상의</button>
								</li>
								<li class = "headerbottomcategoril" id = "smantraining2">
									<button type = "button" class = "buttoncategori">트레이닝 하의</button>
								</li>
								<li class = "headerbottomcategoril" id = "smantraining3">
									<button type = "button" class = "buttoncategori">트레이닝 세트</button>
								</li>
								<li class = "headerbottomcategoril" id = "smantraining4">
									<button type = "button" class = "buttoncategori">기타(트레이닝)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanunder">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanunder">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "smanevent">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "sshosesneakers">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "sshosemanshose">
							<div class="headercategoriltitle"><span>남성화</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sshosemanshose1">
									<button type = "button" class = "buttoncategori">샌들/슬리퍼</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosemanshose2">
									<button type = "button" class = "buttoncategori">구두/로퍼</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosemanshose3">
									<button type = "button" class = "buttoncategori">워커/부츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosemanshose4">
									<button type = "button" class = "buttoncategori">기타(남성화)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sshosewomanshose">
							<div class="headercategoriltitle"><span>여성화</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sshosewomanshose1">
									<button type = "button" class = "buttoncategori">샌들/슬리퍼</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosewomanshose2">
									<button type = "button" class = "buttoncategori">구두</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosewomanshose3">
									<button type = "button" class = "buttoncategori">단화/플랫슈즈</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosewomanshose4">
									<button type = "button" class = "buttoncategori">워커/부츠</button>
								</li>
								<li class = "headerbottomcategoril" id = "sshosewomanshose5">
									<button type = "button" class = "buttoncategori">기타(여성화)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sbagwomanbag">
							<div class="headercategoriltitle"><span>여성가방</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sbagwomanbag1">
									<button type = "button" class = "buttoncategori">클러치백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagwomanbag2">
									<button type = "button" class = "buttoncategori">숄더백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagwomanbag3">
									<button type = "button" class = "buttoncategori">크로스백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagwomanbag4">
									<button type = "button" class = "buttoncategori">토트팩</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagwomanbag5">
									<button type = "button" class = "buttoncategori">백팩</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagwomanbag6">
									<button type = "button" class = "buttoncategori">기타(가방)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sbagmanbag">
							<div class="headercategoriltitle"><span>남성가방</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sbagmanbag1">
									<button type = "button" class = "buttoncategori">클러치</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagmanbag2">
									<button type = "button" class = "buttoncategori">숄더백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagmanbag3">
									<button type = "button" class = "buttoncategori">크로스백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagmanbag4">
									<button type = "button" class = "buttoncategori">브리프케이스</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagmanbag5">
									<button type = "button" class = "buttoncategori">백팩</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagmanbag6">
									<button type = "button" class = "buttoncategori">기타(가방)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sbagsuitcase">
							<div class="headercategoriltitle"><span>여행용</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sbagsuitcase1">
									<button type = "button" class = "buttoncategori">캐리어</button>
								</li>
								<li class = "headerbottomcategoril" id = "sbagsuitcase2">
									<button type = "button" class = "buttoncategori">기타(여행용)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swatchwatch">
							<div class="headercategoriltitle"><span>시계</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swatchwatch1">
									<button type = "button" class = "buttoncategori">남성 시계</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchwatch2">
									<button type = "button" class = "buttoncategori">여성 시계</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchwatch3">
									<button type = "button" class = "buttoncategori">기타(시계)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "swatchjewel">
							<div class="headercategoriltitle"><span>쥬얼리</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "swatchjewel1">
									<button type = "button" class = "buttoncategori">귀걸이/피어싱</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchjewel2">
									<button type = "button" class = "buttoncategori">목걸이/펜던트</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchjewel3">
									<button type = "button" class = "buttoncategori">팔찌/발찌</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchjewel4">
									<button type = "button" class = "buttoncategori">반지</button>
								</li>
								<li class = "headerbottomcategoril" id = "swatchjewel5">
									<button type = "button" class = "buttoncategori">기타(쥬얼리)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionwallet">
							<div class="headercategoriltitle"><span>지갑</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionwallet1">
									<button type = "button" class = "buttoncategori">남성 지갑</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionwallet2">
									<button type = "button" class = "buttoncategori">여성 지갑</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionwallet3">
									<button type = "button" class = "buttoncategori">기타(지갑)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionbelt">
							<div class="headercategoriltitle"><span>벨트</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionbelt1">
									<button type = "button" class = "buttoncategori">남성 벨트</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionbelt2">
									<button type = "button" class = "buttoncategori">여성 벨트</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionhat">
							<div class="headercategoriltitle"><span>모자</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionhat1">
									<button type = "button" class = "buttoncategori">볼캡</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionhat2">
									<button type = "button" class = "buttoncategori">버킷</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionhat3">
									<button type = "button" class = "buttoncategori">스냅백</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionhat4">
									<button type = "button" class = "buttoncategori">비니</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionhat5">
									<button type = "button" class = "buttoncategori">기타(모자)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionmuffler">
							<div class="headercategoriltitle"><span>목도리</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionmuffler1">
									<button type = "button" class = "buttoncategori">목도리</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionmuffler2">
									<button type = "button" class = "buttoncategori">장갑</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionscarf">
							<div class="headercategoriltitle"><span>스카프</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionscarf1">
									<button type = "button" class = "buttoncategori">스카프</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionscarf2">
									<button type = "button" class = "buttoncategori">넥타이</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionglasses">
							<div class="headercategoriltitle"><span>안경</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionglasses1">
									<button type = "button" class = "buttoncategori">선글라스</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionglasses2">
									<button type = "button" class = "buttoncategori">안경</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionsocks">
							<div class="headercategoriltitle"><span>양말</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sfansionsocks1">
									<button type = "button" class = "buttoncategori">양말</button>
								</li>
								<li class = "headerbottomcategoril" id = "sfansionsocks2">
									<button type = "button" class = "buttoncategori">스타킹</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionumbrella">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "sfansionetc">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalmobile">
							<div class="headercategoriltitle"><span>모바일</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalmobile1">
									<button type = "button" class = "buttoncategori">스마트폰</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile2">
									<button type = "button" class = "buttoncategori">태블릿</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile3">
									<button type = "button" class = "buttoncategori">웨어러블(워치)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile4">
									<button type = "button" class = "buttoncategori">일반폰(피쳐폰)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile5">
									<button type = "button" class = "buttoncategori">케이스/보호필름/액세서리</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile6">
									<button type = "button" class = "buttoncategori">케이블/충전기/주변기기</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalmobile7">
									<button type = "button" class = "buttoncategori">기타(모바일)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalelectronics">
							<div class="headercategoriltitle"><span>가전제품</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalelectronics1">
									<button type = "button" class = "buttoncategori">생활가전</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalelectronics2">
									<button type = "button" class = "buttoncategori">대형가전(냉장고/세탁기 등)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalelectronics3">
									<button type = "button" class = "buttoncategori">TV(LCD/LED/PDP)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalelectronics4">
									<button type = "button" class = "buttoncategori">미용가전(고데기 등)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalelectronics5">
									<button type = "button" class = "buttoncategori">사무기기(복사기/팩스 등)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalelectronics6">
									<button type = "button" class = "buttoncategori">기타(가전제품)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalaudio">
							<div class="headercategoriltitle"><span>오디오/영상/관련기기</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalaudio1">
									<button type = "button" class = "buttoncategori">이어폰/헤드폰</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalaudio2">
									<button type = "button" class = "buttoncategori">스피커/앰프</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalaudio3">
									<button type = "button" class = "buttoncategori">아이팟/MP3/PMP</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalaudio4">
									<button type = "button" class = "buttoncategori">비디오/프로젝터</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalaudio5">
									<button type = "button" class = "buttoncategori">오디오/홈시어터</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalaudio6">
									<button type = "button" class = "buttoncategori">기타(오디오/영상/관련기기)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalpc">
							<div class="headercategoriltitle"><span>PC/노트북</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalpc1">
									<button type = "button" class = "buttoncategori">데스크탑</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpc2">
									<button type = "button" class = "buttoncategori">노트북/넷북</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpc3">
									<button type = "button" class = "buttoncategori">모니터</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpc4">
									<button type = "button" class = "buttoncategori">PC주변기기(키보드/마우스)</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpc5">
									<button type = "button" class = "buttoncategori">노트북 가방/액세서리</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpc6">
									<button type = "button" class = "buttoncategori">기타(PC/노트북)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalgame">
							<div class="headercategoriltitle"><span>게임/타이틀</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalgame1">
									<button type = "button" class = "buttoncategori">닌텐도/NDS/Wii</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalgame2">
									<button type = "button" class = "buttoncategori">소니/플레이스테이션</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalgame3">
									<button type = "button" class = "buttoncategori">XBOX</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalgame4">
									<button type = "button" class = "buttoncategori">PC게임</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalgame5">
									<button type = "button" class = "buttoncategori">기타(게임/타이틀)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalcamera">
							<div class="headercategoriltitle"><span>카메라/DSLR</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalcamera1">
									<button type = "button" class = "buttoncategori">필름카메라/중형카메라</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera2">
									<button type = "button" class = "buttoncategori">DSLR/미러리스</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera3">
									<button type = "button" class = "buttoncategori">렌즈/필러/컨버터</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera4">
									<button type = "button" class = "buttoncategori">일반디카/토이카메라</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera5">
									<button type = "button" class = "buttoncategori">삼각대/플래시/조명</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera6">
									<button type = "button" class = "buttoncategori">디지털 캠코더</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera7">
									<button type = "button" class = "buttoncategori">메모리/배터리/가방</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalcamera8">
									<button type = "button" class = "buttoncategori">기타(카메라)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "sdisitalpcparts">
							<div class="headercategoriltitle"><span>PC부품/저장장치</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "sdisitalpcparts1">
									<button type = "button" class = "buttoncategori">메모리/VGA</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts2">
									<button type = "button" class = "buttoncategori">CPU/메인보드</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts3">
									<button type = "button" class = "buttoncategori">HDD/ODD/SSD</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts4">
									<button type = "button" class = "buttoncategori">USB/케이블/스피커</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts5">
									<button type = "button" class = "buttoncategori">복합기/프린터</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts6">
									<button type = "button" class = "buttoncategori">네트워크장비</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts7">
									<button type = "button" class = "buttoncategori">쿨러/파워서플라이</button>
								</li>
								<li class = "headerbottomcategoril" id = "sdisitalpcparts8">
									<button type = "button" class = "buttoncategori">소모품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportgolf">
							<div class="headercategoriltitle"><span>골프</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportgolf1">
									<button type = "button" class = "buttoncategori">골프 채</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportgolf2">
									<button type = "button" class = "buttoncategori">골프 남성 의류</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportgolf3">
									<button type = "button" class = "buttoncategori">골프 여성 의류</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportgolf4">
									<button type = "button" class = "buttoncategori">기타 골프 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportcamping">
							<div class="headercategoriltitle"><span>캠핑</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportcamping1">
									<button type = "button" class = "buttoncategori">텐트/그늘막</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportcamping2">
									<button type = "button" class = "buttoncategori">캠핑용품</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportcamping3">
									<button type = "button" class = "buttoncategori">캠핑 취사용품</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportcamping4">
									<button type = "button" class = "buttoncategori">기타 캠핑 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportfishing">
							<div class="headercategoriltitle"><span>낚시</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportfishing1">
									<button type = "button" class = "buttoncategori">공통 낚시 장비</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportfishing2">
									<button type = "button" class = "buttoncategori">바다 낚시</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportfishing3">
									<button type = "button" class = "buttoncategori">민물 낚시</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportfishing4">
									<button type = "button" class = "buttoncategori">루어/플라이 낚시</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportfishing5">
									<button type = "button" class = "buttoncategori">낚시 의류 및 기타 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportsoccer">
							<div class="headercategoriltitle"><span>축구</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportsoccer1">
									<button type = "button" class = "buttoncategori">축구 의류/잡화</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsoccer2">
									<button type = "button" class = "buttoncategori">축구 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbike">
							<div class="headercategoriltitle"><span>자전거</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportbike1">
									<button type = "button" class = "buttoncategori">자전거 의류 및 액세서리</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike2">
									<button type = "button" class = "buttoncategori">클래식/픽시</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike3">
									<button type = "button" class = "buttoncategori">로드/BMX</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike4">
									<button type = "button" class = "buttoncategori">MTB/산악</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike5">
									<button type = "button" class = "buttoncategori">미니벨로/접이식</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike6">
									<button type = "button" class = "buttoncategori">전동/하이브리드</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike7">
									<button type = "button" class = "buttoncategori">자전거 부품</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbike8">
									<button type = "button" class = "buttoncategori">기타(자전거)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportskate">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportkickboard">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssporttennis">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssporthiking">
							<div class="headercategoriltitle"><span>등산/클라이밍</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssporthiking1">
									<button type = "button" class = "buttoncategori">남성 등산복</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthiking2">
									<button type = "button" class = "buttoncategori">여성 등산복</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthiking3">
									<button type = "button" class = "buttoncategori">등산화/트레킹화</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthiking4">
									<button type = "button" class = "buttoncategori">등산 가방</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthiking5">
									<button type = "button" class = "buttoncategori">암벽/클라이밍</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthiking6">
									<button type = "button" class = "buttoncategori">기타 등산 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssporthealth">
							<div class="headercategoriltitle"><span>헬스/요가/필라테스</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssporthealth1">
									<button type = "button" class = "buttoncategori">헬스/요가/필라테스 장비</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthealth2">
									<button type = "button" class = "buttoncategori">헬스/요가/필라테스 의류</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssporthealth3">
									<button type = "button" class = "buttoncategori">기타 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbaseball">
							<div class="headercategoriltitle"><span>야구</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportbaseball1">
									<button type = "button" class = "buttoncategori">야구 의류/잡화</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbaseball2">
									<button type = "button" class = "buttoncategori">야구 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbowling">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbadminton">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportpingpong">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbasketball">
							<div class="headercategoriltitle"><span>농구</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportbasketball1">
									<button type = "button" class = "buttoncategori">농구 의류/잡화</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportbasketball2">
									<button type = "button" class = "buttoncategori">농구 용품</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportbilliards">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportwinter">
							<div class="headercategoriltitle"><span>겨울 스포츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportwinter1">
									<button type = "button" class = "buttoncategori">스키/보드 의류 및 잡화</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportwinter2">
									<button type = "button" class = "buttoncategori">스노우보드 장비</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportwinter3">
									<button type = "button" class = "buttoncategori">스키 장비</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportwinter4">
									<button type = "button" class = "buttoncategori">기타(겨울 스포츠)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportsummer">
							<div class="headercategoriltitle"><span>수상 스포츠</span></div>
							<ul class="headerbottomcategoricast">
								<li class = "headerbottomcategoril" id = "ssportsummer1">
									<button type = "button" class = "buttoncategori">수영/물놀이 용품</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer2">
									<button type = "button" class = "buttoncategori">남성 수영복/래쉬가드</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer3">
									<button type = "button" class = "buttoncategori">여성 수영복/래쉬가드</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer4">
									<button type = "button" class = "buttoncategori">서핑</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer5">
									<button type = "button" class = "buttoncategori">요트</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer6">
									<button type = "button" class = "buttoncategori">기타(수영복)</button>
								</li>
								<li class = "headerbottomcategoril" id = "ssportsummer7">
									<button type = "button" class = "buttoncategori">기타(수상 스포츠)</button>
								</li>
							</ul>
						</div>
						<div class = "headercategoris" id = "ssportball">
							<div class="headercategoriltitle"><span>소분류 선택</span></div>
							<ul class="headerbottomcategoricast">
								<span class = "registerrightcategorisnull" id = "smanevent">소분류 선택</span>
							</ul>
						</div>
					</div>
				</div>
					<a class = "headercenter" href = "#" target = "_black">
						<b>번개장터 판매자센터</b>
						<img src = "images/categoriarrowright.png" width = "6" height = "9" alt = "화살표 아이콘"/>
					</a>
				</div>
			</div>
			
<%-- 		<div class="JS_remocon"> <!-- 리모콘 -->
			<div class="fl JS_box1">
				<div class="fl JS_font1">찜한상품</div>
				<div class="fl JS_font2"><img src="images/HEART.png"width="9px"height="9px"><%=jDao.getJjimcount(NICKNAME_PK)%></div>
			</div>
			<div class="fl JS_BOX2">
				<div class="fl JS_font1">최근본상품</div>
				<div class="fl JS_font4">
					<div class="fl JS_font4-1">1</div>
				</div>
				
				<div class="fl">
					<a class=" fl JS_img"><img src="images/참깨라면1000.png"width="66px"height="66px"/></a>
				</div>
				
				<div class="fl width">
					<button class="fl btn"><img src="images/left.png"width="5px"height="9px"></button>
					<div class="fl JS_font5">1/1</div>
					<button class="fl btn"><img src="images/right.png"width="5px"height="9px"></button>
				</div>
			</div>
			<div class="fl JS_box3">
				<div class="fl JS_font6 width">앱 다운로드</div>
				<div class="fl QR">
					<img src="images/TM_QR.png"width="100%"height="100%"/>
				</div>
			</div>
			<div class="fl JS_box4">
				<button class="btn2"id="btn7">TOP</button>
			</div>
		</div>
 --%>		
	</div>
<%--
</body>
</html>
 --%>
<%@ include file="mainfloating.jspf" %>
