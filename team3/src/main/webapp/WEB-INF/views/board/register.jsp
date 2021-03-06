<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags />
</head>
<!-- header 헤더 -->
<jsp:include page="../includes/header.jsp" />
<!-- register main -->
<main class="board_register">
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
                    <h1 class="h3 mb-2 text-gray-800">Board Register</h1>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        <c:set value="${param.category}" var="category" />
							<c:choose>
								<c:when test="${category eq 1}"> <img src="${pageContext.request.contextPath}/resources/img/bullhorn_solid.svg" width="50"> 공지 등록 </c:when>
								<c:when test="${category eq 2}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 포럼 등록 </c:when>
								<c:when test="${category eq 3}"> <img src="${pageContext.request.contextPath}/resources/img/edit_regular.svg" width="50"> 서적리뷰 등록 </c:when>
								<c:when test="${category eq 4}"> <img src="${pageContext.request.contextPath}/resources/img/comment_regular.svg" width="50"> 자유게시판 등록 </c:when>
								<c:when test="${category eq 5}"> <img src="${pageContext.request.contextPath}/resources/img/newspaper_regular.svg" width="50"> IT News 등록 </c:when>
								<c:when test="${category eq 6}"> <img src="${pageContext.request.contextPath}/resources/img/desktop_solid.svg" width="50"> IT 정보 등록 </c:when>
								<c:when test="${category eq 7}"> <img src="${pageContext.request.contextPath}/resources/img/store_solid.svg" width="50"> 중고장터 등록 </c:when>
								<c:otherwise> 잘못된 페이지 </c:otherwise>
							</c:choose>
                        </div>
                        <div class="card-body">
                        	<form method="post">
                        	<sec:csrfInput/>
	                        	<div class="form-group">
		                           <label for="title" class="text-dark font-weight-bold">Title</label>
		                           <input class="form-control" id="title" name="title">
	                           </div>
	                           <div class="form-group">
		                           <label for="content" class="text-dark font-weight-bold">Content</label>
		                           <textarea rows="10" class="form-control" id="content" name="content"></textarea>
	                           </div>
	                           <div class="form-group">
		                           <sec:authentication property="principal" var="user"/>
		                           <input type="hidden" class="form-control" id="writer" name="writer" value="${user.username}">
		                           <input type="hidden" id="nickname" name="nickname" value="${user.memberVo.nickname}">
	                           </div>
	                           <div class="form-group">
		                           <input type="hidden" class="form-control" id="category" name="category" value="<c:out value="${category}"/>">
	                           </div>
	                           <c:choose>
	                           <c:when test="${category eq 7}">
	                           <div class="form-group location" id="location">
								   <label for="map" class="text-dark font-weight-bold">판매희망 위치</label>
								   <div id="map" name="map">
		                           <input type="hidden" id="sample4_postcode" placeholder="우편번호" disabled>
								   <input type="hidden" id="sample4_roadAddress" name="query" placeholder="도로명주소" disabled>
								   <input type="hidden" id="longitude" name="usedMKs[0].longitude" placeholder="경도">
								   <input type="hidden" id="latitude" name="usedMKs[0].latitude" placeholder="위도">
								   <button class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()">판매희망 위치설정</button>
										<div id="staticMap" style="width:600px;height:350px;"></div>
								   </div>
	                           </div>
	                           </c:when>
	                           <c:otherwise>
	                           </c:otherwise>
	                           </c:choose>
	                           <button class="btn btn-primary" id="btnSubmit">작성</button>
								<a class="btn btn-primary" href="list?pageNum=1&amount=10&category=${category}" id="list">목록</a>
                           </form>
                        </div>
                    </div>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
                        </div>
                        <div class="card-body">
                        	<div class="form-group uploadDiv">
                        		<label for="files" class="btn btn-primary px-4"><i class='fas fa-file mr-2'></i>파일</label>
	                            <input type="file" class="form-control d-none" id="files" name="files" multiple>
                           </div>
                           <div class="uploadResult">
	                           	<ul class="list-group">
	                           	</ul>
                           </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
