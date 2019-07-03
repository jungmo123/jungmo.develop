<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/main.css" />">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src = "<c:url value = "/js/Navigation.js" />"></script>
<style>
	#content{
		width:900px;
	}
	#content > strong{
		font-size:20px;
	}
</style>
</head>
<body>

	<div class="container">
		<%@ include file = "../header/userheader.jsp" %>
		<div id="content" class = "center-block">
			<strong>&#124;&nbsp;이용약관</strong>
			<hr>
			<div id = "acceessTerms">
<pre>
라라마켓 이용안내

■ 회원가입안내
① 저희 라라마켓은 기본적으로는 회원제로 운영하고 있습니다. 
② 회원가입비나 월회비, 연회비등 어떠한 비용도 청구하지 않는 100% 무료 입니다. 
③ 회원 가입시 기본 가입 축하금으로 OOO원 의 마일리지가 지급됩니다. 
④ 구매시 상품별로 적용된 마일리지는는 OOO원 이상이면 사용하실 수가 있습니다. 

■ 마일리지 제도
① 저희라라마켓은 마일리지를 사용할 수 있습니다. 
② 마일리지 100점은 현금 100원과 같습니다. 
③ 마일리지는 OOO원 이상되어야 사용하실 수가 있고 OOO원 이 넘는 금액의 적립금은 사용하실 수가 없습니다.

■ 상품주문방법
저희라라마켓에서 상품을 주문하는 방법은 크게 6단계입니다. 
① 상품검색 
② 쇼핑백에 담기 
③ 회원ID 로그인 또는 비회원 주문 
④ 주문서 작성 
⑤ 결제방법 선택 및 결제 
⑥ 주문 성공 화면 (주문번호) 
⑦ 비회원 주문인 경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 
※ 단, 회원인 경우 자동 저장되므로 따로 관리하실 필요가 없습니다.

■ 주문확인 및 실시간 배송조회시스템
라라마켓에서 주문을 하셨을 경우 주문/배송 확인을 통해서 실제 주문이 어떻게 처리되고 있는지 확인 하실 수 있습니다. 회원페이지에서 주문/배송 확인을 클릭해 보세요. 
회원일 경우 ID와 비밀번호를 입력하시면 되고 비회원으로 주문하셨을 경우, 주문하셨을때 입력했던 메일을 입력하시면 됩니다. (주문시 입력했던 이름을 정확하게 입력하셔야 합니다. 주문자의 이름을 입력하는 것은 본인 확인을 위해서 입니다.) 
현재 배송은 OO택배 서비스를 이용하고 있습니다. 본 서비스는 상품 추적을 통해 상품이 어디쯤 도착해 있는지 실시간으로 추적하실 수 있습니다. 

■ 안전한 대금 결제 시스템
저희 라라마켓은 무통장 입금과 신용카드의 두 가지 결제방법을 제공하여 드립니다. 
무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 되고, 신용카드 결제는 OOOPG사의 전자결제를 이용하므로 보안문제는 걱정하지 않으셔도 되며, 고객님의 이용내역서에는 ㈜OOO으로 기록됩니다. 
이용 가능한 국내 발행 신용카드 
- 국내발행 모든 신용카드 
이용 가능한 해외 발생 신용카드 
- VISA Card, MASTER Card, AMEX Card 
무통장 입금 가능 은행 
- OO은행, OO은행 
무통장 입금시의 송금자 이름은 주문시 입력하신 주문자의 실명이어야 합니다.

■ 배송기간 및 배송방법
고객님이 무통장 입금으로 주문하신 경우에는 입금하신 날로부터, 신용카드로 구매하신 경우에는 구매하신 날로부터 2-3일 이내에(최장 7일이내) 입력하신 배송처로 주문상품이 도착하게 됩니다. 주문하신 상품에 따라 배송기간이 조금 상이할 수 있습니다. 
주문하실 때 희망 배송일자를 넉넉히 잡아주시면(3일이상) 원하시는 날짜에 배송할 수 있도록 최선을 다하겠습니다. 
저희 라라마켓에서는 구입하신 상품의 배송 방법을 OO택배 서비스를 원칙으로 하고 있습니다. (배송방법은 상품 종류에 따라 상이할 수 있습니다.)

■ 주문취소, 교환 및 환불
라라마켓은 소비자의보호를 위해서 규정한 제반 법규를 준수합니다. 
주문 취소는 미결재인 상태에서는 고객님이 직접 취소하실 수가 있습니다. 결제후 취소는 저희 고객센터로 문의해 주시기 바랍니다. 
무통장 입금의 경우 일정기간동안 송금을 하지 않으면 자동 주문 취소가 되고, 구매자가 원하는 경우 인터넷에서 바로 취소 하실 수도 있으며, 송금을 하신 경우에는 환불조치 해드립니다. 
카드로 결제하신 경우, 승인 취소가 가능하면 취소을 해드리지만 승인 취소가 불가능한 경우 해당 금액을 모두 송금해 드립니다. 
반송을 하실 때에는 주문번호, 회원번호를 메모하여 보내주시면 보다 신속한 처리에 도움이 됩니다.
</pre>			
			</div>
		</div>
	</div>

</body>
</html>