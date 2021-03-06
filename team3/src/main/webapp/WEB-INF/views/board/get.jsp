<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags />
</head>
<!-- header 헤더 -->
<jsp:include page="../includes/header.jsp" />
<!-- get main -->
<main class="board_get">
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="contents">
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"></h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
							<c:choose>
								<c:when test="${board.category eq 1}"> <img src="${pageContext.request.contextPath}/resources/img/bullhorn_solid.svg" width="50"> 공지 </c:when>
								<c:when test="${board.category eq 2}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 포럼 </c:when>
								<c:when test="${board.category eq 3}"> <img src="${pageContext.request.contextPath}/resources/img/edit_regular.svg" width="50"> 서적리뷰 </c:when>
								<c:when test="${board.category eq 4}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 자유게시판 </c:when>
								<c:when test="${board.category eq 5}"> <img src="${pageContext.request.contextPath}/resources/img/newspaper_regular.svg" width="50"> IT News </c:when>
								<c:when test="${board.category eq 6}"> <img src="${pageContext.request.contextPath}/resources/img/desktop_solid.svg" width="50"> IT 정보 </c:when>
								<c:when test="${board.category eq 7}"> <img src="${pageContext.request.contextPath}/resources/img/store_solid.svg" width="50"> 중고장터 </c:when>
								<c:otherwise> 잘못된 페이지 </c:otherwise>
							</c:choose>
                        </div>
                       <div class="card-body">
                        	<form method="post">
                        		<div class="form-group">
                        			<input class="form-control" id="nickname" name="nickname" readonly value="${board.nickname}">
		                           <input class="form-control" type="text" id="regDate" name="regDate" readonly value="${board.regDate} 작성 ${board.updateDate} 수정됨">
	                           </div>
                        		<div class="form-group">
                        			<div>
	                        			<a># ${board.bno}</a>
	                        			<div>
	                        				<img class="img-control" src="${pageContext.request.contextPath}/resources/img/comment_alt_regular.svg" width="15">${board.replyCnt}
	                        			</div>
                        			</div>
	                           </div>	                           	                           
	                        	<div class="form-group">
		                           <h3><input class="form-control" id="title" name="title" readonly value="${board.title}"></h3>
	                           </div>
	                           <div class="form-group">
	                           		<textarea class="form-control" id="content" name="content" readonly ><c:out value="${board.content}" escapeXml="false" /></textarea>
	                           </div>
	                           <c:if test="${board.category eq 7}">             
	                           <div class="form-group" id="location">
		                           <label for="staticMap" class="text-dark font-weight-bold">판매희망위치</label>
		                           <div id="staticMap" name="staticMap" style="width:600px;height:350px;"></div>
	                           </div>
	                           </c:if>                      
	                           <sec:authentication property="principal" var="pinfo"/>
	                           <sec:authorize access="isAuthenticated()">
	                           <c:if test="${pinfo.username == board.writer}">
	                           <sec:csrfInput/>
	                           <a class="btn btn-warning" id="modify" href="modify${cri.params}&bno=${board.bno}">수정</a>
	                           </c:if>
	                           </sec:authorize>
								<a class="btn btn-primary" id="list" href="list${cri.params}">목록</a>
							</form>
                        </div>
                    </div>
                    
                    <!-- File -->
                   <div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
						</div>
						<div class="card-body">
							<div class="uploadResult">
								<ul class="list-group">
								</ul>
							</div>
						</div>
					</div>
                    
   <!-- reply--> 
					<div class="card shadow mb-4">
						<div class="card-header py-3 clearfix">
							<h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-comments"></i> Reply</h6>
						</div>
						
						<!-- reply writer 부분 시작!!!-->
						<div class="card-body">
							<div class="uploadResult">
							<!-- 	<ul class="list-group"> -->
								<sec:authorize access="isAuthenticated()">
									<div class="modal-body" id="replyWrite">
										<div class="form-group">
											<label for="reply" class="text-dark font-weight-bold ">Reply</label>
											<input class="form-control" id="reply" name="reply" placeholder="댓글을 입력해주세요">
										</div>
										<div class="form-group">
											<label for="replyer" class="text-dark font-weight-bold ">Replyer</label>
											<input class="form-control" id="writer" name="writer" readonly value="${pinfo.username}" onerror="value='로그인이 필요합니다'">
										</div>
									</div>
									<div class="modal-footer text-right">
										<div class="btns">
											<button class="btn btn-primary " id="btnReg">등록</button>
											<button class="btn btn-warning " id="btnMod">수정</button>
											<button class="btn btn-danger " id="btnRmv">삭제</button>
										</div>
									</div>
								</sec:authorize>
								<!-- </ul> -->
							</div>
						</div>
						<!-- reply writer 부분 끝!!!-->
						
						<ul id="replyUL" class="list-group list-group-flush">
						</ul>	
						<div class="card-footer text-center">
							<button class="btn btn-primary btn-block" id="btnShowMore">더보기</button>
						</div>
					</div>
					<!-- end of reply-->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
