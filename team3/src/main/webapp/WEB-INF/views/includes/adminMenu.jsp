<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        
        <li class="nav-item">
          <a class="nav-link" href="../adminPage">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">로고</span>
          </a>
        </li>
        <li class="nav-item sidebar-category">
          <p>Menu</p>
          <span></span>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/list">
            <i class="mdi far fa-user menu-icon"></i>
            <span class="menu-title">회원 관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
            <i class="mdi far fa-clipboard menu-icon"></i>
            <span class="menu-title">게시판 관리</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <!-- <li class="nav-item"> <a class="nav-link" href="#">전체게시판</a></li> -->
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=1&type&keyword">공지사항</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=6&type&keyword">Q & A</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=2&type&keyword">포럼</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=3&type&keyword">서적리뷰</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=4&type&keyword">자유게시판</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=5&type&keyword">IT News & 정보</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=5&type&keyword">Tip & 강좌</a></li>
              <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()%>/board/list?pageNum=1&amount=10&category=7&type&keyword">중고장터</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="mdi fas fa-book-open menu-icon"></i>
            <span class="menu-title">학습메뉴</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="mdi mdi-chart-pie menu-icon"></i>
            <span class="menu-title">매출조회</span>
          </a>
          <!-- <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="mdi fa-envelope-open-text menu-icon"></i>
              <span class="menu-title">SMS</span>
            </a>
          </li> -->
        </li>
      </ul>
    </nav>