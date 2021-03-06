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
				<div><strong style="font-size: 54px;">개인정보 변경</strong><span>고객님의 개인정보보호를 위해 최선을 다하겠습니다.</span></div>
				<form method="post">
				<input type="hidden" value="<sec:authentication property="principal.memberVo.id"/>" name="id">
					<ul>
						<li>
							<span class="member">아이디</span><span><sec:authentication property="principal.memberVo.id"/></span>
						</li>
						<li>
							<span class="member">이  름</span><span style="margin-left: 10px;"><input type="text" value="<sec:authentication property="principal.memberVo.name"/>" name="name"></span>
						</li>
						<li>
							<span class="member">닉네임</span><span><input type="text" value="<sec:authentication property="principal.memberVo.nickname"/>" name="nickname"></span>
						</li>
						<li>
							<span class="member">이메일</span><span><input type="text" value="<sec:authentication property="principal.memberVo.email"/>" name="email"></span>
						</li>
						<li>
							<span class="member">휴대폰</span><span><input type="text" value="<sec:authentication property="principal.memberVo.phone"/>" name="phone"></span>
						</li>
						<li>
							<span class="member">주  소</span><span style="margin-left: 13px;"><sec:authentication property="principal.memberVo.address"/></span>
						</li>
					</ul>
					<sec:csrfInput/>
					<button type="submit" id="btnMod">수정</button>
				</form>
				
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
		
		$("#btnMod").click(function () {
			alert("정보수정 후 재로그인 하셔야 됩니다.");
		});
		
		
	})
	</script>
</body>

</html>
