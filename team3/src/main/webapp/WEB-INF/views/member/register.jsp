<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../includes/head.jsp" />
</head>

<body>
	<main class="join_register">
		
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
				<form method="post" class="form-group" id="joinForm">
					<fieldset>
						<legend>회원가입</legend>
						<label for="id">아이디</label>
						<input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요">
						<button type="button" class="btn btn-warning" id="btnIdCk" idCheck="" tmpId="">아이디 중복체크</button>
						<p class="msg text-primary" id="idCkMsg">6~11자리의 영대,소문자 및 숫자<br>(첫글자는 영문 필수)</p>
						
						<label for="pw">비밀번호</label>
						<input type="password" name="pw" id="pw" class="form-control" pwdCheck="" placeholder="비밀번호를 입력해주세요">
						<p class="msg text-primary" id="pwMsg">5~10자리의 영소문자 및 숫자</p>
						
						<label for="pwdCk">비밀번호 확인</label>
						<input type="password" name="pwdCk" id="pwdCk" class="form-control" pwdCheck2="">
						<p class="msg text-danger" id="pwdCkMsg"></p>

						<label for="email">이메일</label>
						<input type="text" name="email" id="email" class="form-control" placeholder="ex) javaman@human.kr">
						<button type="button" class="btn btn-warning" id="btnEmailCk" emailCheck="" tmpEmail="">이메일 중복체크</button>
						<p class="msg" id="emailCkMsg"></p>
						
						<label for="name">이름</label>
						<input type="text" name="name" id="name" class="form-control" nameCheck="" placeholder="이름을 입력해주세요">
						<p class="msg text-primary" id="nameCkMsg">1~5자리 한글이름</p>
						
						<label for="nickname">닉네임</label>
						<input type="text" name="nickname" id="nickname" class="form-control" nicknameCheck="" placeholder="닉네임을 입력해주세요">
						<p class="msg text-primary" id="nicknameCkMsg">1~8자리 한글 닉네임</p>
						
						<label for="phone">휴대폰 번호</label>
						<input type="text" name="phone" id="phone" class="form-control" nameCheck="" readonly="readonly" value="${phone}">
						<p class="msg text-primary" id="phoneCkMsg"></p>
						
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="text" id="sample4_roadAddress" name="query" placeholder="도로명주소">
						<input type="hidden" id="longitude" placeholder="경도">
						<input type="hidden" id="latitude" placeholder="위도">
						<button class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
						<hr>
						
						<div class="row">
							<div class="col">
								<button class="btn btn-success" id="btnJoin">가입</button>
							</div>
							<div class="col">
								<a href="javascript:history.back();"><button class="btn btn-secondary" type="button">취소</button></a>
							</div>
						</div>
						
					</fieldset>
					<sec:csrfInput/>
				</form>
			</div>
			<div class="section3">
				<p>© HUMAN COMMUNITY All Rights Reserved.</p>
			</div>
		</div>
	</main>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			// ID 유효성 검사 => 중복 , 정규표현식[ 영문자(대,소)+숫자 , null 및 공백 방지 ]
			$("#btnIdCk").click(function() {
				var id = $("#id").val();
				var idCheck= RegExp(/^[a-zA-Z]+[a-zA-Z0-9]{5,10}$/);
				
				if(id) {
					if(!idCheck.test(id)) {
						$("#btnIdCk").attr("idCheck","N");
						$("#idCkMsg").attr("class","msg text-danger");
						$("#btnIdCk").next().text("사용할 수 없는 아이디");
						alert("사용할 수 없는 아이디 입니다.\n6~11자리의 영대,소문자 또는 숫자를 입력해주세요.\n(첫글자는 반드시 영문자)");
					} else {
						$.ajax("idValid?id="+id, {
							success : function(data) {
								if(data/1) {
									$("#btnIdCk").attr("idCheck","Y");
									$("#idCkMsg").attr("class","msg text-primary");
									$("#btnIdCk").attr("tmpId", id);
									$("#btnIdCk").next().text("사용 가능한 아이디");
									alert("사용 가능한 아이디 입니다");
								} else {
									$("#btnIdCk").attr("idCheck","N");
									$("#idCkMsg").attr("class","msg text-danger");
									$("#btnIdCk").next().text("사용 중인 아이디");
									alert("이미 사용중인 아이디 입니다");
								}
							}
						})
					}
				} else {
					alert("아이디를 입력해주세요");
					$("#idCkMsg").attr("class","msg text-danger");
					$("#btnIdCk").next().text("아이디 입력 필수");
				    $("#id").focus();
				}
			})
			
			// 비밀번호 유효성 검사 => 정규표현식[ 형식준수 , null 및 공백 방지 ]
			$("#pw").keyup(function() {
				var pwd = $("#pw").val();
				var pwdCheck= RegExp(/^[a-z0-9]{5,10}$/);
				
				if(pwd == null || pwd == "") {
					$("#pwdMsg").attr("class","msg text-danger");
					$("#pw").next().text("비밀번호를 입력해주세요");
				} else if(!pwdCheck.test(pwd)) {
					$("#pw").attr("pwdCheck", "N");
					$("#pwdMsg").attr("class","msg text-danger");
					$("#pw").next().text("사용 불가능한 비밀번호 입니다");
				} else {
					$("#pw").attr("pwdCheck", "Y");
					$("#pwdMsg").attr("class","msg text-primary");
					$("#pw").next().text("사용 가능한 비밀번호 입니다");
				}
			})
			
			// 입력한 비밀번호 일치확인
			$("#pwdCk").keyup(function() {
				var pwd = $("#pw").val();
				var pwdCk = $("#pwdCk").val();
				if(pwd) {
					if(pwd != pwdCk) {
						$("#pwdCk").attr("pwdCheck2", "N");
						$("#pwdCkMsg").attr("class","msg text-danger");
						$("#pwdCk").next().text("비밀번호가 일치하지 않습니다");
					} else {
						$("#pwdCk").attr("pwdCheck2", "Y");
						$("#pwdCkMsg").attr("class","msg text-primary");
						$("#pwdCk").next().text("비밀번호가 일치합니다");
					}
				}
			})
			
			// 이메일 유효성 검사 => 중복 , 정규표현식[ 형식준수 , null 및 공백 방지 ]
			$("#btnEmailCk").click(function() {
				var email = $("#email").val();
				var emailCheck= RegExp(/[a-z0-9]{1,}@[a-z0-9-]{1,}.[a-z0-9]{1,}/i);

				if(email) {
					if(!emailCheck.test(email)) {
						$("#btnEmailCk").attr("emailCheck","N");
						$("#emailCkMsg").attr("class","msg text-danger");
						$("#btnEmailCk").next().text("사용할 수 없는 이메일");
						alert("유효하지 않은 이메일 형식입니다");
					} else {
						$.ajax("emailValid?email="+email, {
							success : function(data) {
								if(data/1) {
									$("#btnEmailCk").attr("emailCheck","Y");
									$("#emailCkMsg").attr("class","msg text-primary");
									$("#btnEmailCk").attr("tmpEmail",email);
									$("#btnEmailCk").next().text("사용 가능한 이메일");
									alert("사용 가능한 이메일 입니다");
								} else {
									$("#btnEmailCk").attr("emailCheck","N");
									$("#emailCkMsg").attr("class","msg text-danger");
									$("#btnEmailCk").next().text("사용 중인 이메일");
									alert("이미 사용중인 이메일 입니다");
								}
							}
						})
					}
				} else {
					alert("이메일을 입력해주세요");
					$("#emailCkMsg").attr("class","msg text-danger");
					$("#btnEmailCk").next().text("이메일 입력 필수");
				    $("#email").focus();
				}
			})
			
			// 이름 유효성 검사 => 정규표현식[ 형식준수 , null 및 공백 방지 ]
			$("#name").keyup(function() {
				var name = $("#name").val();
				var nameCk= RegExp(/^[가-힣]{1,5}$/);
				
				if(name == null || name == "") {
					$("#nameCkMsg").attr("class","msg text-danger");
					$("#name").next().text("이름을 입력해주세요");
				} else if(!nameCk.test(name)) {
					$("#name").attr("nameCheck", "N");
					$("#nameCkMsg").attr("class","msg text-danger");
					$("#name").next().text("유효하지 않은 이름 입니다");
				} else {
					$("#name").attr("nameCheck", "Y");
					$("#nameCkMsg").attr("class","msg text-primary");
					$("#name").next().text("유효한 이름 입니다");
				}
			})
			
			// 닉네임 유효성 검사 => 정규표현식[ 형식준수 , null 및 공백 방지 ]
			$("#nickname").keyup(function() {
				var name = $("#nickname").val();
				var nameCk= RegExp(/^[가-힣]{1,8}$/);
				
				if(name == null || name == "") {
					$("#nicknameCkMsg").attr("class","msg text-danger");
					$("#nickname").next().text("닉네임을 입력해주세요");
				} else if(!nameCk.test(name)) {
					$("#nickname").attr("nicknameCheck", "N");
					$("#nicknameCkMsg").attr("class","msg text-danger");
					$("#nickname").next().text("유효하지 않은 닉네임 입니다");
				} else {
					$("#nickname").attr("nicknameCheck", "Y");
					$("#nicknameCkMsg").attr("class","msg text-primary");
					$("#nickname").next().text("유효한 닉네임 입니다");
				}
			})
			
			// 최종 회원가입 유효성 총 체크
			$("#btnJoin").click(function() {
				var idCheck = $("#btnIdCk").attr("idCheck");
				var pwdCheck = $("#pw").attr("pwdCheck");
				var pwdCheck2 = $("#pwdCk").attr("pwdCheck2");
				var emailCheck = $("#btnEmailCk").attr("emailCheck");
				var nameCheck = $("#name").attr("nameCheck");
				var nicknameCheck = $("#nickname").attr("nicknameCheck");
				var tmpId = $("#btnIdCk").attr("tmpId");
				var id = $("#id").val();
				var tmpEmail = $("#btnEmailCk").attr("tmpEmail");
				var email = $("#email").val();
				
				if(id == "") {
					alert("아이디를 입력해주세요");
					$("#id").focus();
					return false;
				}
				
				if(idCheck=="") {
					alert("아이디 중복체크를 해주세요");
					$("#btnIdCk").focus();
					return false;
				} else if(idCheck=="N") {
					alert("사용할 수 없는 아이디 입니다");
					$("#id").focus();
					return false;
				} else if(tmpId != id) {
					alert("새로운 아이디를 입력하셨습니다. 중복체크를 다시 해주세요");
					$("#btnIdCk").focus();
					return false;
				}
				
				if(pwdCheck=="") {
					alert("비밀번호를 입력해주세요");
					$("#pw").focus();
					return false;
				} else if(pwdCheck=="N") {
					alert("사용 불가능한 비밀번호입니다");
					$("#pw").focus();
					return false;
				}
				
				if(pwdCheck2=="") {
					alert("비밀번호 확인을 해주세요");
					$("#pwdCk").focus();
					return false;
				} else if(pwdCheck2=="N") {
					alert("비밀번호 확인이 틀렸습니다");
					$("#pwdCk").focus();
					return false;
				}
				
				if(email == "") {
					alert("이메일을 입력해주세요");
					$("#email").focus();
					return false;
				}
				
				if(emailCheck=="") {
					alert("이메일 중복체크를 해주세요");
					$("#btnEmailCk").focus();
					return false;
				} else if(emailCheck=="N") {
					alert("사용할 수 없는 이메일입니다")
					$("#email").focus();
					return false;
				} else if(tmpEmail != email) {
					alert("새로운 이메일을 입력하셨습니다. 중복체크를 다시 해주세요");
					$("#btnEmailCk").focus();
					return false;
				}
				
				if(nameCheck=="") {
					alert("이름을 입력해주세요");
					$("#name").focus();
					return false;
				} else if(nameCheck=="N") {
					alert("유효하지 않은 이름입니다");
					$("#name").focus();
					return false;
				}
				
				if(nicknameCheck=="") {
					alert("닉네임을 입력해주세요");
					$("#nickname").focus();
					return false;
				} else if(nicknameCheck=="N") {
					alert("유효하지 않은 닉네임입니다");
					$("#nickname").focus();
					return false;
				}
				
			})
			
		});

		/* 주소로 우편번호 받아오기 */
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                var zipCode = data.zonecode;

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = zipCode;
	                console.log(roadAddr);
	                console.log(zipCode);
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//	                 if(roadAddr !== ''){
//	                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//	                 } else {
//	                     document.getElementById("sample4_extraAddress").value = '';
//	                 }

