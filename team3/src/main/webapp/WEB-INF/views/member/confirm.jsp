<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../includes/head.jsp" />
</head>

<body>
	<main class="join_confirm">
		<div class="section_wrapper">
		
			<div class="section1">
			</div>
			
			<div class="section2">
			<p>${confirmPN}</p>
				<form method="post" class="form-group" id="confirmForm">
				<sec:csrfInput/>
					<p>인증번호 입력</p>
					<input type="text" name="authKey" id="authKey" class="form-control" placeholder="인증번호 입력">
					<p class="msg text-primary" id="phoneCkMsg"></p>
					<div class="row">
						<div class="col">
							<button class="btn btn-success">확인</button>
						</div>
					</div>
				</form>
				<c:if test="${param.result eq 'fail'}">
					<p>인증번호가 틀렸습니다</p>
				</c:if>
			</div>
			
			<div class="section3">
			</div>
			
		</div>
		
	</main>
	<script>
	</script>
</body>

</html>