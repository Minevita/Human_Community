<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- head 헤드 -->
<jsp:include page="../includes/head.jsp" />
</head>
<body>

<!-- header 헤더 -->
<jsp:include page="../includes/header.jsp" />
<!-- list main -->
<main class="board_list">
               <!-- Begin Page Content -->
               <div class="container-fluid">
                   <!-- Page Heading -->
                   <!-- DataTales Example -->
                   <div class="card shadow mb-4">
	                   <div class="row">
		                   <div class="col-1">
		                   <!-- 1 of 3 -->
		                   </div>
	                       <div class="card-body">
		                       <div class="card-header py-3">
									<h1 class="h3 mb-2 text-gray-800">
									<!-- 카테고리에 따라 게시판 제목 달라져야함 추후 수정필요 -->
									<c:choose>
										<c:when test="${page.cri.category eq 1}"> <img src="${pageContext.request.contextPath}/resources/img/bullhorn_solid.svg" width="50"> 공지 </c:when>
										<c:when test="${page.cri.category eq 2}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 포럼 </c:when>
										<c:when test="${page.cri.category eq 3}"> <img src="${pageContext.request.contextPath}/resources/img/edit_regular.svg" width="50"> 서적리뷰 </c:when>
										<c:when test="${page.cri.category eq 4}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 자유게시판 </c:when>
										<c:when test="${page.cri.category eq 5}"> <img src="${pageContext.request.contextPath}/resources/img/newspaper_regular.svg" width="50"> IT News </c:when>
										<c:when test="${page.cri.category eq 6}"> <img src="${pageContext.request.contextPath}/resources/img/desktop_solid.svg" width="50"> IT 정보 </c:when>
										<c:when test="${page.cri.category eq 7}"> <img src="${pageContext.request.contextPath}/resources/img/store_solid.svg" width="50"> 중고장터 </c:when>
										<c:otherwise> 잘못된 페이지 </c:otherwise>
									</c:choose>
									</h1>                       
		                       </div>
	                           <div class="table dataTables_wrapper">
		                           	<div class="row">
		                           		<div class="col-sm-12 col-md-12">
		                           			<div class="dataTables_length">
		                           				<div>
		                           				<label>페이지 수
		                           					<form action="board/list" id="amount" name="amount" method="get" >
			                           					<select onchange="if(this.value) location.href=(this.value);" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
			                           						<option hidden="hidden" value="list?pageNum=1&amount=${page.cri.amount}&category=${page.cri.category}">${page.cri.amount}</option>
				                           					<option value="list?pageNum=1&amount=5&category=${page.cri.category}">5</option>
				                           					<option value="list?pageNum=1&amount=10&category=${page.cri.category}">10</option>
				                           					<option value="list?pageNum=1&amount=15&category=${page.cri.category}">15</option>
				                           					<option value="list?pageNum=1&amount=20&category=${page.cri.category}">20</option>
		                           						</select>
		                           						<input type="hidden" name="keyword" id="keyword">
		                           						<input type="hidden" name="amount" value="searchNtn">
		                           						<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
			                            		<input type="hidden" name="amount" value="${page.cri.amount}">
			                            		<input type="hidden" name="category" value="${page.cri.category}">
		                           					</form>
		                           				</label>
		                           				</div>
				                           <a href="register?pageNum=${page.cri.amount}&amount=${page.cri.amount}&category=${page.cri.category}" class="btn btn-sm btn-primary float-right"> 새 글 쓰기</a>		                           				
		                           			</div>
		                           		</div>
		                           		<!-- search bar -->
		<%--                             	<div class="col-sm-12 col-md-6">
		                            		<form class="form-inline">
			                            		<select name="type" class="custom-select custom-select-sm form-control">
		                         					<option value="T">제목</option>
		                         					<option value="C">내용</option>
		                         					<option value="W">작성자</option>
			                            		</select>
			                            		<div id="dataTable_filter" class="input-group">
			                            			<input name="keyword" type="search" class="form-control form-conrol-sm" placeholder="Search">
			                            			<div class="input-group-append">
				                            			<button class="btn btn-primary" type="button">
				                                    		<img src="${pageContext.request.contextPath}/resources/img/search_solid.svg" width="15">
			                            				</button>
			                            			</div>
			                            		</div>
			                            		<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
			                            		<input type="hidden" name="amount" value="${page.cri.amount}">
			                            		<input type="hidden" name="category" value="${page.cri.category}">
		                            		</form>
		                            	</div> --%>
		                            </div>
			                            <div class="row">
			                            	<div class="col-sm-12">
				                                <table class="boardtable table--min">
				                                <sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal.memberVo" var="user"/>
	                                    			<input type="hidden" id="ulng" value="${user.longitude}">
	                                    			<input type="hidden" id="ulat" value="${user.latitude}">
												</sec:authorize>
				                                    <thead id="thead">
				                                        <tr>
				                                            <c:choose>
				                                            <c:when test="${page.cri.category eq 7}">
				                                            <th>사진</th>
			                                            	</c:when>
			                                            	<c:otherwise>
				                                            <th>글 번호</th>
			                                            	</c:otherwise>
				                                            </c:choose>
				                                            <th>제목</th>
				                                            <th>작성자</th>
				                                            <c:choose>
				                                            <c:when test="${page.cri.category eq 7}">
				                                            <th>나와의 거리</th>
			                                            	</c:when>
			                                            	<c:otherwise>
				                                            <th>댓글 수</th>
			                                            	</c:otherwise>
				                                            </c:choose>
				                                            <c:if test="${page.cri.category eq 7}">
				                                            <th>조회 수</th>
				                                            </c:if>
				                                            <th>작성일</th>
				                                        </tr>
				                                    </thead>
				                                    <tbody>
					                                    <c:forEach items="${list}" var="board">
					                                    	<tr>
					                                    		<c:choose>
					                                            <c:when test="${board.category eq 7}">
					                                    		<td style="text-align: center"><a href="get${page.cri.params}&bno=${board.bno}">
					                                    		<img src="${pageContext.request.contextPath}/display?fileName=${board.attachs[0].path}/s_${board.attachs[0].uuid}.${board.attachs[0].ext}" onerror="this.src='${pageContext.request.contextPath}/resources/img/load_fail.png'" style="max-width: 200px"></a></td>
				                                            	</c:when>
				                                            	<c:otherwise>
					                                    		<td><c:out value="${board.bno}" escapeXml="true" /></td>
				                                            	</c:otherwise>
					                                            </c:choose>
					                                    		<!-- 게시판 제목 -->
					                                    		<td><a href="get${page.cri.params}&bno=${board.bno}"><c:out value="${board.title}" /><b>[${board.replyCnt}]</b></a></td>
					                                    		<!-- 작성자 -->
					                                    		<td><c:out value="${board.writer}" escapeXml="true" /></td>
					                                    		<!-- 나와의 거리 -->
					                                    		<c:choose>
					                                            <c:when test="${board.category eq 7}">
					                                    		<td id="distance${board.bno}">
					                                    		</td>
					                                    		</c:when>
					                                    		<c:otherwise>
					                                    		</c:otherwise>
					                                    		</c:choose>
					                                    		<!-- 조회수 -->
					                                    		<td><img src="${pageContext.request.contextPath}/resources/img/eye_regular.svg" width="15">&nbsp;<c:out value="${board.see}" escapeXml="true" /></td>
					                                    		<!-- 작성일 -->
					                                    		<c:set var="regDate"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></c:set>
					                                    		<c:set var="now" value="<%=new java.util.Date()%>" />
																<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
					                                    		<c:choose>
						                                    		<c:when test="${regDate eq sysDate}">
						                                    		<td><fmt:formatDate value="${board.regDate}" pattern="HH:mm:ss"/></td>
						                                    		</c:when>
						                                    		<c:otherwise>
						                                    		<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd"/></td>
						                                    		</c:otherwise>
					                                    		</c:choose>
					                                    	</tr>
					                                    </c:forEach>
				                                    </tbody>
				                                </table>
			                                </div>
		                                <div class="paging">
		                          			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
		                               			<ul class="pagination">
													<li class="pagination_button page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
														<a href="list?pageNum=${page.cri.amount}&amount=${page.cri.amount}&category=${page.cri.category}" class="page-link">
															<img src="${pageContext.request.contextPath}/resources/img/angle_left_solid.svg" width="12" height="12">
														</a>
													</li>
													<li>
														<a>&nbsp;</a>
													</li>
													  <c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
														<li class="pagination_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
															<a href="list?pageNum=${p}&amount=${page.cri.amount}&category=${page.cri.category}" class="page-link" >${p}</a>
														</li>
														<li>
															<a>&nbsp;</a>
														</li>														
													  </c:forEach>
													<li class="pagination_button page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
			                              				<a href="list?pageNum=${page.cri.amount+1}&amount=${page.cri.amount}&category=${page.cri.category}" class="page-link">
			                              					<img src="${pageContext.request.contextPath}/resources/img/angle_right_solid.svg" width="12" height="12">
			                              				</a>
			                               			</li>
		                            			</ul>
		                           			</div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
						</div>
	                   <div class="col-3">
	                   <!-- 3 of 3 -->
	                   </div>					
					</div>
                <!-- /.container-fluid -->
