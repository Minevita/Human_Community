<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="includes/head.jsp" />
	<title>Home</title>
</head>
<body>
	<jsp:include page="includes/header.jsp" />
	<main class="home">
		<h1>임시 홈 화면</h1>
			
		<P>  The time on the server is ${serverTime}. </P>
		
		<sec:authorize access="isAnonymous()">
			<a href="customLogin">
			    <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인</span>
			</a>
			<a href="/join/type">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">회원가입</span>
			</a>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			<form action="/logout" method="post">
				<button>
					로그아웃
				</button>
				<sec:csrfInput/>
			</form>
			<a href="#">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">회원정보 수정(준비중)</span>
			</a>
		</sec:authorize>
		
		<p>로그인 성공시 아래에 유저 정보 출력됨</p>
		<p>테스트 계정 ID/PW => user1 / 1234(일반사용자) , member7 / 1234(회원) , admin9 / 1234(관리자)</p>
		<sec:authorize access="isAuthenticated()">
			<p>memberVo : <sec:authentication property="principal.memberVo"/></p>
			<p>nickname : <sec:authentication property="principal.memberVo.nickname"/></p>
			<p>id : <sec:authentication property="principal.username"/></p>
			<p>auths : <sec:authentication property="principal.memberVo.auths"/></p>
			<p>long : <sec:authentication property="principal.memberVo.longitude"/></p>
			<p>lat : <sec:authentication property="principal.memberVo.latitude"/></p>
		</sec:authorize>
		
		

	<a class="btn btn-primary" href="board/list?pageNum=1&amount=10&category=1&type&keyword">List</a>
	</main>
	<jsp:include page="includes/footer.jsp" />
	<script>
	function getDistance(lng1,lat1,lng2,lat2) {
		function deg2rad(deg) {
			return deg * Math.PI / 180;
		}
		
		function rad2deg(rad) {
			return rad * 180 / Math.PI; 
		}
		
		var theta = lng1 - lng2;
		var dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515 * 1609.344;
		
		if (dist >= 1000) {
			return (dist / 1000).toFixed(1);
		}
		else {
			return dist.toFixed(1);		
		}
	}
	console.log(getDistance(126.90614079269979, 37.51840252594354, 126.515721863183, 35.0620242254289));
	</script>
</body>
</html>
