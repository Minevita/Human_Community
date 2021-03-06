<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../includes/head.jsp" />
</head>
<!-- header 헤더 -->
<jsp:include page="../includes/header.jsp" />
<body>
	<main class="payment">
		<form action="payment" method="post">
		   <h3>결제정보</h3>
		   <div class="paymentTable">
		       <table>
		           <colgroup>
		              <col style="width:133px;">
		              <col>
		          </colgroup>
		          <tbody>
		          <tr>
		              <th class="ta-l">상품 금액</th>
		              <td>
		                  <strong class="total" id="totalGoodsPrice">3,200원</strong>
		              </td>
		          </tr>
		          <tr>
		              <th class="ta-l c-red">결제 금액</th>
		              <td class="final">
		                  <span class="c-red">
		                  <input type="hidden" name="settlePrice" value="5420">
		                  <input type="hidden" name="overseasSettlePrice" value="0" />
		                  <input type="hidden" name="overseasSettleCurrency" value="KRW" />
		                  <strong id="totalSettlePrice">5,420</strong>원</span>
		              </td>
		          </tr>
		          </tbody>
		          <input type="hidden" value="<sec:authentication property="principal.memberVo.id"/>" name="id">
		          <input type="hidden" value="<sec:authentication property="principal.memberVo.name"/>" name="name">
		          <input type="hidden" value="<sec:authentication property="principal.memberVo.email"/>" name="email">
		          <input type="hidden" value="<sec:authentication property="principal.memberVo.phone"/>" name="phone">
		          <input type="hidden" value="<sec:authentication property="principal.memberVo.address"/>" name="address">
		          <button class="custom-btn btn-5 tn-5-1">결제하기</button>
		      </table>
		      
	      	</div>
		</form>
	</main>
    <jsp:include page="../includes/footer.jsp" />
    </div>
</div>
</body>
<script>
	var id = ${id};
	console.log(id);
	function iamport(){
		//가맹점 식별코드
		IMP.init('imp42133316');
		IMP.request_pay({
		    pg : 'kakao',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '강좌1 이용권' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'alex255@naver.com',
		    buyer_name : '김문수',
		    buyer_tel : '010-3332-3680',
		    buyer_addr : '서울특별시 영등포구 도영로 2-5',
		    buyer_postcode : '07376',
		    m_redirect_url : 'http://localhost:8080/orderCompleteMobile'
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
		        	$.ajax({
		        		
		        	})
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}
</script>
</html>