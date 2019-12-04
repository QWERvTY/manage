<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>(주)케이씨에스 영업 관리 시스템 - 예산 작성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Prata&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="resources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="resources/css/nouislider.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/custom.css">

<!-- Favicon -->
<link href="resources/images/kcsfav.png" rel="shortcut icon" />

</head>
<body>
<c:set var="userNum"><sec:authentication property="principal.user.userNum"/></c:set>
<div class="main-section">
<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>

	

<form action="/businessPlan" method="POST">
<section class="ftco-section bg-light" id="inputs">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-12">
				<h2 class="heading-section">예산 작성</h2>
			</div>
		</div>
		<input type="hidden" name="userNum" value="${userNum }" />
		<div class="row">
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="projectName" class="form-control" required>
					<label class="form-control-placeholder" for="projectName">프로젝트명</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<select name="sort1" class="form-control">
						<option value="1">상품</option>
						<option value="2">유지보수</option>
						<option value="3">개발</option>
					</select>
					<label class="form-control-placeholder" for="sort1">구분1</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<select name="sort2" class="form-control">
						<option value="1">Nonstop</option>
						<option value="2">ACI</option>
						<option value="3">HSM</option>
						<option value="4">Oracle</option>
						<option value="5">OGG</option>
						<option value="6">Solution</option>
						<option value="7">이벤트</option>
					</select>
					<label class="form-control-placeholder" for="sort2">구분2</label>			
				</div>
			</div>
		</div><br><br>
		
		<div class="row">
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="expectedSales" class="form-control" required>
					<label class="form-control-placeholder" for="expectedSales">예상매출액</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="expectedPurchase" class="form-control" required>
					<label class="form-control-placeholder" for="expectedPurchase">예상매입금</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="expectedProfit" class="form-control" required>
					<label class="form-control-placeholder" for="expectedProfit">예상이익</label>			
				</div>
			</div>
		</div><br>
		
		<div class="row">
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="month" name="expectedSalesMonth" class="form-control" value="2019-12" required>
					<label class="form-control-placeholder" for="expectedSalesMonth">예상매출월</label>		
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<select name="state" class="form-control">
						<option value="1">Lead</option>
						<option value="2">Opportunity</option>
						<option value="3">Negotiation</option>
						<option value="4">Win</option>
						<option value="5">Lose</option>
					</select>
					<label class="form-control-placeholder" for="state">상태</label>			
				</div>
			</div>
		</div><br><br>
		
		<div class="row">
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="endUser" class="form-control" required>
					<label class="form-control-placeholder" for="endUser">최종사용자</label>		
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="customer" class="form-control" required>
					<label class="form-control-placeholder" for="customer">납품처</label>			
				</div>
			</div>
		</div><br>
		
		<div class="row">
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="customerName" class="form-control" required>
					<label class="form-control-placeholder" for="customerName">고객명</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="text" name="customerPhone" class="form-control" required>
					<label class="form-control-placeholder" for="customerPhone">고객연락처</label>			
				</div>
			</div>
			<div class="col-lg-3 col-sm-4">
				<div class="form-group">
					<input type="email" name="customerEmail" class="form-control" required>
					<label class="form-control-placeholder" for="customerEmail">고객이메일</label>			
				</div>
			</div>
		</div><br><br>
		
		<div class="row">
			<div class="col-lg-9 col-sm-4">
				<div class="form-group">
					<input type="text" name="note" id="note" class="form-control" required>
					<label class="form-control-placeholder" for="note">비고</label>			
				</div>
			</div>
		</div><br>
		<button class="btn btn-primary">확인</button>
		<button type="reset" class="btn btn-primary" style="float: right;" >다시 작성</button>
	</div>
</section>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<!-- - - - - -end- - - - -  -->


<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>

</div>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/jquery.waypoints.min.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/aos.js"></script>

<script src="resources/js/nouislider.min.js"></script>
<script src="resources/js/moment-with-locales.min.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/main.js"></script>

</body>
</html>