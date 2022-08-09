<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	int productnumber_pk = 0;
	try {
		productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
	} catch(NumberFormatException e) { }
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>주소 추가</title>
	<link rel="stylesheet" href="css/AddressAdd.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 활성화할 조건 판단 후 활성화 또는 비활성화
		function activateAddressButton() {
			if($("#inputAddressTextName").val()=='' ||
					$("#inputAddressTextPhone").val()=='' ||
 					$("#inputAddressTextAddress").val()=='' || 
					$("#inputAddressTextDetailAddress").val()=='' ) {
				$("#doneAddressButton").attr("disabled",true); // 버튼 비활성화
				$("#doneAddressButtonCt").css("background-color","rgb(251, 231, 232)");
			} else { // 값이 있으면
				$("#doneAddressButton").attr("disabled",false); // 버튼활성화
				$("#doneAddressButtonCt").css("background-color","rgb(216, 12, 24)");
				$("#doneAddressButton").css("cursor","pointer");
			}
		}
		
		$(function(){
			// 주소정보 입력시 완료버튼 활성화
			$("#inputAddressTextName").on("input",function(){ 
				activateAddressButton();
			}); 
			$("#inputAddressTextPhone").on("input",function(){ 
				activateAddressButton();
			}); 
			$("#inputAddressTextAddress").on("input",function(){ 
				activateAddressButton();
			}); 
			$("#inputAddressTextDetailAddress").on("input",function(){ 
				activateAddressButton();
			}); 
			
			// 주소
			$("#addressFindCt").click(function() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			        	$("#inputAddressTextAddress").val(data.address);
			        }
			    }).open();
			});
		});
	</script>
</head>
<body>
	<form id="addressAddCt1" action="Controller?command=AddressAddAction" method="post">
		<input type="hidden" name="productnumber_pk" value="<%=productnumber_pk%>"/>
		<div id="addressAddCt2">
			<div id="addressAddCt3">
				<svg onclick="history.back()" class="fl" style="cursor:pointer;" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M14.265 19.537a.9.9 0 1 0 1.27-1.274l-8.362-8.34 8.365-8.387A.9.9 0 0 0 14.263.264l-9 9.024a.902.902 0 0 0 .002 1.273l9 8.976z" fill="#1e1d29" fill-rule="evenodd"></path></svg>
			</div>
			<div id="addressAddCt4">
				<div id="addressAddCt5">
					<h1 id="addressAddCt5Font" class="fl"><b>주소 추가</b></h1>
				</div>
				<div style="clear:both;"></div>
				<div id="addressAddCt6">
					<div class="writeCt">
						<input type="text" class="fl bold contentFont" name="addressName" id="inputAddressTextName" placeholder="이름">	
					</div>
					<div class="writeCt">
						<input type="text" class="fl bold contentFont" name="phoneNumber" id="inputAddressTextPhone" placeholder="휴대폰번호">	
					</div>
					<div style="clear:both;"></div>
					<div class="writeCt" id="addressFindCt">
						<input type="text" class="fl bold contentFont" name="address" id="inputAddressTextAddress" placeholder="주소">
					</div> 
					<div style="clear:both;"></div> 
					<div class="writeCt">
						<input type="text" class="fl bold contentFont" name="detailedAddress" id="inputAddressTextDetailAddress" placeholder="상세주소">
					</div>
					<div style="clear:both;"></div> 
					<div style="clear:both;"></div>
				</div>
				<div id="done">
					<div id="doneAddressButtonCt">
						<button disabled="true" id="doneAddressButton"><b>완료</b></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>