<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../includes/head.jsp" />
</head>

<body>
	<main class="join_type">
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
				<p class="p1">
					<img alt="welcome_logo" src="${pageContext.request.contextPath}/resources/img/welcome.png" width="450">
				</p>
				<p class="p2">
					<img alt="welcome_logo" src="${pageContext.request.contextPath}/resources/img/txt_join.png" width="320">
				</p>
				<ul>
					<li>
						<button class="custom-btn btn-16 btn-16-1" id="btn-16-1" onclick="location.href='/member/send'">
							<img alt="img_idJoin" src="${pageContext.request.contextPath}/resources/img/join_type_id.png" width="400">
						</button>
					</li>
					<li>
						<button class="custom-btn btn-16 btn-16-2" id="btn-16-2" onclick="location.href='#'">
							<img alt="img_idJoin" src="${pageContext.request.contextPath}/resources/img/kakao_start.png" width="400">
						</button>
					</li>
				</ul>
			</div>
			
			<div class="section3">
				<p>© HUMAN COMMUNITY All Rights Reserved.</p>
			</div>
			
		</div>
		
	</main>
	<script>
		$("#btn-16-2").click(function () {
			alert("서비스 준비중");
			return false;
		});
	</script>
</body>

</html>