//	                 var guideTextBox = document.getElementById("guide");
//	                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//	                 if(data.autoRoadAddress) {
//	                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//	                     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//	                     guideTextBox.style.display = 'block';

//	                 } else if(data.autoJibunAddress) {
//	                     var expJibunAddr = data.autoJibunAddress;
//	                     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//	                     guideTextBox.style.display = 'block';
//	                 } else {
//	                     guideTextBox.innerHTML = '';
//	                     guideTextBox.style.display = 'none';
//	                 }
	                getAddr();
	            }
	        }).open();
	    }
		/* 주소로 좌표 받아오기 */
		function getAddr(){
			$.ajax({
				 url :"https://dapi.kakao.com/v2/local/search/address.json"
				,headers: { 'Authorization': 'KakaoAK b7b01563bc519b04b71c588c0cc6f9a7'}
				,type:"get"
				,data:$("#sample4_roadAddress")
				,dataType:"json"
				,crossDomain:true
				,success:function(jsonStr){
					console.log(jsonStr);
					$("#list").html("");
					if(jsonStr != null){
						makeListJson(jsonStr);
					}
//	 				var errCode = jsonStr.results.common.errorCode;
//	 				var errDesc = jsonStr.results.common.errorMessage;
//	 				if(errCode != "0"){
//	 					alert(errCode+"="+errDesc);
//	 				} else {
//	 				}
				}
			    ,error: function(xhr, status, error){
			    	alert("에러발생");
			    }
			});
		}
		
		function makeListJson(jsonStr){
			var htmlStr = "";
			var lng = 0;
			var lat = 0;
//	 		htmlStr += "<table>";
			$(jsonStr.documents).each(function(){
				console.log(this.address_name);
				lng = this.x;
				lat = this.y;
				document.getElementById("longitude").value = lng;
	            document.getElementById("latitude").value = lat;
//	 			htmlStr += "<tr>";
//	 			htmlStr += "<td>"+this.address_name+"</td>";
//	 			htmlStr += "<td>"+this.x+"</td>";
//	 			htmlStr += "<td>"+this.y+"</td>";
//	 			htmlStr += "</tr>";
			});
//	 		htmlStr += "</table>";
//	 		$("#list").html(htmlStr);
		}
	</script>
	
</body>

</html>