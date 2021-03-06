<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<div class="head">
	
		<h1>
			<a href="/">
				<img alt="mainLogo" src="${pageContext.request.contextPath}/resources/img/Logo.png" width="310">
			</a>
		</h1>
		
		<div class="wrap_search">
			<form id="searchform" name="type" action="board/list">
				<div class="top_search">
					<select name="type" style="font-family:'Nanum Gothic'; font-weight: bold;" >
           					<option value="T">제목</option>
           					<option value="C">내용</option>
           					<option value="W">작성자</option>
              		</select>
              		<div id="dataTable_filter">
               			<input id="keyword" name="keyword" type="search" placeholder="통합검색">
               		</div>
           			<button class="custom-btn btn-3" id="btn_search" type="submit" style="border: 0; outline: 0; margin-left: 5px; position: absolute; margin-top: 3px;">
           				<span>검색</span>
           			</button>
				</div>
			</form>
		</div>
		
	</div>
	<div class="gnb_bar">
		<div class="topMenu">
	      <ul>
	        <div class="topMenu_control">
	          <%-- <a href="<%=request.getContextPath()%>/index.html"><img src="<%=request.getContextPath()%>/images/logo_getamped.png" alt="logo_getamped.png"></a> --%>
	          <li>
	            <a href="#" id="list_title">학습메뉴</a>
	            <ul class="sub_menu">
	              <li><a href="#">Sub1</a></li>
	              <li><a href="#">Sub2</a></li>
	            </ul>
	          </li>
	          <li>
	            <a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=5&type&keyword" id="list_title">TECH</a>
	            <ul class="sub_menu">
	              <li><a href="#">IT News</a></li>
	              <li><a href="#">Tips</a></li>
	            </ul>
	          </li>
	          <li>
	            <a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=4&type&keyword" id="list_title">커뮤니티</a>
	            <ul class="sub_menu">
	              <li><a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=1&type&keyword">공지사항</a></li>
	              <li><a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=2&type&keyword">포럼</a></li>
	              <li><a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=3&type&keyword">서적리뷰</a></li>
	            </ul>
	          </li>
	          <li>
	            <a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=6&type&keyword" id="list_title">Q&A</a>
	          </li>
	          <li>
	            <a href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=7&type&keyword" id="list_title">중고시장</a>
	            <ul class="sub_menu">
	              <li><a href="#">Sub1</a></li>
	              <li><a href="#">Sub2</a></li>
	            </ul>
	          </li>
	        </div>
	      </ul>
	    </div>
		<!-- 어제 또는 오늘 등록된 게시글 갯수 -->
		<div>
		</div>
	</div>
	
		
</header>
