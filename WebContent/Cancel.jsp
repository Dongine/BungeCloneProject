<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취소하기</title>
	<link rel="stylesheet" href="css/Cancel.css"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
	%>

</head>
<body>
<form action="Controller?command=CancelAction" method="post">
	<input type="hidden" name="rno" value="<%=rno%>"/>
	<input type="hidden" name="dno" value="<%=dno%>"/>
	<div id="cancelCt1">
		<div id="cancelCt1_1">
			<div id="cancelCt2">
				<div id="cancelCt2Left">
					<span id="cancelCt2LeftFont">취소하기</span>
				</div>
				<div id="cancelCt2Right">
					<img id="cancelCloseButton" src="images/closeButton.png"/>
				</div>
			</div>
			<div id="cancelCt3">
				<p id="cancelCt3_1">거래 취소 사유를 선택해 주세요</p>
				<div id="cancelCt3_2">
					<select id="selectBox" name="cancelReason">
						<option value="">선택</option>
						<option value="거래 정보 수정">거래 정보 수정</option>
						<option value="구매자 변심으로 거래파기">구매자 변심으로 거래파기</option>
						<option value="판매자 변심으로 거래파기">판매자 변심으로 거래파기</option>
						<option value="기타">기타</option>
					</select>
				</div>
			</div>
			<div id="cancelCt4">
				<p id="cancelCt4_1">상세 내용</p>
				<textarea id="cancelCt4_2" placeholder="취소 사유를 상세히 입력해주세요." name="cancelReasonDetail" maxlength="500" required></textarea>
			</div>
		</div>
	</div>
	<div id="checkCt">
		<button id="checkButton" class="fl"><b>확인</b></button>
	</div>
</form>
</body>
</html>