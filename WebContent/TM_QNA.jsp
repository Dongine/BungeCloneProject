<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bunge.dao.*"%>
<%@ page import="com.bunge.dto.*"%>
<link rel="shortcut icon" href="images/favicon.ico">
<%
	InquiryDao iDao = new InquiryDao();
	String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
%>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>번개장터 고객센터</title>
	<link rel="stylesheet" href="css/TM_QNA.css"/>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			/* $('.box2').click(function(){
				location.href="TM_QNA/Answer.jsp";
			}) */
			$('#move').click(function(){
				location.href="Controller?command=GoCenter";	
			})
		}) 
	
	</script>
</head>
<body>
	<div class="main">
		<div class="main flex tl" style="width:640px;height:50px;">
			<img id="move"src=images/TM_LEFT.svg width="20px"height="20px"style="margin-left:13px">
			<div class="font14 inquiry">
				<a href="Controller?command=GoQna_New"><!-- C TM_QNA/NEW.jsp CSS 오류 -->
					문의하기
				</a>
			</div>
		</div>
		<div class="main tl box">
			<div class="font28 box1">
				1:1문의
			</div>
			<div class="fl box2 width">
				<%
					ArrayList<InquiryDto> InquiryList = iDao.getInquiryList(NICKNAME_PK);
					for(InquiryDto dto : InquiryList) {
				%>
				<div class="fl width box2-1" bno=<%=dto.getIdentificationNumberPk()%>>	<!-- bno=identification_number_pk -->
					<div class="fl width font16"style="margin-bottom:7px">
						<span class="s1"><%=dto.getDetailsTypeSelect()%></span>	<!-- details-type-select -->
						<%=dto.getTypeSelect()%>							<!-- type-select -->
					</div>
					<div class="fl width">
						<div class="fl an font12">
							답변대기중
						</div>
						<div class="fl an1 font12">
							<%=dto.getRegistrationTime()%>					<!-- registration_time -->
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<div class="fl box3 width">
				<div class="fl font18 width">
					유의사항
				</div>
				<ul>
					<li><a href="Controller?command=GoFaq">자주묻는질문</a>을 확인하면 답변을 빨리 받을 수 있어요.</li>
					<li>접수는 24시간 가능하지만,<br/>답변은 9시 - 18시 사이에 순차적으로 받을 수 있어요.</li>
					<li>문의취소는 접수상태에서만 가능해요.</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>