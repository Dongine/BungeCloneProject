<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import="com.bunge.dto.*" %>
<%@ page import="com.bunge.dao.*" %>
<%@ page import = "java.util.*"%>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	int productnumber_pk = Integer.parseInt(request.getParameter("productnumber"));
	ProductmodificationDao mDao = new ProductmodificationDao();
	ArrayList<ProductmodificationDto> productlist = mDao.getmodification(productnumber_pk);
%>
<%-- <%
	String category1 = 
	String category2 =
	String category3 =		
%>

<%
	SaleDao sDao = new SaleDao();
	String category1Code = sDao.getSaleCategory1(category1);
	String category2Code = sDao.getSaleCategory2(category1Code, category2);
	String category3Code = sDao.getSaleCategory3(category2Code, category3);
%> --%>
<!DOCTYPE html>
<html>
<head>
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "css/sale.css"/>
<link rel="shortcut icon" href="images/favicon.ico">
<meta charset="UTF-8">
<title>판매하기</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script src = "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(function () {
			
			$(".popupexit").click(function(){
				$(".popuplastarea").hide();
				$(".popupaddress").hide();
			});
			
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
			
			$("#l1").click(function(){
				$("#l1").css('color','red');
				$("#l2").css('color','black');
				$("#l3").css('color','black');
				$(".registerrightcategoricastm1").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l2").click(function(){
				$("#l1").css('color','black');
				$("#l2").css('color','red');
				$("#l3").css('color','black');
				$(".registerrightcategoricastm2").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l3").click(function(){
				$("#l1").css('color','black');
				$("#l2").css('color','black');
				$("#l3").css('color','red');
				$(".registerrightcategoricastm3").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l4").click(function(){
				$(".registerrightcategoricastm4").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l5").click(function(){
				$(".registerrightcategoricastm5").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l6").click(function(){
				$(".registerrightcategoricastm6").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l7").click(function(){
				$(".registerrightcategoricastm7").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l8").click(function(){
				$(".registerrightcategoricastm8").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l9").click(function(){
				$(".registerrightcategoricastm9").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l10").click(function(){
				$(".registerrightcategoricastm10").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l11").click(function(){
				$(".registerrightcategoricastm11").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l12").click(function(){
				$(".registerrightcategoricastm12").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l13").click(function(){
				$(".registerrightcategoricastm13").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l14").click(function(){
				$(".registerrightcategoricastm14").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l15").click(function(){
				$(".registerrightcategoricastm15").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l16").click(function(){
				$(".registerrightcategoricastm16").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l17").click(function(){
				$(".registerrightcategoricastm17").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l18").click(function(){
				$(".registerrightcategoricastm18").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l19").click(function(){
				$(".registerrightcategoricastm19").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
				$(".registerrightcategoricastm20").css('display','none');
			});
			$("#l20").click(function(){
				$(".registerrightcategoricastm20").css('display','block');
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoricastm1").css('display','none');
				$(".registerrightcategoricastm2").css('display','none');
				$(".registerrightcategoricastm3").css('display','none');
				$(".registerrightcategoricastm4").css('display','none');
				$(".registerrightcategoricastm5").css('display','none');
				$(".registerrightcategoricastm6").css('display','none');
				$(".registerrightcategoricastm7").css('display','none');
				$(".registerrightcategoricastm9").css('display','none');
				$(".registerrightcategoricastm10").css('display','none');
				$(".registerrightcategoricastm11").css('display','none');
				$(".registerrightcategoricastm12").css('display','none');
				$(".registerrightcategoricastm13").css('display','none');
				$(".registerrightcategoricastm14").css('display','none');
				$(".registerrightcategoricastm15").css('display','none');
				$(".registerrightcategoricastm16").css('display','none');
				$(".registerrightcategoricastm17").css('display','none');
				$(".registerrightcategoricastm18").css('display','none');
				$(".registerrightcategoricastm19").css('display','none');
				$(".registerrightcategoricastm8").css('display','none');
			});
			
			$("#mwoman1").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none')
				$(".registerrightcategoricastswoman1").css('display','block');
				$(".registerrightcategoricastswoman2").css('display','none');
				$(".registerrightcategoricastswoman3").css('display','none');
				$(".registerrightcategoricastswoman4").css('display','none');
				$(".registerrightcategoricastswoman5").css('display','none');
				$(".registerrightcategoricastswoman6").css('display','none');
				$(".registerrightcategoricastswoman7").css('display','none');
				$(".registerrightcategoricastswoman8").css('display','none');
				$(".registerrightcategoricastswoman9").css('display','none');
				$(".registerrightcategoricastswoman10").css('display','none');
				$(".registerrightcategoricastswoman11").css('display','none');
				$(".registerrightcategoricastswoman12").css('display','none');
				$(".registerrightcategoricastswoman13").css('display','none');
				$(".registerrightcategoricastswoman14").css('display','none');
				$(".registerrightcategoricastswoman15").css('display','none');
				$(".registerrightcategoricastswoman16").css('display','none');
				$(".registerrightcategoricastswoman17").css('display','none');
				$(".registerrightcategoricastswoman18").css('display','none');
				$(".registerrightcategoricastswoman19").css('display','none');
				$(".registerrightcategoricastswoman20").css('display','none');
			});
			$("#mwoman2").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastswoman1").css('display','none');
				$(".registerrightcategoricastswoman2").css('display','block');
				$(".registerrightcategoricastswoman3").css('display','none');
				$(".registerrightcategoricastswoman4").css('display','none');
				$(".registerrightcategoricastswoman5").css('display','none');
				$(".registerrightcategoricastswoman6").css('display','none');
				$(".registerrightcategoricastswoman7").css('display','none');
				$(".registerrightcategoricastswoman8").css('display','none');
				$(".registerrightcategoricastswoman9").css('display','none');
				$(".registerrightcategoricastswoman10").css('display','none');
				$(".registerrightcategoricastswoman11").css('display','none');
				$(".registerrightcategoricastswoman12").css('display','none');
				$(".registerrightcategoricastswoman13").css('display','none');
				$(".registerrightcategoricastswoman14").css('display','none');
				$(".registerrightcategoricastswoman15").css('display','none');
				$(".registerrightcategoricastswoman16").css('display','none');
				$(".registerrightcategoricastswoman17").css('display','none');
				$(".registerrightcategoricastswoman18").css('display','none');
				$(".registerrightcategoricastswoman19").css('display','none');
				$(".registerrightcategoricastswoman20").css('display','none');
			});
			$("#mwoman3").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastswoman1").css('display','none');
				$(".registerrightcategoricastswoman2").css('display','none');
				$(".registerrightcategoricastswoman3").css('display','block');
				$(".registerrightcategoricastswoman4").css('display','none');
				$(".registerrightcategoricastswoman5").css('display','none');
				$(".registerrightcategoricastswoman6").css('display','none');
				$(".registerrightcategoricastswoman7").css('display','none');
				$(".registerrightcategoricastswoman8").css('display','none');
				$(".registerrightcategoricastswoman9").css('display','none');
				$(".registerrightcategoricastswoman10").css('display','none');
				$(".registerrightcategoricastswoman11").css('display','none');
				$(".registerrightcategoricastswoman12").css('display','none');
				$(".registerrightcategoricastswoman13").css('display','none');
				$(".registerrightcategoricastswoman14").css('display','none');
				$(".registerrightcategoricastswoman15").css('display','none');
				$(".registerrightcategoricastswoman16").css('display','none');
				$(".registerrightcategoricastswoman17").css('display','none');
				$(".registerrightcategoricastswoman18").css('display','none');
				$(".registerrightcategoricastswoman19").css('display','none');
				$(".registerrightcategoricastswoman20").css('display','none');
			});
			$("#mwoman4").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastswoman1").css('display','none');
				$(".registerrightcategoricastswoman2").css('display','none');
				$(".registerrightcategoricastswoman3").css('display','none');
				$(".registerrightcategoricastswoman4").css('display','nones');
				$(".registerrightcategoricastswoman5").css('display','none');
				$(".registerrightcategoricastswoman6").css('display','none');
				$(".registerrightcategoricastswoman7").css('display','none');
				$(".registerrightcategoricastswoman8").css('display','none');
				$(".registerrightcategoricastswoman9").css('display','none');
				$(".registerrightcategoricastswoman10").css('display','none');
				$(".registerrightcategoricastswoman11").css('display','none');
				$(".registerrightcategoricastswoman12").css('display','none');
				$(".registerrightcategoricastswoman13").css('display','none');
				$(".registerrightcategoricastswoman14").css('display','none');
				$(".registerrightcategoricastswoman15").css('display','none');
				$(".registerrightcategoricastswoman16").css('display','none');
				$(".registerrightcategoricastswoman17").css('display','none');
				$(".registerrightcategoricastswoman18").css('display','none');
				$(".registerrightcategoricastswoman19").css('display','none');
				$(".registerrightcategoricastswoman20").css('display','none');
			});
			
			$("#mman1").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastsman1").css('display','block');
				$(".registerrightcategoricastsman2").css('display','none');
				$(".registerrightcategoricastsman3").css('display','none');
				$(".registerrightcategoricastsman4").css('display','none');
				$(".registerrightcategoricastsman5").css('display','none');
			});
			$("#mman2").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastsman1").css('display','none');
				$(".registerrightcategoricastsman2").css('display','block');
				$(".registerrightcategoricastsman3").css('display','none');
				$(".registerrightcategoricastsman4").css('display','none');
				$(".registerrightcategoricastsman5").css('display','none');
			});
			$("#mman3").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastsman1").css('display','none');
				$(".registerrightcategoricastsman2").css('display','none');
				$(".registerrightcategoricastsman3").css('display','block');
				$(".registerrightcategoricastsman4").css('display','none');
				$(".registerrightcategoricastsman5").css('display','none');
			});
			$("#mman4").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastsman1").css('display','none');
				$(".registerrightcategoricastsman2").css('display','none');
				$(".registerrightcategoricastsman3").css('display','none');
				$(".registerrightcategoricastsman4").css('display','block');
				$(".registerrightcategoricastsman5").css('display','none');
			});
			$("#mman5").click(function(){
				$(".registerrightcategorimcast > span").css('display','none');
				$(".registerrightcategoriscast > *").css('display','none');
				$(".registerrightcategoricastsman1").css('display','none');
				$(".registerrightcategoricastsman2").css('display','none');
				$(".registerrightcategoricastsman3").css('display','none');
				$(".registerrightcategoricastsman4").css('display','none');
				$(".registerrightcategoricastsman5").css('display','block');
			});
			
			$(".registerrightproductnamelefttextbar").keyup(function() {
				var len = $(this).val().length;
				$(".registerrightproductnameright").text(len + " / " + 40);
				if($(this).val().length > 40) {
		            $(this).val($(this).val().substring(0, 40));
		            $('.registerrightproductnameright').html("40 / 40");
		            alert("글자 40이 초과되었습니다.");
		        }
			});
			
			$(".registerrightinform").keyup(function(){
				var len = $(this).val().length;
				$(".registerrightinformtextcounter").text(len + "/" + 2000);
				if($(this).val().length > 2000) {
		            $(this).val($(this).val().substring(0, 2000));
		            $('.registerrightinformtextcounter').html("2000 / 2000");
		            alert("글자 2000이 초과되었습니다.");
		        }
			});
			
			
			
			$(".registerrightcategoril").click(function() {
				var category1 = $(this).find("button").text().replace(' ','');
				$("#entercategory1").val(category1);
			});
			$(".registerrightcategorim").click(function(){
				var category2 = $(this).find("button").text().replace(' ','');
				$("#entercategory2").val(category2);
			})
			$(".registerrightcategoris").click(function(){
				var category3 = $(this).find("button").text().replace(' ','');
				$("#entercategory3").val(category3);
			});
			
			$("input[type = 'submit']").click(function(){
				var productstate = $('input[name = "productstate"]:checked').val();
				var exchange = $('input[name = "exchange"]:checked').val();
			});
			
			$("#check").change(function(){
				if($("#check").is(':checked')){
					$("#hiddencheck").val('배송비포함');
				}
			});
			/* $("#check").change(function(){
				if($("#check").is(':checked')){
					$("#hiddencheck").val('배송비포함');
				} else{
					$("#hiddencheck").val('배송비별도');
				}
			}); */

			$(".registerrighttracingareabutton").click(function(){
				alert("준비중입니다.");
			});
			
			$(".registerrighttracingareabutton1").click(function(){
				alert("준비중입니다.");
			});
			
			$(".registerrighttracingareabutton3").click(function(){
				$(".registerrighttracingareatextbar").val("지역설정안함");
			});
			
			$(".registerrighttracingareabutton2").click(function(){
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                $(".registerrighttracingareatextbar").val(data.address); // 주소 넣기
		            }
		        }).open();
			});
		});	
	</script>