<!-- footer 푸터 -->
<jsp:include page="../includes/footer.jsp" />
            </div>
            <!-- End of Main Content -->
</main>
</body>
	
<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1146b342dae754005cba31483074cff1"></script>
<script>
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf").attr("content");

	$(document).ajaxSend(function(e, xhr) {
	xhr.setRequestHeader(csrfHeader,csrfToken);
	})
	$(function(){
		console.log(replyService);

		var bno = '${board.bno}';
		var $ul = $("#replyUL");

		showList();
		replyWriteShow();
		
		function showList(lastRno, amount){
			replyService.getList({bno:bno, lastRno :lastRno, amount: amount},
				function(data) {
					console.log(data)
					if(!data) {
						 return;
					}

				if(data.length == 0) {
					$("#btnShowMore").text("댓글이 없습니다").prop("disabled", true);
					return;
				}

				var str = "";
				for(var i in data){
					str += '<li class="list-group-item" data-rno="'+ data[i].rno + '"> '
					str += '	<div class="clearfix">' 
					str += '		<div class="float-left text-dark font-weight-bold">' +data[i].writer + '</div> '
					str += '		<div class="float-right">' + replyService.displayTime(data[i].replyDate) + '</div>'
					str += '	</div> '
					str += '	<div>' + data[i].reply +'</div>'
					str += '</li>'
				}
				$("#btnShowMore").text("더보기").prop("disabled", false);
				// console.log(str);
				$ul.append(str);
			}
		)
	}

	
	function replyWriteShow() {
		<sec:authorize access="isAnonymous()">
		if(confirm("로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?")) {
			location.href = "/customLogin?pageNum=${page.cri.amount+1}&amount=${page.cri.amount}&category=${page.cri.category}"
		}
		else {
			return;
		}
		</sec:authorize>
		$("#reply").val("");
		// $("#grade option:eq(0)").attr("selected", "selected");
		$("#replyDate").closest("div").hide();
		$(".btns button").hide();
		$("#btnReg").show();
	}
	
	
	// **************************** reply frm add **********************************
		$("#btnRegFrm").click(function() {
		<sec:authorize access="isAnonymous()">
		if(confirm("로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?")) {
			location.href = "/customLogin?pageNum=${page.cri.amount+1}&amount=${page.cri.amount}&category=${page.cri.category}"
		}
		else {
			return;
		}
		</sec:authorize>
		$("#reply").val("");
		$("#replyDate").closest("div").hide();
		$(".btns button").hide();
		$("#btnReg").show();
		$("#myModal").modal("show");
	})


	// ***************************** add *******************************************
	$("#btnReg").click(function() {
		

		if($("#reply").val() == ""){
			alert("댓글 내용을 입력해 주세요.");
			$("#reply").focus();
			return;
		}
		
		if($("#replyer").val() == ""){
			alert("댓글 작성자를 입력해 주세요.");
			$("#replyer").focus();
			return;
		}
		
		
		var reply = {reply:$("#reply").val(), writer : $("#writer").val(), bno: bno};
		replyService.add(reply, 
				function(data) {
					alert(data)
					var count = $ul.find("li").length;
					$ul.html("");
// 					$("#myModal").find("input").val("");
// 					$("#myModal").modal("hide");
					
					showList(0, count + 1);
				}
			);
			
			replyWriteShow();
		})
	//************************* get *********************************************
	$ul.on("click","li",function() {
		// alert($(this).data("rno"));
		var rno = $(this).data("rno");
		replyService.get(rno, function(data){
			$("#reply").val(data.reply);
			$("#writer").val(data.writer);
			$("#replyDate").val(replyService.displayTime(data.replyDate)).prop("readonly", true).closest("div").show();
			$(".btns button").hide();
			$("#btnMod, #btnRmv").show();
			$("#replyWrite").data("rno", data.rno);
		});
	})

	//*************************** modify ***************************************
		$("#btnMod").click(function() {
			var reply = {reply:$("#reply").val(), rno : $("#replyWrite").data("rno"), writer : $("#writer").val()};
			replyService.modify(reply, function(data) {
				alert(data);
				//$("#myModal").modal("hide");
				// showList();
				$ul.find("li").each(function() {
					if($(this).data("rno") == reply.rno) {
						$(this).children().eq(0).find("div").first().text(reply.writer);
						$(this).children().eq(1).text(reply.reply);
					}
				})
			})
			
			replyWriteShow();
		})
	//************************** remove *****************************************
	$("#btnRmv").click(function() {
		var rno = $("#replyWrite").data("rno");
		replyService.remove(rno,function(data) {
			alert(data)
			/* $("#myModal").modal("hide"); */
			// showList();
			$ul.find("li").each(function() {
				if($(this).data("rno") == rno) {
					$(this).remove();
				}
			})
		})
	});

	//************************** 더보기 버튼  *************************************
	$("#btnShowMore").click(function() {
		var lastRno = $ul.find("li:last").data("rno");
		// alert(lastRno);
		showList(lastRno);
	})
	
	// 첨부파일 불러오기  (비동기 통신시 url생략시 내 url 따라감)
	$.getJSON("/board/getAttachs/"+bno).done(function(data) {
		console.log(data);
		showUploadFile(data);
	}) 


	function showImage(fileCallPath) {
		$("#pictureModal")
			.find("img").attr("src","/display?fileName="+fileCallPath)
		.end().modal("show");
	}
    
	function showImage(fileCallPath) {
		$("#pictureModal")
			.find("img").attr("src","/display?fileName="+ fileCallPath)
		.end().modal("show");
	}
	function showUploadFile(resultArr) {
   		var str = "";
   		for(var i in resultArr) {
   	   		str += "<li class='list-group-item' "
   	   		str += "data-uuid='" + resultArr[i].uuid + "' " ;
   	   		str += "data-path='" + resultArr[i].path + "' " ;
   			str += "data-origin='" + resultArr[i].origin + "' " ;
   			str += "data-size='" + resultArr[i].size + "' " ;
   			str += "data-image='" + resultArr[i].image + "' " ;  
 	 	 		str += "data-mime='" + resultArr[i].mime + "' " ;
  		 		str += "data-ext='" + resultArr[i].ext + "' " ;
   	 		str += ">"
   			if(resultArr[i].image) {
   				str +="<a href='javascript:showImage(\"" + resultArr[i].fullPath +"\")'>"
   				str +="<img src='/display?fileName=" + resultArr[i].thumb +"'>";
  		 			str +="</a>"
  		 		}
   			else {
   				str += "<a href='/download?fileName=" + resultArr[i].fullPath + "'>";
   				str += "<i class='fas fa-paperclip'></i>" + resultArr[i].origin +"</a>";
   			}
   			str += "</li>" ;
   		}
   		$(".uploadResult ul").append(str);
	}
	$.getJSON("/board/getUMKs/"+bno).done(function(data) {
		console.log(data);
		showUMK(data);
		var lat = data[0].latitude;
		var lng = data[0].longitude;
		var markerPosition  = new kakao.maps.LatLng(lat, lng); 

		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
			position: markerPosition
		};

		var staticMapContainer  = document.getElementById('staticMap');// 이미지 지도를 표시할 div  
		var staticMapOption = { 
				center: new kakao.maps.LatLng(lat, lng), // 이미지 지도의 중심좌표
				level: 3, // 이미지 지도의 확대 레벨
				marker: marker // 이미지 지도에 표시할 마커 
		};  


		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	}) 
    
	function showUMK(resultArr) {
    	var str = "";
    	for(var i in resultArr) {
    		var str = "";
			str += '<input type="hidden" id="longitude" value="' + resultArr[i].longitude + '">'
			str += '<input type="hidden" id="latitude" value="' + resultArr[i].latitude + '">'
    	}
		$("#location").append(str);
   	}
});
	
</script>
</html>
