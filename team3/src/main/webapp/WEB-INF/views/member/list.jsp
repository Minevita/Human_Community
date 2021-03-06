<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- head 헤드 -->
<jsp:include page="../includes/adminHead.jsp" />
</head>
<body>
<div class="container-scroller d-flex">
	<jsp:include page="../includes/adminMenu.jsp" />
	<div class="container-fluid page-body-wrapper">
	<jsp:include page="../includes/adminHeader.jsp" />
	<main class="member_list">
	  <!-- Begin Page Content -->
	  <div class="container-fluid">
	     <!-- DataTales Example -->
	     <div class="card shadow mb-4">
	        <div class="card-header py-3">
				<h1 class="h3 mb-2 text-gray-800">회원 목록</h1>                       
	            <h6 class="m-0 font-weight-bold text-primary float-left mt-2"></h6>
	        </div>
	        <div class="card-body">
	          <div class="table dataTables_wrapper">
	          	<div class="row">
	          		<div class="col-sm-12 col-md-6">
	          			<div class="dataTables_length">
	          				<label>페이지 수
	          					<form action="board/list" id="amount" name="amount" method="get" >
	           					<select onchange="if(this.value) location.href=(this.value);" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
	            					<option value="list?pageNum=${page.cri.pageNum}&amount=5&category=${page.cri.category}">5</option>
	            					<option value="list?pageNum=${page.cri.pageNum}&amount=10&category=${page.cri.category}">10</option>
	            					<option value="list?pageNum=${page.cri.pageNum}&amount=15&category=${page.cri.category}">15</option>
	            					<option value="list?pageNum=${page.cri.pageNum}&amount=20&category=${page.cri.category}">20</option>
	          						</select>
	          						<input type="hidden" name="keyword" id="keyword">
	          						<input type="hidden" name="amount" value="searchNtn">
	          					</form>
	          				</label>
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
	                 <table class="boardtable table--min" width="100%" cellspacing="0">
	                     <thead id="thead">
	                         <tr>
	                             <th>아이디</th>
	                             <th>이메일</th>
	                             <th>가입일</th>
	                             <th> 상태 </th>
	                         </tr>
	                     </thead>
	                      <tbody>
	                      <c:forEach items="${list}" var="member">
	                      	<tr>
	                      		<td><a href="info"><c:out value="${member.id}" /></a></td>
	                      		<td><a href="email=${member.email}"><c:out value="${member.email}" /></a></td>
	                      		<td><fmt:formatDate value="${member.regDate}" pattern="yy-MM-dd"/></td>
	                      		<c:choose>
			                     	<c:when test="${member.status eq 0}"><td>탈퇴 회원</td></c:when>    		
			                     	<c:when test="${member.status eq 1}"><td>일반 회원</td></c:when>    		
			                     	<c:when test="${member.status eq 2}"><td>관리자</td></c:when>    		
	                      		</c:choose>
	                      		<%-- <td><fmt:formatDate value="${board.updateDate}" pattern="yy-MM-dd" var="date2"/>${date2}</td> --%>
	                      		<%-- <td><fmt:parseDate value="${System.currentTimeMillis()}" pattern="yy-MM-dd" var="date2"/>${date2}</td> --%>
	                      		<%-- <c:choose>
	                      			<fmt:parseDate value="${board.updateDate}" pattern="yy-MM-dd" var="date2"/>
	                      			<td>${date2}</td>
	                       		<c:when test="${serverTime eq board.updateDate.day}">
	                       		<td><fmt:formatDate value="${board.updateDate}" pattern="hh-mm-ss"/></td>
	                       		</c:when>
	                       		<c:otherwise>
	                       		<td><fmt:formatDate value="${board.updateDate}" pattern="yy-MM-dd"/></td>
	                       		</c:otherwise>
	                      		</c:choose> --%>
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
		 	<!-- /.container-fluid -->
		   	</div>
		<!-- End of Main Content -->
		</main>
	<!-- footer 푸터 -->
	<jsp:include page="../includes/footer.jsp" />
	</div>
</div>

<script>
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
});

/* amount */
$(searchBtn).click(function(){
	let keyword = $(keyword).val();
	const select = $('#dataTable_length option:amount').val();
	location.href = "board/list?amount="+"keyword"+"&amount="+amount;
})
 

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
<%-- <jsp:include page="../includes/foot.jsp" /> --%>
</body>

</html>