<!-- footer 푸터 -->
<jsp:include page="../includes/footer.jsp" />
            </div>
            <!-- End of Main Content -->

</main>

</body>
<script>
var ulng = $("#ulng").val();
var ulat = $("#ulat").val();
/* 등록 */
$(function() {
	var result = '${result}';
	checkModal(result);
	history.replaceState({}, null, null);
	function checkModal(result) {
		if(!result || history.state) {
			return;
		}
		Number == 'success'== result ? "처리가 완료되었습니다" : "게시글" + result + "번이 등록되었습니다."
		$("#myModal .modal-body").text("게시글" + result + "번이 등록되었습니다.");
		$("#myModal").modal("show");
	}
	
	/* $(".distance").innerText = getDistance(lng1, lat1, lng2, lat2);
	// var distance = getDistance(lng1, lat1, lng2, lat2);
	console.log(getDistance(lng1, lat1, lng2, lat2)); */
});
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
		return (dist / 1000).toFixed(1) + ' km';
	}
	else {
		return dist.toFixed(1) + ' m';		
	}
};

// $("td.distance").each(function(i) {
// 	for (var j in datas) {
// 		str += "<input type='hidden' name='attaches["+i+"]." + datas[j] + "' value='" + $(this).data(datas[j]) + "'>";
// 	}
// })
// $(this).closest("form").append(str).submit();

<c:forEach items="${list}" var="board">
var bno = '${board.bno}';
console.log(bno);
$.getJSON("/board/getUMKs/"+bno).done(function(data) {
	console.log(data);
	var blng = data[0].longitude;
	var blat = data[0].latitude;
	
	var distance = getDistance(blng, blat, ulng, ulat);
	console.log(distance);
	$('#distance${board.bno}').append(distance);
});
</c:forEach>


/* amount */
// $(searchBtn).click(function(){
// 	let keyword = $(keyword).val();
// 	const select = $('#dataTable_length option:amount').val();
// 	location.href = "board/list?amount="+"keyword"+"&amount="+amount;
// })
 

</script>
    <!-- List Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>
<!-- foot 풋 -->
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/includes/foot.jsp" /> --%>
</body>

</html>