<jsp:include page="../includes/footer.jsp" />

        </div>
        <!-- End of Content Wrapper -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1146b342dae754005cba31483074cff1"></script>
<script>
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	
// 	$(document).ajaxSend(function(e, xhr) {
// 		xhr.setRequestHeader(csrfHeader, csrfToken);
// 	})
	
	function showImage(fileCallPath) {
		$("#pictureModal")
			.find("img").attr("src","/display?fileName="+fileCallPath)
		.end().modal("show");
	}
	$(function() {
		var bno = '${board.bno}';
		
		var cloneObj = $(".uploadDiv").clone();
		
		var regex = /(.*?)\.(exe|sh|zip|alz)$/;
		var maxSize = 1024 * 1024 * 5;
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다");
				return false;
			}
			return true;
		}
		
		function showUploadedFile(resultArr) {
			var str = "";
			for(var i in resultArr) {
				str += "<li class='list-group-item' "
				str += "data-uuid='" + resultArr[i].uuid + "' ";
				str += "data-path='" + resultArr[i].path + "' ";
				str += "data-origin='" + resultArr[i].origin + "' ";
				str += "data-size='" + resultArr[i].size + "' "
				str += "data-image='" + resultArr[i].image + "' "
				str += "data-mime='" + resultArr[i].mime + "' "
				str += "data-ext='" + resultArr[i].ext + "' "
				str += ">"
				if(resultArr[i].image) {
					str += "<a href='javascript:showImage(\"" + resultArr[i].fullPath + "\")'>"
					str += "<img src='/display?fileName=" + resultArr[i].thumb + "'>";
					str += "</a>"
				}
				else {
					str += "<a href='/download?fileName=" + resultArr[i].fullPath + "'>";
					str += "<i class='fas fa-paperclip'></i> " + resultArr[i].origin + "</a>";
				}
				str += " <small><i data-file='"+ resultArr[i].fullPath + "' data-image='"+ resultArr[i].image + "' ";
				str += "class='fas fa-trash-alt text-danger'></i></small></li>";
			}
			$(".uploadResult ul").append(str);
		}
		
		$(".uploadDiv").on("change", "#files", function() {
			var files = $("#files")[0].files
			console.log(files);
			
			var formData = new FormData();
			for(var i in files) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("files", files[i]);
			}
			$.ajax("/upload", {
				processData:false,
				contentType:false,
				data:formData,
				dataType:'json',
				type:"POST",
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken)
				},
				success:function(result) {
					console.log(result)
					$(".uploadDiv").html(cloneObj.html());
					showUploadedFile(result);
				}
			})
		});
		
		$(".uploadResult").on("click", "small i", function() {
			var $li = $(this).closest("li"); 
			$.ajax("/deleteFile", {
			    type: "post",
			    data : {fileName:$(this).data("file"), image:$(this).data("image")},
			    beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken)
				},
			    success : function(result) {
		            $li.remove();
			    }
			})
			if(confirm("Remove this file?")) {
				$li.remove();
			}
		});
		$(".uploadResult").on("click", "small i", function() {
			var $li = $(this).closest("li"); 
			if(confirm("Remove this file?")) {
				$li.remove();
			}
		});
// 		지도 화면에 보이기
		
		
		// 글 작성 이벤트
		$("#btnSubmit").click(function() {
			event.preventDefault();
			
			var str = "";
			var datas = ["uuid", "path", "origin", "ext", "mime", "size", "image"];
			$(".uploadResult li").each(function(i) {
				for(var j in datas)
					str += "<input type='hidden' name='attachs["+i+"]."+ datas[j] +"' value='" + $(this).data(datas[j]) +"'>";
			});
			//console.log($(this).closest("form").append(str).html()); // 디버깅용
			$(this).closest("form").append(str).submit();
		})
	})
	function getMap(lng, lat) {
			var longitude = lng;
			var latitude = lat;
			
			var formData = new FormData();
			formData.append("longitude", longitude);
			formData.append("latitude", latitude);
			
// 			for(var i in files) {
// 				if(!checkExtension(files[i].name, files[i].size)) {
// 					return false;
// 				}
// 				formData.append("files", files[i]);
// 			}
			$.ajax("/uploadUMK", {
				processData:false,
				contentType:false,
				data:formData,
				dataType:'json',
				type:"POST",
				beforeSend : function (xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken)
				},
				success:function(result) {
					console.log(result);
					console.log(result[0].longitude);
					console.log(result[0].latitude);
				},
				error: function(){
			    	alert("에러발생");
			    }
			})
		};
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
// 					$("#list").html("");
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
				console.log(lng);
				console.log(lat);
				document.getElementById("longitude").value = lng;
	            document.getElementById("latitude").value = lat;
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
				console.log(staticMapOption);
				// 이미지 지도를 생성합니다
				var prevMap = staticMapContainer.querySelector("a");
				if(prevMap) {
					prevMap.parentNode.innerHTML = "";
				}
				var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
				console.log(staticMap);
