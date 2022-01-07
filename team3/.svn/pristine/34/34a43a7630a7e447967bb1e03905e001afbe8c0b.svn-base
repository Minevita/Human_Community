<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<jsp:include page="includes/adminHead.jsp" />
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>관리자페이지</title>

</head>
<body>
  <div class="container-scroller d-flex">
   	<jsp:include page="includes/adminMenu.jsp" />
  	<div class="container-fluid page-body-wrapper">
	<jsp:include page="includes/adminHeader.jsp" />
  <main>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <!-- left chart end -->
            <div class="col-12 col-xl-6 grid-margin stretch-card">
              <div class="row w-100 flex-grow">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <p class="card-title"><h4>매출 차트</h4></p>
                      <p class="text-muted">25% more traffic than previous week</p>
                      <div class="row mb-3">
                        <div class="col-md-7">
                          <div class="d-flex justify-content-between traffic-status">
                            <div class="item">
                              <p class="mb-">Users</p>
                              <h5 class="font-weight-bold mb-0">93,956</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Bounce Rate</p>
                              <h5 class="font-weight-bold mb-0">58,605</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Page Views</p>
                              <h5 class="font-weight-bold mb-0">78,254</h5>
                              <div class="color-border"></div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-5">
                          <ul class="nav nav-pills nav-pills-custom justify-content-md-end" id="pills-tab-custom"
                            role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" id="pills-home-tab-custom" data-toggle="pill"
                                href="#pills-health" role="tab" aria-controls="pills-home" aria-selected="true">
                                Day
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-profile-tab-custom" data-toggle="pill" href="#pills-career"
                                role="tab" aria-controls="pills-profile" aria-selected="false">
                                Week
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-contact-tab-custom" data-toggle="pill" href="#pills-music"
                                role="tab" aria-controls="pills-contact" aria-selected="false">
                                Month
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <canvas id="audience-chart"></canvas>
                    </div>
              <!-- 결제 버튼 -->
              <button class="btn-warning" id="btn-payment" onclick="location.href='payment'">결제하기(테스트)</button>
                  </div>
                </div>
              </div>  
            </div>
            <!-- left chart end -->
            <!-- right chart start -->
            <div class="col-12 col-xl-6 grid-margin stretch-card">
              <div class="row w-100 flex-grow">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <p class="card-title"><h4>방문 차트</h4></p>
                      <p class="text-muted">25% more traffic than previous week</p>
                      <div class="row mb-3">
                        <div class="col-md-7">
                          <div class="d-flex justify-content-between traffic-status">
                            <div class="item">
                              <p class="mb-">Users</p>
                              <h5 class="font-weight-bold mb-0">93,956</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Bounce Rate</p>
                              <h5 class="font-weight-bold mb-0">58,605</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Page Views</p>
                              <h5 class="font-weight-bold mb-0">78,254</h5>
                              <div class="color-border"></div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-5">
                          <ul class="nav nav-pills nav-pills-custom justify-content-md-end" id="pills-tab-custom"
                            role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" id="pills-home-tab-custom" data-toggle="pill"
                                href="#pills-health" role="tab" aria-controls="pills-home" aria-selected="true">
                                Day
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-profile-tab-custom" data-toggle="pill" href="#pills-career"
                                role="tab" aria-controls="pills-profile" aria-selected="false">
                                Week
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-contact-tab-custom" data-toggle="pill" href="#pills-music"
                                role="tab" aria-controls="pills-contact" aria-selected="false">
                                Month
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <canvas id="audience-chart2"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center justify-content-between flex-wrap">
                        <p class="card-title">신규 게시글 차트</p>
                        <p class="text-success font-weight-medium">20.15 %</p>
                      </div>
                      <div class="d-flex align-items-center flex-wrap mb-3">
                        <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">$22.736</h5>
                        <p class="text-muted mb-0">Avg Sessions</p>
                      </div>
                      <canvas id="balance-chart" height="130"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center justify-content-between flex-wrap">
                        <p class="card-title">신규 회원 차트</p>
                        <p class="text-success font-weight-medium">45.39 %</p>
                      </div>
                      <div class="d-flex align-items-center flex-wrap mb-3">
                        <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">17.247</h5>
                        <p class="text-muted mb-0">Avg Sessions</p>
                      </div>
                      <canvas id="task-chart" height="130"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- right chart end -->
          </div>
        </div>
        <!-- board start -->
         <div class="container-fluid">
                
                <input type="hidden" name="amount" value="${page.cri.amount}">
                
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                     <div class="card-header py-3">
						<h1 class="h3 mb-2 text-gray-800">새로운 글</h1>                       
			            <h6 class="m-0 font-weight-bold text-primary float-left mt-2"></h6>
			         </div>
                        <div class="card-body">
                            <div class="table dataTables_wrapper">
                            	<div class="row">
                            		<div class="col-sm-12 col-md-6">
                            		</div>
                            	<div class="col-sm-12 col-md-6">
                            		<form class="form-inline">
                            		<input type="hidden" name="pageNum" value="${page.cri.category}">
                            		<input type="hidden" name="amount" value="${page.cri.amount}">
                            		<input type="hidden" name="category" value="${page.cri.category}">
                            		</form>
                            	</div>
                            </div>
	                            <div class="row">
	                            	<div class="col-sm-12">
		                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                                    <thead>
		                                        <tr>
		                                            <th>번호</th>
		                                            <th>제목</th>
		                                            <th>작성자</th>
		                                            <th>카테고리</th>
		                                            <th>조회수</th>
		                                            <th>작성일</th>
		                                            <th>수정일</th>
		                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach items="${list}" var="board">
			                                    	<tr>
			                                    		<td><c:out value="${board.bno}" escapeXml="true" /></td>
			                                    		<td><a href="board/get?bno=${board.bno}"><c:out value="${board.title}" /> <b>[${board.replyCnt}]</b> </a></td>
			                                    		<td><c:out value="${board.nickname}" escapeXml="true" /></td>
			                                    		<td><c:out value="${board.category}" escapeXml="true" /></td>
			                                    		<td><c:out value="${board.see}" escapeXml="true" /></td>
			                                    		<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd"/></td>
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
        <!-- board end -->
        <!-- content-wrapper ends -->
        <!-- partial -->
      </div>
     <!-- main-panel ends -->
    </main>
    <script>
    	
    </script>
    <jsp:include page="includes/footer.jsp" />
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
</body>

</html>