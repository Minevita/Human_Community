<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<div class="head">
	
		<h1>
			<a href="/">
				<img alt="mainLogo" src="${pageContext.request.contextPath}/resources/img/Logo2.png" width="310">
			</a>
		</h1>
		
		<div class="wrap_search">
			<form id="searchform" name="type" action="board/list">
				<div class="top_search">
					<select name="type">
           					<option value="T">제목</option>
           					<option value="C">내용</option>
           					<option value="W">작성자</option>
              		</select>
              		<div id="dataTable_filter">
               			<input id="keyword" name="keyword" type="search" placeholder="통합검색">
               		</div>
           			<button class="custom-btn btn-3" id="btn_search" type="submit" style="border: 0; outline: 0; margin-left: 5px; position: absolute; margin-top: 5px;">
           				<span>검색</span>
           			</button>
				</div>
			</form>
		</div>
		
	</div>
</header>