//	 			htmlStr += "<tr>";
//	 			htmlStr += "<td>"+this.address_name+"</td>";
//	 			htmlStr += "<td>"+this.x+"</td>";
//	 			htmlStr += "<td>"+this.y+"</td>";
//	 			htmlStr += "</tr>";
			});
			getMap(lng, lat);
//	 		htmlStr += "</table>";
//	 		$("#list").html(htmlStr);
		}
		
		CKEDITOR.replace('content', {
			resize_enabled: false,
			uiColor: '#e8f3ff',
     	   toolbar: [
     		   {
     	          name: 'document',
     	          items: ['Print']
     	        },
     	        {
     	          name: 'clipboard',
     	          items: ['Undo', 'Redo']
     	        },
     	        {
     	          name: 'styles',
     	          items: ['Format', 'Font', 'FontSize']
     	        },
     	        {
     	          name: 'colors',
     	          items: ['TextColor', 'BGColor']
     	        },
     	        {
     	          name: 'align',
     	          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
     	        },
     	        '/',
     	        {
     	          name: 'basicstyles',
     	          items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'CopyFormatting']
     	        },
     	        {
     	          name: 'links',
     	          items: ['Link', 'Unlink']
     	        },
     	        {
     	          name: 'paragraph',
     	          items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
     	        },
     	        {
     	          name: 'insert',
     	          items: [ 'Table']
     	        },
     	        {
     	          name: 'tools',
     	          items: ['Maximize']
     	        },
     	        {
     	          name: 'editing',
     	          items: ['Scayt']
     	        }
     	      ],
                extraAllowedContent: 'h3{clear};h2{line-height};h2 h3{margin-left,margin-top}',


                // Adding drag and drop image upload.
                extraPlugins: 'print,format,font,colorbutton,justify,uploadimage',
                uploadUrl: '/ckupload.json?command=file&type=Files&responseType=json',

                // Configure your file manager integration. This example uses CKFinder 3 for PHP.
                /* filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
                filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images',
                filebrowserUploadUrl: '/ckupload?command=QuickUpload&type=Files', */
                filebrowserImageUploadUrl: '/ckupload?command=QuickUpload&type=Images&_token=' + $("meta[name='_csrf']").attr("content"), 

                height: 560,

                removeDialogTabs: 'image:advanced;link:advanced',
                removeButtons: 'PasteFromWord'
     	  /* filebrowserBrowseUrl: ""
 	      filebrowserImageBrowseUrl: "" */
     	  /* filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
 	      filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images', 
 	      filebrowserUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files', */
 	      /* filebrowserImageUploadUrl: '/ckupload?command=QuickUpload&type=Images'
			  fulebrowserUploadMethod : "form" */
        });
</script>
    <!-- Logout Modal-->
    <div class="modal fade" id="pictureModal" >
        <div class="modal-dialog modal-xl" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Image Detail</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                	<img class="mw-100" src="">
                </div>
            </div>
        </div>
    </div>

    </div>
    <!-- End of Page Wrapper -->
<script>

$(function() {
	var result = '${result}';
});
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
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>
<%-- <jsp:include page="../includes/foot.jsp" /> --%>
</body>

</html>