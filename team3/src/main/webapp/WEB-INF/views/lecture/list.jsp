<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- head 헤드 -->
<jsp:include page="../includes/head.jsp" />
</head>


<!-- header 헤더 -->
<jsp:include page="../includes/header.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                
                <input type="hidden" name="amount" value="${page.cri.amount}">
                
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary float-left mt-2">Board List Page</h6>
                            <a href="register" class="btn btn-sm btn-primary float-right">Register New Board</a>
                        </div>
                        <div class="card-body">
                            <div class="table dataTables_wrapper">
                            	<div class="row">
                            		<div class="col-sm-12 col-md-6">
                            			<div class="dataTables_length" id="dataTable_length">
                            				<label>Show 
                            					<select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                            					<option value="5" name="amount">5</option>
                            					<option value="10" name="amount">10</option>
                            					<option value="15" name="amount">15</option>
                            					<option value="20" name="amount">20</option>
                            					</select> entries
                            				</label>
                            			</div>
                            		</div>
                            </div>
	                            <div class="row">
	                            	<div class="col-sm-12">
		                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                                    <thead>
		                                        <tr>
		                                            <th>강의명</th>
		                                            <th>강사</th>
		                                            <th>가격</th>
		                                            <th>등록일</th>
		                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach items="${list}" var="lecture">
			                                    	<tr>
			                                    		<td><a href="#"><c:out value="${lecture.title}" /></a></td>
			                                    		<td><c:out value="${lecture.writer}" escapeXml="true" /></td>
			                                    		<td><c:out value="${lecture.price}" escapeXml="true" /></td>
			                                    		<td><fmt:formatDate value="${lecture.regDate}" pattern="yy-MM-dd"/></td>
			                                    	</tr>
			                                    </c:forEach>
			                                    </tbody>
		                                </table>
	                                </div>
                                <div class="row">
                                	<div class="col-sm-12 col-md-5">
                                	</div>
                                		<div class="col-sm-12 col-md-7">
                                			<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
		                                		<ul class="pagination">
													  <li class="pagination_button page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
													  	<a href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}" class="page-link">Previous</a>
													  </li>
													  <c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
													  <li class="pagination_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
													  	<a href="list?pageNum=${p}&amount=${page.cri.amount}" class="page-link" >${p}</a>
													  </li>
													  </c:forEach>
													  
													  <li class="pagination_button page-item next ${page.next ? '' : 'disabled'}" id="dataTable_next">
		                                				<a href="list?pageNum=${page.cri.amount+1}&amount=${page.cri.amount}" class="page-link">Next</a>
		                                			</li>
                                				</ul>
                                			</div>
                                		</div>
                           			</div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->

<!-- footer 푸터             -->
<jsp:include page="../includes/footer.jsp" />

<script>

</script>
<!-- foot 풋 -->
<%-- <jsp:include page="../includes/foot.jsp" /> --%>
</body>

</html>