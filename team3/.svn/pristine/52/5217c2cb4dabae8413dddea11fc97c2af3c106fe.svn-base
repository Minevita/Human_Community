<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../includes/head.jsp" />
</head>

<body>
	<main class="join_send">
		<div class="section_wrapper">
		
			<div class="section1">
				<div class="section1Deco">
					<h1>
						<a href="/">
							<img alt="logo" src="${pageContext.request.contextPath}/resources/img/members.png" width="157">
						</a>
					</h1>
					<ul>
						<li>
							<a href="/member/type">회원가입</a>
						</li>
						<li>
							<a href="/customLogin">로그인</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="section2">
				<form method="post" class="form-group" id="sendForm">
				<sec:csrfInput/>
					<p>인증번호 문자 전송</p>
					<input type="text" name="phone" id="phone" class="form-control" placeholder="휴대폰 번호 입력" style="height: 89px;">
					<p class="msg text-primary" id="phoneCkMsg"></p>
					<div class="row">
						<div class="col">
							<button class="btn btn-success">확인</button>
						</div>
					</div>
				</form>
			</div>
			
			
			
			<div class="section3">
				<p>© HUMAN COMMUNITY All Rights Reserved.</p>
			</div>
			
		</div>
	</main>
</body>

</html>