</head>
<body>
	<%-- <div id="header">
		<%@ include file="mainheader.jspf" %>
	</div> --%>
<div id="header">
		<%@ include file="mainheader.jspf" %>
</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------ -->
	<div class= "container">
		<div class ="maintitle">
			<div class = "mainshape">
				<div class="regis">
					<a href="Controller?command=GoSale">상품등록</a>
				</div>
				<div class="magagement">
					<a href="Controller?command=GoManagement">상품관리</a>
				</div>
				<div class="tradelist">
					<a href="tradelist.jsp" target="_black">구매/판매 내역</a>
				</div>
			</div>
		</div>
		<%
			for(ProductmodificationDto dto : productlist){
		%>
		<form action = "Controller?command=ProductModification" class="basicinfomation" enctype="multipart/form-data" method = "post">
		<input type = "hidden" name = "nickname" value = "<%=NICKNAME_PK%>"/>
		<input type = "hidden" name = "productnumber" value ="<%=productnumber_pk %>"/>
			<div class="salemain">
				<div class="section1 section2">
					<h2 class ="h2section">기본정보<span>*필수항목</span></h2>
				<ul class="regiscast">
					<li class="register">
						<div class="registerleft">
							 상품이미지
							 <span>*</span>
							 <small>
								(
								0
								/12)
							 </small>
						</div>
						<div class= "registerright">
							<ul class="registerrightimage">
								<li class="registerrightimageregis">
									이미지 등록
										<input type="file" name ="imagename" style = "height:200px" accept="image/jpg, image/jpeg, image/png" multiple>
										<!-- <input type = "submit" value = "업로드"/> -->
								</li>
							</ul>
							<div class="registerrightimageregisinform">
								<b>
									* 상품 이미지는 640x640에 최적화 되어 있습니다.
								</b><br/>
								- 상품 이미지는 PC에서는 1:1, 모바일에서는 1:1.23 비율로 보여집니다.<br/>
								- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다. <br/>
								- 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다. <br/>
								- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다. <br/>
								- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다. <br/>
								최대 지원 사이즈인 640 X 640으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M)
							</div>
						</div>
					</li>
					<li class="register">
						<div class="registerleft">
							제목
							<span>*</span>
						</div>
						<div class="registerright">
							<div class="registerrightproductname">
								<div class="registerright registerrightproductnameleft">
									<input type="text" placeholder="상품 제목을 입력해주세요." class="registerrightproductnamelefttextbar" style ="height: 3rem; pedding: 0px 1rem;" name = "productname" value = "<%= dto.getProductname()%>">
									<a href = "" target="_blank" style= "margin: -100px; ">거래금지품목</a>
								</div>
								<div class="registerrightproductnameright">
									0
									/40									
								</div>
							</div>
						</div>
					</li>
					<li class="register">
						<div class="registerleft">
							카테고리
							<span>*</span>
						</div>
						<div class="registerright">
							<div class="registerrightcategorimain">
								<div class="registerrightcategori">
									<ul class="registerrightcategoricast">
										<li class="registerrightcategoril">
											<button id = "l1" type ="button" class= "buttoncategori">여성의류</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l2" type ="button" class= "buttoncategori">남성의류</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l3" type ="button" class= "buttoncategori">신발</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l4" type ="button" class= "buttoncategori">가방</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l5" type ="button" class= "buttoncategori">시계/쥬얼리</button>
										</li>
										<li class="registerrightcategoril">	
											<button id = "l6" type ="button" class= "buttoncategori">패션/액세사리</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l7" type ="button" class= "buttoncategori">디지털/가전</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l8" type ="button" class= "buttoncategori">스포츠/레저</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l9" type ="button" class= "buttoncategori">차량/오토바이</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l10" type ="button" class= "buttoncategori">스타굿즈</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l11" type ="button" class= "buttoncategori">키덜트</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l12" type ="button" class= "buttoncategori">예술/희귀/수집품</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l13" type ="button" class= "buttoncategori">음반/악기</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l14" type ="button" class= "buttoncategori">도서/티켓/문구</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l15" type ="button" class= "buttoncategori">뷰티/미용</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l16" type ="button" class= "buttoncategori">가구/인테리어</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l17" type ="button" class= "buttoncategori">생활/가공식품</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l18" type ="button" class= "buttoncategori">유아동/출산</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l19" type ="button" class= "buttoncategori">반려동물용품</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l20" type ="button" class= "buttoncategori">기타</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l21" type ="button" class= "buttoncategori">지역서비스</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l22" type ="button" class= "buttoncategori">원룸/함께살아요</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l23" type ="button" class= "buttoncategori">번개나눔</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l24" type ="button" class= "buttoncategori">구인구직</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l25" type ="button" class= "buttoncategori">재능</button>
										</li>
										<li class="registerrightcategoril">
											<button id = "l26" type ="button" class= "buttoncategori">커뮤니티</button>
										</li>
									</ul>
								</div>
