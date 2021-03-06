<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags />
</head>
<body>
	<main class="identify">
	
		<div class="section1">
			<img id="info_logo" alt="info_logo" src="${pageContext.request.contextPath}/resources/img/members.png" onclick="location.href='/'" style="cursor: pointer;">
		</div>
		
		<div class="section2">
			<div class="s1">
				<strong style="font-weight: bolder;">본인확인</strong>
			</div>
			<div class="s2">
				<span class="s2_text">고객님의</span><span class="s2_text" id="core" style="#001487;"> 본인확인을 </span><span class="s2_text">진행해주세요</span>
				<p style="margin-top: 20px;">휴먼커뮤니티의 회원정보 서비스 이용을 위해 본인확인이 필요합니다.</p>
			</div>
			<div class="s3">
				<form method="post">
					<input type="hidden" value="<sec:authentication property="principal.memberVo.pw"/>" name="ckPw" id="ckPw">
					<input type="text" name="pw" id="pw" placeholder="비밀번호 입력">
					<sec:csrfInput/>
					<button type="submit">확인</button>
				</form>
			</div>
		</div>
		
		<div class="section3" style="bor">
			<p>© HUMAN COMMUNITY Corporation All Rights Reserved.</p>
		</div>
	</main>
</body>

</html>
