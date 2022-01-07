<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../includes/head.jsp" />
</head>

<body>
	<main class="login">
		<div class="section_wrapper">
			<div class="section1" style="text-align: center;">
				<img alt="logo" src="${pageContext.request.contextPath}/resources/img/Logo.png" onclick="location.href='/'" style="cursor: pointer;">
			</div>
			
			<div class="section2">
				<form class="formLogin" method="post" action="/login">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				    <div class="form-group">
				        <input type="text" class="form-control form-control-lg form-control-user"
				            name="username" id="id" 
				            placeholder="아이디">
				    </div>
				    <div class="form-group">
				        <input type="password" class="form-control form-control-lg form-control-user"
				        	name="password" id="pw"
				            placeholder="비밀번호">
				    </div>
				    <div class="form-group">
				        <div class="custom-control custom-switch small">
				            <input type="checkbox" class="custom-control-input" id="customCheck" name="remember-me">
				            <label class="custom-control-label" for="customCheck">로그인 저장</label>
				            <c:if test="${LoginFailMessage!=null}">
								<p style="color: red;"> 알림 : <c:out value="${LoginFailMessage}"/> </p>
							</c:if>
				        </div>
				    </div>
				    <div class="text-danger" id="error_msg" style="display:none">
						<strong id="error_type"></strong>를 입력해주세요.
					</div>
				    
				    <sec:csrfInput/>
				    
				    <button id="btnLogin">
				        로그인
				    </button>
				</form>
			</div>
			
			<div class="section3">
				<a href="<%=request.getContextPath()%>/member/type">회원가입</a>
				<span> │ </span>
				<a href="#" id="findId">아이디 찾기(준비중)</a>
				<span> · </span>
			    <a href="#" id="findPw">비밀번호 찾기(준비중)</a>
			</div>
		</div>
	</main>
	
	<script>
			$(function() {
				$("#btnLogin").click(function () {
					var id = $("#id").val();
					var pw = $("#pw").val();
					
					if(id==null || id=="") {
						$("#error_type").text("아이디");
						$("#error_msg").attr("style", "");
						return false;
					} else if(pw==null || pw == "") {
						$("#error_type").text("비밀번호");
						$("#error_msg").attr("style", "");
						return false;
					}
					
				})
				
				$("#findId").click(function () {
					alert("서비스 준비중");
					return false;
				});
				
				$("#findPw").click(function () {
					alert("서비스 준비중");
					return false;
				});
				
			});
		</script>
</body>

</html>