<!-- -------------------------------------------------------------------------------------------------------------------------------------- -->
								<div class="registerrightcategorimcast"><span> 중분류 선택</span>
									<ul class="registerrightcategoricastm1">	
										<li class="registerrightcategorim">
											<button id = "mwoman1" type ="button" class="buttoncategori">패딩/점퍼</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman2" type ="button" class="buttoncategori">코트</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman3" type ="button" class="buttoncategori">맨투맨</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman4" type ="button" class="buttoncategori">후드티/후드집업</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman5" type ="button" class="buttoncategori">티셔츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman6" type ="button" class="buttoncategori">블라우스</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman7" type ="button" class="buttoncategori">셔츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman8" type ="button" class="buttoncategori">바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman9" type ="button" class="buttoncategori">청바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman10" type ="button" class="buttoncategori">반바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman11" type ="button" class="buttoncategori">치마</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman12" type ="button" class="buttoncategori">원피스</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman13" type ="button" class="buttoncategori">가디건</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman14" type ="button" class="buttoncategori">니트/스웨터</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman15" type ="button" class="buttoncategori">자켓</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman16" type ="button" class="buttoncategori">점프수트</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman17" type ="button" class="buttoncategori">트레이닝</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman18" type ="button" class="buttoncategori">언더웨어/홈웨어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwoman19" type ="button" class="buttoncategori">테마/이벤트</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm2">	
										<li class="registerrightcategorim">
											<button id = "mman1" type ="button" class="buttoncategori">패딩/점퍼</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman2" type ="button" class="buttoncategori">코트</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman3" type ="button" class="buttoncategori">맨투맨</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman4" type ="button" class="buttoncategori">후드티/후드집업</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman5" type ="button" class="buttoncategori">티셔츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman6" type ="button" class="buttoncategori">셔츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman7" type ="button" class="buttoncategori">가디건</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman8" type ="button" class="buttoncategori">니트/스웨터</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman9" type ="button" class="buttoncategori">바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman10" type ="button" class="buttoncategori">청바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman11" type ="button" class="buttoncategori">반바지</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman12" type ="button" class="buttoncategori">자켓</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman13" type ="button" class="buttoncategori">정장</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman14" type ="button" class="buttoncategori">조끼/베스트</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman15" type ="button" class="buttoncategori">트레이닝</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman16" type ="button" class="buttoncategori">언더웨어/홈웨어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mman17" type ="button" class="buttoncategori">테마/이벤트</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm3">	
										<li class="registerrightcategorim">
											<button id = "mshose1" type ="button" class="buttoncategori">스니커즈</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mshose2" type ="button" class="buttoncategori">남성화</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mshose3" type ="button" class="buttoncategori">여성화</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm4">
										<li class="registerrightcategorim">
											<button id = "mbag1" type ="button" class="buttoncategori">여성가방</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbag2" type ="button" class="buttoncategori">남성가방</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbag3" type ="button" class="buttoncategori">여행용</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm5">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mwatch1" type ="button" class="buttoncategori">시계</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mwatch1" type ="button" class="buttoncategori">쥬얼리</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm6">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mfassion1" type ="button" class="buttoncategori">지갑</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion2" type ="button" class="buttoncategori">벨트</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion3" type ="button" class="buttoncategori">모자</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion4" type ="button" class="buttoncategori">목도리/장갑</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion5" type ="button" class="buttoncategori">스카프/넥타이</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion6" type ="button" class="buttoncategori">안경/선글라스</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion7" type ="button" class="buttoncategori">양말/스타킹</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mfassion8" type ="button" class="buttoncategori">우산/양산</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm7">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mdisital1" type ="button" class="buttoncategori">모바일</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital2" type ="button" class="buttoncategori">가전제품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital3" type ="button" class="buttoncategori">오디오/영상/관련기기</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital4" type ="button" class="buttoncategori">PC/노트북</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital5" type ="button" class="buttoncategori">게임/타이틀</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital6" type ="button" class="buttoncategori">카메라/DSLR</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mdisital7" type ="button" class="buttoncategori">PC부품/저장장치</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm8">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "msport1" type ="button" class="buttoncategori">골프</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport2" type ="button" class="buttoncategori">캠핑</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport3" type ="button" class="buttoncategori">낙시</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport4" type ="button" class="buttoncategori">축구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport5" type ="button" class="buttoncategori">자전거</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport6" type ="button" class="buttoncategori">인라인/스케이트보드</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport7" type ="button" class="buttoncategori">전동킥보드/전동힐</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport8" type ="button" class="buttoncategori">테니스</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport9" type ="button" class="buttoncategori">등산/클라이밍</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport10" type ="button" class="buttoncategori">헬스/요가/필라테스</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport11" type ="button" class="buttoncategori">야구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport12" type ="button" class="buttoncategori">볼링</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport13" type ="button" class="buttoncategori">배드민턴</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport14" type ="button" class="buttoncategori">탁구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport15" type ="button" class="buttoncategori">농구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport16" type ="button" class="buttoncategori">당구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport17" type ="button" class="buttoncategori">겨울스포츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport18" type ="button" class="buttoncategori">수상스포츠</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "msport19" type ="button" class="buttoncategori">기타구기스포츠</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm9">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mcar1" type ="button" class="buttoncategori">국산차</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mcar2" type ="button" class="buttoncategori">수입차</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mcar3" type ="button" class="buttoncategori">차량 용품/부품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mcar4" type ="button" class="buttoncategori">오토바이/스쿠터</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mcar5" type ="button" class="buttoncategori">오토바이 용품/부품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mcar6" type ="button" class="buttoncategori">산업용 차량/장비</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm10">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mgoods1" type ="button" class="buttoncategori">보이그룹</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods2" type ="button" class="buttoncategori">걸그룹</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods3" type ="button" class="buttoncategori">솔로(남)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods4" type ="button" class="buttoncategori">솔로(여)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods5" type ="button" class="buttoncategori">배우(남)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods6" type ="button" class="buttoncategori">배우(여)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mgoods7" type ="button" class="buttoncategori">방송/예능/캐릭터</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm11">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mkidult1" type ="button" class="buttoncategori">피규어/인형</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult2" type ="button" class="buttoncategori">레고/블럭</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult3" type ="button" class="buttoncategori">프라모델</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult4" type ="button" class="buttoncategori">RC/드론</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult5" type ="button" class="buttoncategori">보드게임</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult6" type ="button" class="buttoncategori">서바이벌건</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mkidult7" type ="button" class="buttoncategori">기타(키덜트)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm12">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mart1" type ="button" class="buttoncategori">희귀/예술품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mart2" type ="button" class="buttoncategori">골동품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mart3" type ="button" class="buttoncategori">예술작품</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm13">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mmusic1" type ="button" class="buttoncategori">CD/DVD/LP</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mmusic2" type ="button" class="buttoncategori">악기</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm14">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mbook1" type ="button" class="buttoncategori">도서</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbook2" type ="button" class="buttoncategori">문구</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbook3" type ="button" class="buttoncategori">기프티콘/쿠폰</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbook4" type ="button" class="buttoncategori">상품권</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbook5" type ="button" class="buttoncategori">티켓</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm15">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mbeauty1" type ="button" class="buttoncategori">스킨케어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty2" type ="button" class="buttoncategori">색조메이크업</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty3" type ="button" class="buttoncategori">베이스메이크업</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty4" type ="button" class="buttoncategori">바디/헤어케어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty5" type ="button" class="buttoncategori">향수/아로마</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty6" type ="button" class="buttoncategori">네일아트/케어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty7" type ="button" class="buttoncategori">미용소품/기기</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty8" type ="button" class="buttoncategori">다이어트/이너뷰티</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbeauty9" type ="button" class="buttoncategori">남성 화장품</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm16">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "minterior1" type ="button" class="buttoncategori">인테리어</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "minterior2" type ="button" class="buttoncategori">가구</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm17">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mlife1" type ="button" class="buttoncategori">주방용품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mlife2" type ="button" class="buttoncategori">생활용품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mlife3" type ="button" class="buttoncategori">식품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mlife4" type ="button" class="buttoncategori">산업용품</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm18">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mbaby1" type ="button" class="buttoncategori">베이비의류(0~2세)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby2" type ="button" class="buttoncategori">여아의류(3~6세)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby3" type ="button" class="buttoncategori">여주니어의류(7세~)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby4" type ="button" class="buttoncategori">남아의류(3~6세)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby5" type ="button" class="buttoncategori">남주니어의류(7세~)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby6" type ="button" class="buttoncategori">유아동신발/잡화</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby7" type ="button" class="buttoncategori">교육/완구/인형</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby8" type ="button" class="buttoncategori">출산/임부용품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mbaby9" type ="button" class="buttoncategori">이유용품/유아식기</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm19">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "mpets1" type ="button" class="buttoncategori">강아지 용품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets2" type ="button" class="buttoncategori">강아지 사료/간식</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets3" type ="button" class="buttoncategori">기타(강아지)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets4" type ="button" class="buttoncategori">고양이 용품</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets5" type ="button" class="buttoncategori">고양이 사료/간식</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets6" type ="button" class="buttoncategori">기타(고양이)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets7" type ="button" class="buttoncategori">기타(반려동물 용품)</button>
										</li>
										<li class="registerrightcategorim">
											<button id = "mpets8" type ="button" class="buttoncategori">기타(반려동물 사료/간식)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastm20">	<!-- asdfasdf -->
										<li class="registerrightcategorim">
											<button id = "metc" type ="button" class="buttoncategori">모바일</button>
										</li>
									</ul>
								</div>
	<!-- -------------------------------------------추가 작업 필요------------------------------------------------------------------------------------------ -->
								<div class="registerrightcategoriscast"><span>소분류 선택</span>
									<ul class="registerrightcategoricastswoman1">
										<li class = "registerrightcategoris">
											<button id = "swomanpadding1" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpadding2" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpadding3" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpadding4" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman2">
										<li class = "registerrightcategoris">
											<button id = "swomancoat1" type = "button" class = "buttoncategori">겨울 코트</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomancoat2" type = "button" class = "buttoncategori">봄/가을 코트</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman3">
										<span class = "registerrightcategorisnull">소분류 선택</span>
									</ul>
									<ul class="registerrightcategoricastswoman4">
										<span class = "registerrightcategorisnull">소분류 선택</span>
									</ul>
									<ul class="registerrightcategoricastswoman5">
										<li class = "registerrightcategoris">
											<button id = "swomantshirt1" type = "button" class = "buttoncategori">긴팔 티셔츠</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomantshirt2" type = "button" class = "buttoncategori">반팔 티셔츠</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomantshirt3" type = "button" class = "buttoncategori">민소매 티셔츠</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman6">
										<li class = "registerrightcategoris">
											<button id = "swomanblouse1" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse2" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse3" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse4" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman6">
										<li class = "registerrightcategoris">
											<button id = "swomanblouse1" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse2" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse3" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanblouse4" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman7">
										<li class = "registerrightcategoris">
											<button id = "swomanshirt" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshirt" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshirt" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshirt" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman8">
										<li class = "registerrightcategoris">
											<button id = "swomanpants" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpants" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpants" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanpants" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman9">
										<li class = "registerrightcategoris">
											<button id = "swomanjeans" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjeans" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjeans" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjeans" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman10">
										<li class = "registerrightcategoris">
											<button id = "swomanshorts" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshorts" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshorts" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanshorts" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman11">
										<li class = "registerrightcategoris">
											<button id = "swomanskirt" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanskirt" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanskirt" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanskirt" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman12">
										<li class = "registerrightcategoris">
											<button id = "swomanonepiece" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanonepiece" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanonepiece" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanonepiece" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman13">
										<li class = "registerrightcategoris">
											<button id = "swomancardigan" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomancardigan" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomancardigan" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomancardigan" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman14">
										<li class = "registerrightcategoris">
											<button id = "swomanknit" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanknit" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanknit" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanknit" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman15">
										<li class = "registerrightcategoris">
											<button id = "swomanjacket" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjacket" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjacket" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanjacket" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman16">
										<li class = "registerrightcategoris">
											<button id = "swomansuit" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomansuit" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomansuit" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomansuit" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman17">
										<li class = "registerrightcategoris">
											<button id = "swomanvest" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanvest" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanvest" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanvest" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman18">
										<li class = "registerrightcategoris">
											<button id = "swomantraining" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomantraining" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomantraining" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomantraining" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman19">
										<li class = "registerrightcategoris">
											<button id = "swomanunder" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanunder" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanunder" type = "button" class = "buttoncategori">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanunder" type = "button" class = "buttoncategori">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastswoman20">
										<li class = "registerrightcategoris">
											<button id = "swomanevent" type = "button" class = "buttoncategori">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "swomanevent" type = "button" class = "buttoncategori">숏패딩</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastsman1">
										<li class = "registerrightcategoris">
											<button id = "smanpadding1" type = "button" class = "buttoncategori" value = "a2_b1_c1">롱패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smanpadding2" type = "button" class = "buttoncategori" value = "a2_b1_c2">숏패딩</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smanpadding3" type = "button" class = "buttoncategori" value = "a2_b1_c3">블루종/항공점퍼</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smanpadding4" type = "button" class = "buttoncategori" value = "a2_b1_c4">기타(패딩/점퍼)</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastsman2">
										<li class = "registerrightcategoris">
											<button id = "smancoat1" type = "button" class = "buttoncategori" value = "a2_b2_c1">겨울 코트</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smancoat2" type = "button" class = "buttoncategori" value = "a2_b2_c2">봄/가을 코트</button>
										</li>
									</ul>
									<ul class="registerrightcategoricastsman3">
										<span class = "registerrightcategorisnull">소분류 선택</span>
									</ul>
									<ul class="registerrightcategoricastsman4">
										<span class = "registerrightcategorisnull">소분류 선택</span>
									</ul>
									<ul class="registerrightcategoricastsman5">
										<li class = "registerrightcategoris">
											<button id = "smantshirt1" type = "button" class = "buttoncategori" value = "a2_b5_c1">긴팔 티셔츠</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smantshirt2" type = "button" class = "buttoncategori" value = "a2_b5_c2">반팔 티셔츠</button>
										</li>
										<li class = "registerrightcategoris">
											<button id = "smantshirt3" type = "button" class = "buttoncategori" value = "a2_b5_c3">민소매 티셔츠</button>
										</li>
									</ul>
								</div>
							</div>
							<h3 class="registerrightcategoriselect">
								선택한 카테고리: <input type = "text" id = "entercategory1" name = "category1" placeholder = "카테고리에서 선택하세요" value = ""/><input type = "text" id = "entercategory2" name = "category2" placeholder = "카테고리에서 선택하세요" value = ""/><input type = "text" id = "entercategory3" name = "category3" placeholder = "카테고리에서 선택하세요" value = ""/>
							</h3>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							거래 지역
							<span>*</span>					
						</div>
						<div class="registerright">
							<div class="registerrighttracingareabuttons">
								<button type="button" class="registerrighttracingareabutton">내 위치</button>
								<button type="button" class="registerrighttracingareabutton1">최근 지역</button>
								<button type="button" class="registerrighttracingareabutton2">주소 검색</button>
								<button type="button" class="registerrighttracingareabutton3">지역설정안함</button>
							</div>
							<input placeholder="선호 거래 지역을 검색해주세요." name = "tradingarea" class="registerrighttracingareatextbar" value="<%= dto.getTrading_area()%>">
 						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							상태
							<span>*</span>					
						</div>
						<div class="registerright">
							<div class="registerrightproductstate">
								<label for ="oldproduct" class="registerrightproductstatelabel1">
								<input id= "oldproduct" name = "productstate" type="radio" value = "중고상품"checked>
								중고상품
								<!-- <span class="registerrightproductstatelabel1check"></span> -->
								</label>
								<label for ="newproduct" class="registerrightproductstatelabel1">
								<input id= "newproduct" name = "productstate" type="radio" value ="새상품">
								새상품
								<!-- <span class="registerrightproductstatelabel1check"></span> -->
								</label>
							</div>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							교환
							<span>*</span>					
						</div>
							<div class="registerright">
							<div class="registerrightproductstate">
								<label for ="notexchange" class="registerrightproductstatelabel1">
								<input id= "notexchange" name= "exchange" type="radio" value = "교환불가"checked>
								교환불가
								<!-- <span class="registerrightproductstatelabel1check"></span> -->
								</label>
								<label for = "canexchange" class="registerrightproductstatelabel1">
								<input id="canexchange" name = "exchange" type="radio" value = "교환가능">
								교환가능
								<!-- <span class="registerrightproductstatelabel1check"></span> -->
								</label>
							</div>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							가격
							<span>*</span>					
						</div>
						<div class="registerright">
							<div class="registerrightpricecast">
								<input type ="text" placeholder ="숫자만 입력해주세요." class ="registerrightpricetextbar" name = "price" value = "<%= dto.getPrice() %>">
								원
							</div>
							<div class="registerrightpricedelivery">
								<label class="registerrightpricedeliverycheck">
									<!-- <label class="registerrightpricedeliverycheckbar">
										<input id="freesShipping" type="checkbox" name = "deliverycharge">
										배송비 포함 
									</label>	 -->						
									<input type = "checkbox" id = "check"><div class = "deliverychargetext">배송비 포함</div>
									<input type = "hidden" id = "hiddencheck" name = "deliverycharge">
								</label>
							</div>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							설명
							<span>*</span>					
						</div>
						<div class="registerright">
							<input type = "text" placeholder="상품 설명을 입력해주세요. (10글자 이상)" rows="6" class="registerrightinform" name = "productinformation" value = "<%= dto.getProduct_information()%>">
							<div class="registerrightinformkakao">
								<span>
								혹시
								<a href="#" target ="_blank">카카오톡ID</a>
								를 적으셨나요?
								</span>
								<div class="registerrightinformtextcounter">
								0
								/2000
								</div>
							</div>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							연관태그
						</div>
						<div class="registerright">
							<div class="registerrighttagcast">
								<div class="registerrighttag">
									<div class="registerrighttagshape">
										<input type="text" placeholder ="연관태그를 입력해주세요. (최대  5개)" name = "tag" value = "<%= dto.getTag()%>">
									</div>
								</div>
							</div>
							<ul class="registerrighttagbottom">
								<li>
									<p>태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있습니다.
									</p>
								</li>
								<li>
									<p>태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.
									</p>
								</li>
								<li>
									<p>검색 광고는 태그정보를 기준으로 노출됩니다.
									</p>
								</li>
								<li>
									<p>상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이 중단되거나 상품이 삭제될 수 있습니다.
									</p>
								</li>
							</ul>
						</div>
					</li>
					<li class= "register">
						<div class="registerleft">
							수량
						</div>
						<div class="registerright">
							<div class="registerrightquantity">
								<input type="text" class="registerrightquantitytextbar" name = "quantity" value = "<%= dto.getQuantity()%>">
								개
							</div>
						</div>
					</li>
				</ul>
				</div>
				<div class="section1 section2">
					<div class="fasttrading">
						<h2 class="fasttradingtitle">
							빠른 판매
							<div class="fasttradingtitlesub">
							<p>내 상품에 안전결제 배지가 표시돼요</p>
							<a href ="#" target ="_blank">자세히</a>
							</div>
						</h2>
						<ul class="fasttradingmain">
							<li class="fasttradingcast">
								<div class="fasttradingleft">
									옵션
								</div>
								<div class="fasttradingright">
									<div class="fasttradingrightcheck">
										<label for="bunPayFilter" class="fasttradingrightcheckbox">
											<input id="bunPayFilter" type="checkbox">
											<span class="fasttradingrightcheckboxtext">
												<span>안전결제 환영</span>
												<svg width ="60" height ="24" viewBox="0 0 35 16">
													<g fill ="none" fill-rule="evenodd">
														<rect fill="#D80C18" width ="35" height="16" rx="2"></rect>
														<path d = "m9.226 3.003 l -0.56 4.563 h 2.325 a 0.05 0.05 0 0 1 0.036 0.083 l -5.024 5.388 c -0.033 0.035 -0.091 0.008 -0.085 -0.04 l 0.56 -4.563 H 4.153 a 0.05 0.05 0 0 1 -0.036 -0.083 L 9.14 2.963 a 0.05 0.05 0 0 1 0.085 0.04 Z m 11.803 0.706 v 8.59 h -1.306 V 3.71 h 1.306 Z m 8.447 0 v 8.59 h -1.345 V 3.71 h 1.345 Z m -10.265 0.048 v 8.38 h -1.288 V 8.138 h -0.776 V 6.875 h 0.776 V 3.757 h 1.288 Z m 5.398 -0.02 c 0.353 0 0.677 0.05 0.97 0.149 c 0.294 0.099 0.548 0.25 0.763 0.455 c 0.214 0.203 0.385 0.458 0.511 0.765 c 0.126 0.306 0.199 0.663 0.218 1.071 a 30.552 30.552 0 0 1 0 3.052 a 3.16 3.16 0 0 1 -0.218 1.076 a 2.2 2.2 0 0 1 -0.511 0.76 a 2.037 2.037 0 0 1 -0.762 0.455 a 3.031 3.031 0 0 1 -0.971 0.148 c -0.714 0 -1.291 -0.2 -1.733 -0.602 c -0.442 -0.402 -0.685 -1.015 -0.73 -1.837 a 95.334 95.334 0 0 1 -0.033 -0.785 a 19.155 19.155 0 0 1 0 -1.483 c 0.01 -0.248 0.021 -0.51 0.034 -0.784 c 0.044 -0.823 0.287 -1.435 0.729 -1.836 c 0.442 -0.403 1.02 -0.604 1.733 -0.604 Z m -7.084 0.182 v 1.187 h -0.531 l -0.016 5.075 l 0.614 -0.024 v 1.167 l -4.47 0.192 v -1.187 l 0.624 -0.024 l -0.017 -5.2 h -0.531 V 3.92 h 4.327 Z m 7.084 1.005 c -0.165 0 -0.312 0.027 -0.44 0.081 a 0.814 0.814 0 0 0 -0.337 0.268 c -0.095 0.124 -0.17 0.288 -0.227 0.492 c -0.057 0.205 -0.095 0.46 -0.114 0.766 c -0.025 0.376 -0.038 0.767 -0.038 1.172 c 0 0.405 0.013 0.796 0.038 1.172 c 0.02 0.306 0.057 0.561 0.114 0.765 c 0.057 0.204 0.132 0.368 0.227 0.493 a 0.82 0.82 0 0 0 0.336 0.268 c 0.13 0.054 0.276 0.08 0.44 0.08 c 0.165 0 0.312 -0.026 0.44 -0.08 a 0.82 0.82 0 0 0 0.337 -0.268 c 0.095 -0.125 0.17 -0.289 0.228 -0.493 c 0.056 -0.204 0.094 -0.46 0.113 -0.765 a 17.748 17.748 0 0 0 0 -2.343 a 3.805 3.805 0 0 0 -0.113 -0.767 a 1.454 1.454 0 0 0 -0.228 -0.492 a 0.814 0.814 0 0 0 -0.336 -0.268 a 1.127 1.127 0 0 0 -0.44 -0.081 Z m -8.894 0.182 h -0.707 l 0.016 5.15 l 0.675 -0.026 l 0.016 -5.124 Z"
														fill ="#FFF"></path>
													</g>
												</svg>
											</span>
										</label>
									</div>
									<ul class="fasttradingrightcheckboxmiddle">
										<li class="fasttradingrightcheckboxmiddle1">
											<svg width ="18" height="18" viewBow ="0 0 20 20" fill="#ff5058">
												<g fill="current" fill-rule ="evenodd">
													<g fill="current">
														<g>
															<path d="M 7.5 16.667 c -0.221 0 -0.433 -0.088 -0.59 -0.244 l -5 -5 c -0.21 -0.21 -0.292 -0.518 -0.215 -0.805 c 0.077 -0.288 0.302 -0.512 0.59 -0.59 c 0.287 -0.076 0.594 0.006 0.804 0.216 l 4.363 4.364 l 9.415 -10.984 c 0.3 -0.349 0.825 -0.39 1.175 -0.09 c 0.349 0.299 0.39 0.824 0.09 1.174 l -10 11.666 c -0.15 0.177 -0.368 0.283 -0.6 0.292 H 7.5"
															transform ="translate(-308 -798) translate(308 798)">
															</path>
														</g>
													</g>
												</g>
											</svg>
											<p>
												안전결제(번개페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요.
												<small>
													거절 시,
													<a href="#" target ="_blank">이용 제재</a>
													가 있을 수 있으니 주의해 주세요.
												</small>
											</p>
										</li>
										<li class="fasttradingrightcheckboxmiddle2">
											<svg width ="18" height="18" viewBow ="0 0 20 20" fill="#ff5058">
												<g fill="current" fill-rule ="evenodd">
													<g fill="current">
														<g>
															<path d="M 7.5 16.667 c -0.221 0 -0.433 -0.088 -0.59 -0.244 l -5 -5 c -0.21 -0.21 -0.292 -0.518 -0.215 -0.805 c 0.077 -0.288 0.302 -0.512 0.59 -0.59 c 0.287 -0.076 0.594 0.006 0.804 0.216 l 4.363 4.364 l 9.415 -10.984 c 0.3 -0.349 0.825 -0.39 1.175 -0.09 c 0.349 0.299 0.39 0.824 0.09 1.174 l -10 11.666 c -0.15 0.177 -0.368 0.283 -0.6 0.292 H 7.5"
															transform ="translate(-308 -798) translate(308 798)">
															</path>
														</g>
													</g>
												</g>
											</svg>
											<p>
												내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.
											</p>
										</li>
										<li class="fasttradingrightcheckboxmiddle3">
											<svg width ="18" height="18" viewBow ="0 0 20 20" fill="#ff5058">
												<g fill="current" fill-rule ="evenodd">
													<g fill="current">
														<g>
															<path d="M 7.5 16.667 c -0.221 0 -0.433 -0.088 -0.59 -0.244 l -5 -5 c -0.21 -0.21 -0.292 -0.518 -0.215 -0.805 c 0.077 -0.288 0.302 -0.512 0.59 -0.59 c 0.287 -0.076 0.594 0.006 0.804 0.216 l 4.363 4.364 l 9.415 -10.984 c 0.3 -0.349 0.825 -0.39 1.175 -0.09 c 0.349 0.299 0.39 0.824 0.09 1.174 l -10 11.666 c -0.15 0.177 -0.368 0.283 -0.6 0.292 H 7.5"
															transform ="translate(-308 -798) translate(308 798)">
															</path>
														</g>
													</g>
												</g>
											</svg>
											<p>
												번개페이 배지로 더 많은 관심을 받을 수 있어요.
											</p>
										</li>
									</ul>
									<div class="fasttradingrightcheckboxlast">* 번개페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="popuplastarea">
					<section class="popuplastareacast">
						<header>
							최근 지역
							<button type="button" class="popupexit popuplastareabutton">
							</button>
						</header>
						<ul></ul>
					</div>	
				<div class="popupaddress">
					<section class="popupaddresscast">
						<header>
							주소 검색
							<button type="button" class="popupexit popuplastareabutton1">
							</button>
						</header>
						<!-- <form class="popupaddress1">
							<input type="text" placeholder ="동(읍/면/리) 입력해주세요." value>
							<button type="submit" class="popupaddressbutton1 popupaddressbutton2"></button>
						</form> -->
					</section>
				</div> 
				</div>
			<footer class="footermain">
				<div class="footercast">
					<input type="submit" class="footerbutton" id = "footerbutton" value ="등록하기">
					<ul></ul>
				</div>
			</footer>
			</form>
			<% 
			}
			%>
		</div>
	</div>
</body>
</html>