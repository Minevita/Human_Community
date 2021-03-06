<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="includes/head.jsp" />
	<title>Home</title>
</head>
<body>
	<jsp:include page="includes/header.jsp" />
	<main class="home2">
	
		<div class="wrapper1 row">
			<section class="section1 col-xl-9">
				<article>
					<div class="content sub1" style="margin-bottom: 15px;">
						<div class="container">
						  <div id="slide_box1" class="slide" style="
						          background-image:url('${pageContext.request.contextPath}/resources/img/생활코딩_2.png'); 
						        ">
						    <h3 id="slide_title2" onclick="window.open('about:blank').location.href='https://www.youtube.com/watch?v=dqcOa-fVWWo&list=PLuHgQVnccGMB5q5uJIDhLlcC2V6tyXhY6'">유튜브 바로가기</h3>
						  </div>
						  <div id="slide_box2" class="slide" style="background-image: url('${pageContext.request.contextPath}/resources/img/생활코딩_1.png');">
						    <h3 id="slide_title1" onclick="window.open('about:blank').location.href='https://www.youtube.com/watch?v=-dPXqgWQBGE&list=PLuHgQVnccGMAIluRRVsC1e79ri-dwnBmR'">유튜브 바로가기</h3>
						  </div>
						  <div id="slide_box3" class="slide" style="
						          background-image: url('${pageContext.request.contextPath}/resources/img/생활코딩.png');
						        ">
						    <h3 id="slide_title3" onclick="window.open('about:blank').location.href='https://www.youtube.com/channel/UCvc8kv-i5fvFTJBFAk6n1SA'">유튜브 
						    	<span style="color:#7DB249">바</span><span style="color:#2574eb">로</span><span style="color:#E0BFE6">가</span><span style="color:#FD6F22">기</span>
						    </h3>
						  </div>
						  <div id="slide_box4" class="slide" style="
						          background-image: url('${pageContext.request.contextPath}/resources/img/생활코딩_3.png');
						        ">
						    <h3 id="slide_title4" onclick="window.open('about:blank').location.href='https://www.youtube.com/watch?v=dPRtcRwKo-Y&list=PLuHgQVnccGMBB348PWRN0fREzYcYgFybf'">유튜브 바로가기</h3>
						  </div>
						  <div id="slide_box5" class="slide" style="
						          background-image: url('${pageContext.request.contextPath}/resources/img/생활코딩_4.png');
						        ">
						    <h3 id="slide_title5" onclick="window.open('about:blank').location.href='https://www.youtube.com/watch?v=tZooW6PritE&list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb'">유튜브 바로가기</h3>
						  </div>
						</div>
					</div>
					<div class="content sub2 row">
						<div class="col-xl-6 con_wrapper">
							<header class="con_head">
								<h3>공지사항</h3>
							</header>
							<ul class="list">
					        	<c:forEach items="${notice}" var="notice" begin="1" end="5">
				            	<li>
				            		<a href="board/get?bno=${notice.bno}">
				            			<div class="box title">
				            				<p class="title"><c:out value="${notice.title}" /></p>
				            				<span class="replyCnt">[${notice.replyCnt}]</span>
				            			</div>
				            			<div class="box info">
				            				<span><c:out value="${notice.nickname}" escapeXml="true" /></span>
				            				<span><fmt:formatDate value="${notice.regDate}" pattern="yy-MM-dd"/></span>
				            				
				            			</div>
				            		</a>
				            	</li>
				            	</c:forEach>
					        </ul>
						</div>
						<div class="col-xl-6 con_wrapper">
							<header class="con_head">
								<h3>Q&A</h3>
							</header>
							<ul class="list">
					        	<c:forEach items="${qa}" var="qa" begin="1" end="5">
				            	<li>
				            		<a href="board/get?bno=${qa.bno}">
				            			<div class="box title">
				            				<p class="title"><c:out value="${qa.title}" /></p>
				            				<span class="replyCnt">[${qa.replyCnt}]</span>
				            			</div>
				            			<div class="box info">
				            				<span><c:out value="${qa.nickname}" escapeXml="true" /></span>
				            				<span><fmt:formatDate value="${qa.regDate}" pattern="yy-MM-dd"/></span>
				            				
				            			</div>
				            		</a>
				            	</li>
				            	</c:forEach>
					        </ul>
						</div>
					</div>
					<div class="content sub3">
						<img alt="testImg2" src="${pageContext.request.contextPath}/resources/img/bx_banner1.gif" width="100%">
					</div>
					<div class="content sub4">
						<header class="con_head">
							<h3>자유게시판</h3>
						</header>
						<ul class="list">
				        	<c:forEach items="${free}" var="free" begin="1" end="10">
			            	<li style="text-align: left;">
			            		<a href="board/get?bno=${free.bno}">
			            			<div class="box title">
			            				<p class="title"><c:out value="${free.title}" /></p>
			            				<span class="replyCnt">[${free.replyCnt}]</span>
			            			</div>
			            			<div class="box info">
			            				<span><c:out value="${free.nickname}" escapeXml="true" /></span>
			            				<span><fmt:formatDate value="${free.regDate}" pattern="yy-MM-dd"/></span>
			            				
			            			</div>
			            		</a>
			            	</li>
			            	</c:forEach>
				        </ul>
					</div>
					<div class="content sub5" style="height: 157px;">
						<header class="con_head" style="margin-bottom: 10px;">
							<h3>뉴스</h3>
							<div class="pageing">
							  <div class="page_num">
								<strong class="now_num" id="dnaNum">1</strong>/<span class="total_num" id="dnaTotal">2</span>
							  </div>
							  <div class="btn_box">
								<button type="button" class="sp_main btn_prev" id="dna_prev"><span class="blind"></span></button>
								<button type="button" class="sp_main btn_next on" id="dna_next"><span class="blind"></span></button>
							  </div>
							</div>
						</header>
						<ul class="list_news">
				        	<li class="news1">
				        		<a href="https://dcnewsj.joins.com/article/25019679" target="_blank">
				        			<span class="img_box">
				        				<img alt="news1" src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202110/31/7522055d-93d9-422e-97d3-dc7cdb3b0064.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>일찍 찾아온 ‘반도체 겨울’…삼성·SK 수익성 빨간불 켜지나</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news1">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=224522" target="_blank">
				        			<span class="img_box">
				        				<img alt="news2" src="https://www.ddaily.co.kr/data/photos/cdn/20211043/art_1635560781.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>구멍 뚫린 국가 사이버보안··· 대우조선해양, 또 해킹당했나?</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news1">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=224482" target="_blank">
				        			<span class="img_box">
				        				<img alt="news3" src="https://www.ddaily.co.kr/data/photos/cdn/20211043/art_1635480632.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>[종합] "D램 의존도 낮춘다"…SK하이닉스, 낸드 이어 파운드리 인수</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news1">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=220574" target="_blank">
				        			<span class="img_box">
				        				<img alt="news4" src="https://www.ddaily.co.kr/data/photos/cdn/20210834/art_1629751894.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>[ESG를 위한 DX] 지속가능경영 해법, 다쏘시스템의 ESG 전략은?</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news2" style="display: none; margin: 0;">
				        		<a href="http://news.kmib.co.kr/article/view.asp?arcid=0016421327&code=61141211&sid1=eco&cp=nv2" target="_blank">
				        			<span class="img_box">
				        				<img alt="news5" src="http://image.kmib.co.kr/online_image/2021/1101/2021110109555286053_1635728152_0016421327.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>테이퍼링 시작? 서머타임 마지막 1주일 [3분 미국주식]</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news2" style="display: none;">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=224544" target="_blank">
				        			<span class="img_box">
				        				<img alt="news6" src="https://www.ddaily.co.kr/data/photos/cdn/20211144/art_1635718628.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>현대차 반도체 내재화 이번엔 이뤄질까 [IT클로즈업]</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news2" style="display: none;">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=224547" target="_blank">
				        			<span class="img_box">
				        				<img alt="news7" src="https://www.ddaily.co.kr/data/photos/cdn/20211144/art_1635725963.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>[PLAY IT] 고성능 노트북의 ‘모범생’…에이수스 '비보북프로' 써 보니</strong>
				        			</div>
				        		</a>
				        	</li>
				        	<li class="news2" style="display: none;">
				        		<a href="https://www.ddaily.co.kr/news/article/?no=224560" target="_blank">
				        			<span class="img_box">
				        				<img alt="news8" src="https://www.ddaily.co.kr/data/photos/cdn/20211144/art_1635729021.jpg" width="173">
				        			</span>
				        			<div class="txt_box">
				        				<strong>[주간 클라우드 동향/11월①] 티맥스소프트 인수전 뛰어든 클라우드 MSP 기업들</strong>
				        			</div>
				        		</a>
				        	</li>
				        </ul>
					</div>
					<div class="content sub6">
						<header class="con_head">
							<h3>서적리뷰</h3>
						</header>
						<ul class="list">
				        	<c:forEach items="${review}" var="review" begin="1" end="10">
			            	<li style="text-align: left;">
			            		<a href="board/get?bno=${review.bno}">
			            			<div class="box title">
			            				<p class="title"><c:out value="${review.title}" /></p>
			            				<span class="replyCnt">[${review.replyCnt}]</span>
			            			</div>
			            			<div class="box info">
			            				<span><c:out value="${review.nickname}" escapeXml="true" /></span>
			            				<span><fmt:formatDate value="${review.regDate}" pattern="yy-MM-dd"/></span>
			            				
			            			</div>
			            		</a>
			            	</li>
			            	</c:forEach>
				        </ul>
					</div>
				</article>
			</section>
		
			<section class="section2 col-xl-3" style="padding-bottom:19px;">
				<div id="sidebar">
				<div id="box" class="clearfix">
				  <div id="side">
				    
				  </div>
				  <div id="main">
				    
				  </div>
				</div>
				<div class="content login_wrap">
					<div>
						<div id="member" style="margin:0 auto; width: 218px; margin-top: 5px;">
						
							<sec:authorize access="isAnonymous()">
							<button class="custom-btn btn-5 btn-5-1" style="margin-top: 10px;" type="button" onclick="location.href='customLogin'"><span>HUMAN ID 로그인</span></button>
							<button class="custom-btn btn-5 btn-5-2" id="btnKakao" style="margin-top: 10px; margin-bottom: 6px;" type="button" onclick="location.href='#'"><img alt="kakao" src="${pageContext.request.contextPath}/resources/img/kakao.png" width="20"><span>카카오 로그인</span></button>
							<a href="<%=request.getContextPath()%>/member/type"><strong style="font-size: 13px;">회원가입</strong></a>
							<em>┃</em>
							<a class="link_find" href="#" style="font-size: 13px;" id="findId">아이디</a>
							<em>&#183;</em>
							<a class="link_find" href="#" style="font-size: 13px;" id="findPw">비밀번호 찾기</a>
							</sec:authorize>
							
							<sec:authorize access="isAuthenticated()">
								<div id="box_nickname">
									<strong><sec:authentication property="principal.memberVo.name"/></strong><p>님 안녕하세요!</p>
								</div>
								<div id="box_email">
									<strong><sec:authentication property="principal.memberVo.email"/></strong>
								</div>
								<div id="af_menu">
									<form action="/logout" method="post">
										<button id="btnLogout">
											로그아웃
										</button>
										<sec:csrfInput/>
									</form>
									<a href="/member/identify" id="link_mod" style="font-size: 14px;">
										회원정보
									</a>
								</div>
								
							</sec:authorize>
						</div>
					</div>
				</div>
				<div class="content sub2">
					<div class="rankBox">
					    <div class="rankBoxIn">
					    	<h5 class="rankBox_head" style="font-weight: bold;"><span style="color:rgb(200, 58, 56); margin-right:10px;">실시간</span><span style="color: #3b4890; margin-right: 7px;">북적이는</span><span style="color: #495057;">게시판</span></h5>
					        <ul>
					        	<c:forEach items="${free}" var="free" begin="1" end="10" >
				            	<li>
				            		<a href="board/list?bno=${free.bno}">
				            			<span></span>
				            			<h4 class="text-truncate small" style="color: #222;"><c:out value="${free.title}" escapeXml="ture"/></h4>
				            		</a>
				            	</li>
				            	</c:forEach>
					        </ul>
					    </div>
					</div>
				</div>
				<div class="content sub3"><img alt="test" src="${pageContext.request.contextPath}/resources/img/e_learning.gif" width="250" onclick="location.href='#'" style="cursor: pointer;"></div>
				<div class="content sub4">
					<h5>개발자 커뮤니티 사이트</h5>
					<div class="dev_site"><a href="https://okky.kr/" target="_blank">OKKY</a></div>
					<div class="dev_site"><a href="https://stackoverflow.com/" target="_blank">Stack Overflow</a></div>
					<div class="dev_site"><a href="https://github.community/" target="_blank">GitHub Community</a></div>
				</div>
				<div class="content sub5"><img alt="test" src="${pageContext.request.contextPath}/resources/img/side_banner.png" width="250" onclick="window.open('about:blank').location.href='https://data.seoul.go.kr/dataList/literacyList.do'" style="cursor: pointer;"></div>
			</section>
		</div>
		
		<div class="wrapper2">
			<div class="content market_box">
				<header class="con_head">
					<h3>중고장터</h3>
				</header>
				<ul class="con_body">
					<c:forEach items="${market}" var="market">
	            	<li style="text-align: left;">
	            		<a href="board/get?bno=${market.bno}">
	            			<span class="market_img market${market.bno}">
	            				<%-- <img src="${pageContext.request.contextPath}/display?fileName=${market.attachs[0].path}/s_${board.attachs[0].uuid}" onerror="this.src='${pageContext.request.contextPath}/resources/img/load_fail.png'" style="width:100%; height:100%; object-fit:cover;"> --%>
	            			</span>
	            			<div class="txt_box">
	            				<div class="sub_box">
	            					<strong style="margin-bottom: 5px;"><c:out value="${market.title}" /></strong>
	            					<div style="margin-bottom: 5px;"><c:out value="${market.content}" escapeXml="false" /></div>
	            					<div class="info_box">
	            						<span><c:out value="${market.nickname}" escapeXml="false" /></span>
	            						<span><fmt:formatDate value="${market.regDate}" pattern="yy-MM-dd"/></span>
	            					</div>
	            				</div>
	            			</div>
	            		</a>
	            	</li>
	            	</c:forEach>
				</ul>
			</div>
		</div>
		
		
	</main>
	<jsp:include page="includes/footer.jsp" />
	<script type="text/javascript">
	$(function () {
		setInterval(function() {

    	    var rankBoxIn = $('.rankBoxIn ul');
    	    
    	    var rankBoxRow = $('.rankBoxIn ul li:first');
    	    
    	    var ARea = function(){
    	    	rankBoxRow.appendTo(rankBoxIn).show(300);
    	    };
    	    
    	    $(rankBoxRow).hide(300, ARea);        

    	},2000);
		
		$("#dna_prev").click(function () {
			$("#dna_prev").css("background-position", "0px -109px");
			$("#dna_next").css("background-position", "-16px -109px");
			$(".news1").css("display", "");
			$(".news2").css("display", "none");
			$("#dnaNum").text("1");
		})
		
		$("#dna_next").click(function () {
			$("#dna_prev").css("background-position", "0px -129px");
			$("#dna_next").css("background-position", "-16px -129px");
			$(".news1").css("display", "none");
			$(".news2").css("display", "");
			$("#dnaNum").text("2");
		})
		
		function slidesPlugin(activeSlide = 2) {
			  const slides = document.querySelectorAll(".slide");

			  slides[activeSlide].classList.add("active");

			  for (const slide of slides) {
			    slide.addEventListener("click", () => {
			      clearActiveClasses();

			      slide.classList.add("active");
			    });
			  }

			  function clearActiveClasses() {
			    slides.forEach((slide) => {
			      slide.classList.remove("active");
			    });
			  }
			}

		slidesPlugin();
		
		$('#side').stick_in_parent();
	})
	<c:forEach items="${market}" var="market">
	var bno = '${market.bno}';
	console.log(bno);
	$.getJSON("/board/getAttachs/"+bno).done(function(data) {
		console.log(data);
		var str = "";
		str += "<img src='${pageContext.request.contextPath}/display?fileName=" + data[0].thumb;
		str += "' onerror=" + "this.src='${pageContext.request.contextPath}/resources/img/load_fail.png' ";
		str += "style=" + "'width:100%; height:100%; object-fit:cover;'" + ">";
		$(".market${market.bno}").append(str);
	});
	</c:forEach>
	
	//사이드바 스크롤
	const scrollHeight = 800;

	function sidebar(){
		if($(window).scrollTop() > scrollHeight){
			let top = $(window).scrollTop() - scrollHeight + 20;
			document.getElementById('sidebar').style.top = top +'px';
		}else{
			document.getElementById('sidebar').style.top = '1px';
		}
	}

	sidebar();

	$(window).scroll(()=>{
		sidebar();
	});
	
	$("#btnKakao").click(function () {
		alert("서비스 준비중");
		return false;
	});
	
	$("#findId").click(function () {
		alert("서비스 준비중");
		return false;
	});
	
	$("#findPw").click(function () {
		alert("서비스 준비중");
		return false;
	});
	
	
	</script>
</body>
</html>
