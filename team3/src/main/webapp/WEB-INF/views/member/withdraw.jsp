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
	<main class="info">
	
		<div class="section1">
			<img alt="info_logo" src="${pageContext.request.contextPath}/resources/img/members.png" width="335" style="margin-left: 300px; cursor: pointer;" onclick="location.href='/'">
		</div>
		<div class="row section2">
			<div class="col-xl-3 sub1" style="padding: 0;">
				<div class="wrap_menu">
					<div>
						<strong id="info_title" style="font-style: 23px;">내 정보관리</strong>
					</div>
					<div class="info_menu">
						<a href="/member/info">개인정보 변경</a>
					</div>
					<div class="info_menu" id="modify_pw">
						<a href="#">비밀번호 변경</a>
					</div>
					<div class="info_menu" id="withdraw">
						<a href="/member/withdraw">회원 탈퇴</a>
					</div>
				</div>
			</div>
			<div class="col-xl-9 sub2">
				<div><strong style="font-size: 54px;">회원탈퇴</strong><span>고객님의 본인확인을 진행해주세요</span></div>
				<p style="margin-top: 20px;">휴먼커뮤니티의 회원탈퇴 서비스 이용을 위해 본인확인이 필요합니다.</p>
				<div class="s3">
					<form method="post">
						<input type="hidden" value="<sec:authentication property="principal.memberVo.id"/>" name="id" id="id">
						<input type="hidden" value="<sec:authentication property="principal.memberVo.pw"/>" name="ckPw" id="ckPw">
						<input type="text" name="pw" id="pw" placeholder="비밀번호 입력">
						<sec:csrfInput/>
						<button type="submit">확인</button>
					</form>
				</div>
			</div>
		</div>
		
		<div class="section3">
			<p>© HUMAN COMMUNITY Corporation All Rights Reserved.</p>
		</div>
	</main>
	<script type="text/javascript">
	$(function () {
		$("#modify_pw").click(function () {
			alert("서비스 준비중");
			return false;
		});
	})
	</script>
</body>

</html>
